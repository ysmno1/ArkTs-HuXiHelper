import router from '@ohos.router'
import prompt from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
import UserTable from '../common/database/tables/UserTable';
import UserData from '../viewmodel/UserData';
@Entry
@Component
struct Login {
  @State myWidth: number = 500;
  @State myHeight: number = 500;
  @State top: number = -20;
  // 标志位，true和false分别对应一组myWidth、myHeight值
  @State flag: boolean = false;
  private inputusername ='';
  private inputpassword='';
  @State user: Array<UserData> = [];
  @State newUser: UserData = { id: 0, username:'', password:'',realname:''};
  private UserTable = new UserTable(() => {});
  accept(newUser: UserData): void {
    this.UserTable.query(newUser, function(result) {
      if(result===-1){
        prompt.showToast({ message: '用户名未注册', bottom: CommonConstants.PROMPT_BOTTOM });
      }else if(result===true){
        prompt.showToast({ message: '登录成功', bottom: CommonConstants.PROMPT_BOTTOM });
        router.pushUrl({ url: 'pages/MainPage' })
      }else if(result===false){
        prompt.showToast({ message: '用户名与密码不匹配', bottom: CommonConstants.PROMPT_BOTTOM });
      }else{
        prompt.showToast({ message: '?', bottom: CommonConstants.PROMPT_BOTTOM });
      }
    });
  }
  build() {
    Column() {
      Image($r('app.media.user'))
        .width(this.myWidth)
        .height(this.myHeight)
        .margin({top:this.top,bottom:40})
        .onClick(() => {
          animateTo({ duration: 1000, curve: Curve.Ease }, () => {
            // 动画闭包中根据标志位改变控制第一个Button宽高的状态变量，使第一个Button做宽高动画
            if (this.flag) {
              this.myWidth = 500;
              this.myHeight = 500;
              this.top = -30;
            } else {
              this.myWidth = 150;
              this.myHeight = 150;
              this.top = 80;
            }
            this.flag = !this.flag;
          });
        })
      if(this.flag === false){

        Image($r('app.media.title'))
          .width('350vp')
          .borderRadius('10vp')
          .margin({bottom:'15vp'})
      }
      Text("欢迎登录")
        .fontSize(30)
        .fontColor('#daa520')

      TextInput({ placeholder:"账号"})
        .width('90%')
        .height(50)
        .margin(20)
        .borderRadius(0)
        .type(InputType.Normal)
        .onChange((value: string) => {
          this.inputusername = value;
        }).backgroundColor(Color.White)

      TextInput({ placeholder:"密码"})
        .width('90%')
        .height(50)
        .margin(20)
        .borderRadius(0)
        .type(InputType.Password)
        .onChange((value: string) => {
          this.inputpassword = value;
        }).backgroundColor(Color.White)

      Row() {
        Text('还没有账号？去注册')
          .fontSize(18)
          .fontColor('#daa520')
          .decoration({ type: TextDecorationType.Underline, color:('#daa520') })
          .textAlign(TextAlign.Start)
          .onClick(() => {
            router.pushUrl({ url: 'pages/RegisterPage' })
          })
        Blank(120);
        Text('忘记密码')
          .fontSize(18)
          .fontColor('#daa520')
          .decoration({ type: TextDecorationType.Underline, color:('#daa520') })
          .textAlign(TextAlign.Start)
          .onClick(() => {
            router.pushUrl({ url: 'pages/ForgetPage' })
          })
      }


      Button('登录',{type:ButtonType.Capsule})
        .backgroundColor('#004ea2')
        .fontColor(Color.White)
        .width(200)
        .height(55)
        .fontSize(30)
        .margin(30)
        .borderRadius(30)
        .onClick(() => {
          if (this.inputpassword === ''||this.inputusername === '') {
            prompt.showToast({ message: CommonConstants.TOAST_TEXT_4, bottom: CommonConstants.PROMPT_BOTTOM });
          } else {
            this.newUser.username=this.inputusername;
            this.newUser.password=this.inputpassword;
            this.accept(this.newUser);
            prompt.showToast({ message: CommonConstants.TOAST_TEXT_5, bottom: CommonConstants.PROMPT_BOTTOM });
          }
        })
    }.width('100%').height('100%')
    .backgroundImage($r('app.media.loginbg'))
    .backgroundImageSize(ImageSize.Cover)
  }

}
