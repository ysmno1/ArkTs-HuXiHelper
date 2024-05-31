// @ts-nocheck
import router from '@ohos.router'
import prompt from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
import UserTable from '../common/database/tables/UserTable';
import UserData from '../viewmodel/UserData';
@Entry
@Component
export struct Register {
  private inputusername ='';
  private inputpassword='';
  @State user: Array<UserData> = [];
  @State newUser: UserData = { id: 0, username:'', password:''};
  private UserTable = new UserTable(() => {});
  accept(newUser: UserData): void {
       this.UserTable.insertData(newUser, () => {});
  }

  build() {
    Column() {
      Image($r('app.media.user'))
        .height(150)
        .width(150)
        .margin({top:80,bottom:40})
      Text("欢迎注册")
        .fontSize(30)


      TextInput({
        placeholder:"请输入你的账号",
      })
        .width('90%')
        .height(50)
        .margin(20)
        .borderRadius(0)
        .type(InputType.Normal)
        .onChange((value: string) => {
          this.inputusername = value;
        }).backgroundColor(Color.White)

      TextInput({ placeholder:"请输入你的密码"})
        .width('90%')
        .height(50)
        .margin(20)
        .borderRadius(0)
        .type(InputType.Password)
        .onChange((value: string) => {
          this.inputpassword = value;
        }).backgroundColor(Color.White)

      Text('已有账号？去登录')
        .fontSize(18)
        .fontColor('#daa520')
        .decoration({ type: TextDecorationType.Underline, color:('#daa520') })
        .textAlign(TextAlign.Start)
        .onClick(() => {
          router.back();
        })
      Button('注册',{type:ButtonType.Capsule})
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
            this.newUser.username = this.inputusername;
            this.newUser.password = this.inputpassword;
            this.accept(this.newUser);
            prompt.showToast({ message: CommonConstants.TOAST_TEXT_5, bottom: CommonConstants.PROMPT_BOTTOM });
            router.back();
          }
        })

    }.width('100%').height('100%').backgroundImage($r('app.media.loginbg'))
    .backgroundImageSize(ImageSize.Cover)

  }

}
