
import router from '@ohos.router';
import ZonesItem from '../viewmodel/CollegesItem';
import { CommonConstants1 as Const } from '../common/constants/CommonConstants1';
import { CollegesConstants as ZoneConst } from '../common/constants/CollegesConstants';
import ZonesViewModel from '../viewmodel/CollegesViewModel';

@Component
export struct Zones {
  private changedIndex: boolean = true;
  private zonesList: ZonesItem[] = ZonesViewModel.getZonesList();
  private swiperController: SwiperController = new SwiperController()
  @State aheadIndex: number = ZoneConst.HALF_COUNT;
  @State marginBottom: number = 0;
  @State start: boolean = true
  private fromStart: boolean = true
  private step: number = 50
  private loop: number = Infinity
  private src: string = "欢迎您在重庆大学虎溪Helper上查询各个学院的信息！"

  getImgCoefficients(index?: number): number {
    if (index === undefined) {
      return 0;
    }
    let coefficient = this.aheadIndex - index;
    let tempCoefficient = Math.abs(coefficient);
    if (tempCoefficient <= ZoneConst.HALF_COUNT) {
      return coefficient;
    }
    let dataLength = this.zonesList.length;
    let tempOffset = dataLength - tempCoefficient;
    if (tempOffset <= ZoneConst.HALF_COUNT) {
      if (coefficient > 0) {
        return -tempOffset;
      }
      return tempOffset;
    }
    return 0;
  }

  getOffSetY(index?: number): number {
    if (index === undefined) {
      return 0;
    }
    let offsetIndex = this.getImgCoefficients(index);
    let tempOffset = Math.abs(offsetIndex);
    let offsetY = this.marginBottom / (tempOffset + 1);
    if (tempOffset === 1) {
      offsetY += -offsetIndex * ZoneConst.MAX_OFFSET_Y;
    } else if (tempOffset === ZoneConst.HALF_COUNT) {
      offsetY += -offsetIndex * (ZoneConst.MAX_OFFSET_Y - ZoneConst.OFFSET_COEFFICIENTS);
    }
    return offsetY;
  }

  startAnimation(isUp: boolean): void {
    animateTo({
      duration: Const.SWIPER_DURATION,
    }, () => {
      let dataLength = this.zonesList.length;
      let tempIndex = isUp ? this.aheadIndex + 1 : dataLength + this.aheadIndex - 1;
      this.aheadIndex = tempIndex % dataLength;
      this.marginBottom = 0;
    });
  }

  handlePanGesture(offsetY: number): void {
    if (Math.abs(offsetY) < ZoneConst.MAX_MOVE_OFFSET) {
      this.marginBottom = offsetY;
    } else {
      if (this.changedIndex) {
        return;
      }
      this.changedIndex = true;
      this.startAnimation(offsetY < 0);
    }
  }

  build() {
    Column() {
      Text('资讯Helper')
        .fontSize(30)
        .textAlign(TextAlign.Start)

      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.src
      })
        .width(360)
        .height(30)
        .fontColor('#000000')
        .fontSize(20)
        .fontWeight(300)
        .borderRadius('10vp')
        .margin({top:8})
        .backgroundColor(Color.White)

      Swiper(this.swiperController) {
        Image($r('app.media.9'))
          .width('90%')
          .height('100%')
          .borderRadius('20vp')
          .borderColor(Color.White)
          .borderWidth(3)

        Image($r('app.media.8'))
          .width('90%')
          .height('100%')
          .borderRadius('20vp')
          .borderColor(Color.White)
          .borderWidth(3)

        Image($r('app.media.7'))
          .width('90%')
          .height('100%')
          .borderRadius('20vp')
          .borderColor(Color.White)
          .borderWidth(3)
      }
      .loop(true)
      .autoPlay(true)
      .interval(2000)
      .indicator(false)
      .margin({top:8})
      .height(120)
      .width('95%')

      Navigation() {
        Stack() {
          ForEach(this.zonesList, (item: ZonesItem, index?: number) => {
            Row() {
              Image(item.thumbnail)
                .objectFit(ImageFit.Cover)
                .borderRadius($r('app.float.common_border_radius'))
                .margin({ bottom: Const.SHADOW_RADIUS })
                .shadow({
                  radius: Const.SHADOW_RADIUS,
                  color: `rgba(0,0,0,0.3)`,
                  offsetY: Const.SHADOW_RADIUS / Const.DOUBLE_NUM
                })
                .opacity(1 - Math.min(ZoneConst.HALF_COUNT,
                  Math.abs(this.getImgCoefficients(index))) * ZoneConst.OPACITY_COEFFICIENTS)
                .blur(ZoneConst.OFFSET_COEFFICIENTS * Math.abs(this.getImgCoefficients(index)))
            }
            .width(320)
            .height(50)
            .aspectRatio(Const.SWIPER_ASPECT_RATIO)
            .borderRadius($r('app.float.common_border_radius'))
            .offset({ x: 0, y: this.getOffSetY(index) })
            .zIndex(index !== this.aheadIndex && this.getImgCoefficients(index) === 0
              ? 0 : ZoneConst.HALF_COUNT - Math.abs(this.getImgCoefficients(index)))
          }, (item: ZonesItem) => JSON.stringify(item))
        }
        .width(Const.FULL_PERCENT)
        .height(Const.FULL_PERCENT)
        //.margin({ top: Const.SHADOW_RADIUS / Const.DOUBLE_NUM })
        .alignContent(Alignment.Center)
        .onClick(() => {
          //router.pushUrl({ url: 'pages/IntroductionPage', params: { id: this.zonesList[this.aheadIndex].id } })
          router.pushUrl({ url: 'pages/DisplayPage' })
        })
        .gesture(
          PanGesture({ direction: PanDirection.Vertical })
            .onActionStart((event: GestureEvent | undefined) => {
              if (!event) {
                return;
              }
              this.changedIndex = false;
              this.handlePanGesture(event.offsetY);
            })
            .onActionUpdate((event: GestureEvent | undefined) => {
              if (!event) {
                return;
              }
              this.handlePanGesture(event.offsetY);
            })
            .onActionEnd(() => {
              animateTo({
                duration: Const.SWIPER_DURATION,
              }, () => {
                this.marginBottom = 0;
              });
            })
        )
      }
      .margin({ top:'-210vp' })
      .hideBackButton(true)
    }
    .width('100%').height('100%')
    .backgroundImage($r('app.media.bg2'))
    .backgroundImageSize(ImageSize.Cover)

  }
}