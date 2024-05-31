import AccountTable from '../common/database/tables/PlanTable';
import AccountData from '../viewmodel/PlanData';

@Entry
@Component


struct ShowPage {

  @State rating: number = 0
  scroller: Scroller = new Scroller()

  build() {
    Column(){
      Column(){
        Image($r('app.media.user'))
          .width('70vp')
          .height('70vp')
          .margin({ top:'20vp' })

        Column({space: 5}) {
          Row({space: 5}) {
            Text('重庆大学图书馆')
              .height($r('app.float.component_size_SP'))
              .fontSize(30)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          }.margin({top:'10vp'})

          Image($r('app.media.tsg' ))
            .width('95%')
            .height('40%')

          Scroll(this.scroller) {
            Text('重庆大学图书馆在三个校区（A 区、B 区、虎溪校区）均拥有独立馆舍， 并在理学楼设有理学分馆、虎溪校区设有舍区图书馆——松园书屋、竹园书屋、黄葛书屋、兰园书屋，共计面积 59362 平方米，提供 5465个阅览座位。图书馆均具有完善的网络设施，并通过万兆骨干网与校园网相联，全馆实现无线网覆盖。数字图书馆全天候为读者服务，拥有 21 台物理主机，以及 406 TB 的存储空间。')
              .fontSize(20)
              .fontColor(Color.Black)
          }

        }
        .alignItems(HorizontalAlign.Start)
      }.width('94%')
      .height('90%')
      .borderRadius('20vp')
      .margin({ top: ('20vp') })
      .alignItems(HorizontalAlign.Center)
    }.width('100%')
    .height('100%')
    .backgroundImage($r('app.media.loginbg'))
    .backgroundImageSize(ImageSize.Cover)
  }
}