import UserTable from '../common/database/tables/UserTable';
import UserData from '../viewmodel/UserData';
import router from '@ohos.router'
@Component
export default struct Comp_me {
  private swiperController: SwiperController = new SwiperController()
  @State newUser: UserData = { id:-1, username: '', password: '', realname: ''};
  @State user: Array<UserData> = [];
  @State start: boolean = true
  private fromStart: boolean = true
  private step: number = 50
  private loop: number = Infinity
  private src: string = "重庆大学虎溪Helper, 助力您的每一天虎溪生活"
  private UserTable = new UserTable(() => {});

  private tsp: UserData

  // aboutToAppear(){
  //   this.UserTable.getRdbStore(() => {
  //     this.UserTable.query1('', (result: UserData[]) => {
  //       this.user = result;
  //     }, true);
  //   });
  // }




  build() {
    Column(){
      Text('我的Helper')
        .fontSize(30)
        .textAlign(TextAlign.Start)

      Row() {
        Image($r('app.media.user'))
          .width('60vp')
          .height('60vp')
          .margin({ right:'30vp' })

        Text('用户: ysm'/*+ this.user[1]*/ )
          .height('60vp')
          .fontSize('20vp')
          .fontColor(Color.White)
          .margin({ right:'30vp' })

        Text('欢迎登录！')
          .height('60vp')
          .fontSize('20vp')

      }.margin({ left:'0vp',top:'30vp',bottom:'10vp' })

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
        .backgroundColor(Color.White)



      Column() {
        Swiper(this.swiperController) {
          Image($r('app.media.1'))
            .width('90%')
            .height('100%')
            .borderRadius('20vp')
            .borderColor(Color.White)
            .borderWidth(3)

          Image($r('app.media.2'))
            .width('90%')
            .height('100%')
            .borderRadius('20vp')
            .borderColor(Color.White)
            .borderWidth(3)

          Image($r('app.media.3'))
            .width('90%')
            .height('100%')
            .borderRadius('20vp')
            .borderColor(Color.White)
            .borderWidth(3)

          Image($r('app.media.4'))
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
      }.height(270).width('94%')
      .margin({ left:'0vp',top:'10vp',bottom:'20vp' })
      .borderRadius('20vp')



      List({ space: 1 }) {
        ListItem() {
          Row() {
            Image($rawfile('mima.png'))
              .width(40)
              .height(40)
              .margin(10)

            Text('修改密码')
              .fontSize(15)

            Blank()
              .layoutWeight(1)

            Image($rawfile('enter.png'))
              .width(30)
              .height(30)
              .margin(10)
          }.onClick(() => {
            router.pushUrl({ url: 'pages/ForgetPage' })
          })
        }

        ListItem() {
          Row() {
            Image($rawfile('zhinan.png'))
              .width(40)
              .height(40)
              .margin(10)

            Text('小游戏')
              .fontSize(15)

            Blank()
              .layoutWeight(1)

            Image($rawfile('enter.png'))
              .width(30)
              .height(30)
              .margin(10)
          }
        }.onClick(() => {
          router.pushUrl({ url: 'pages/ZhuanPage' })
        })
        ListItem() {
          Row() {
            Image($rawfile('guanyu.png'))
              .width(40)
              .height(40)
              .margin(10)

            Text('关于作者')
              .fontSize(15)

            Blank()
              .layoutWeight(1)

            Image($rawfile('enter.png'))
              .width(30)
              .height(30)
              .margin(10)
          }.onClick(() => {
            router.pushUrl({ url: 'pages/AuthorPage' })
          })
        }

        ListItem() {
          Row() {
            Image($rawfile('tuichu.png'))
              .width(40)
              .height(40)
              .margin(10)

            Text('退出登录')
              .fontSize(15)

            Blank()
              .layoutWeight(1)

            Image($rawfile('enter.png'))
              .width(30)
              .height(30)
              .margin(10)
          }.onClick(() => {
            router.pushUrl({ url: 'pages/LoginPage' })
          })
        }
      }.divider({
        strokeWidth: 1,
        startMargin: 90,
        endMargin: 10,
        color: '#000000'
      })
      .width('94%')
      .borderRadius($r('app.float.radius_size_L'))
      .backgroundColor(Color.White)
    }.width('100%')
    .height('100%')
    .backgroundImage($r('app.media.bg5'))
    .opacity(0.9)
    .backgroundImageSize(ImageSize.Cover)

  }
  clickNext1() {
    router.pushUrl({
      url: 'pages/TestPage',
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        },
      },
    });
  }
}