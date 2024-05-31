import web_webview from '@ohos.web.webview'

@Entry
@Component

struct HelpPage {

  controller1: web_webview.WebviewController = new web_webview.WebviewController()
  build() {
    Column(){
      Column(){
        Column() {
          Text("ArkTs使用指南")
            .height($r('app.float.component_size_SP'))
            .fontSize(35)
            .height('15%')
          Text("ArkTs是移动应用开发课程非常重要的开发工具，虎溪Helper为您便捷提供OpenHarmony的文档资料")
            .height('35vp')
            .fontSize(15)
        }.alignItems(HorizontalAlign.Center)

        Web({ src: 'https://developer.harmonyos.com/cn/documentation/overview/?catalogVersion=V3', controller: this.controller1 })
      }.width('94%')
      .height('90%')
      .borderRadius('20vp')
      .backgroundColor(Color.White)
      .margin({ top: ('20vp') })
      .alignItems(HorizontalAlign.Center)
    }.width('100%')
    .height('100%')
    .backgroundColor('#6e4175')
  }
}