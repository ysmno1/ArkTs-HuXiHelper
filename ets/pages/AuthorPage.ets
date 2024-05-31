import CommonConstants from '../common/constants/CommonConstants'
@Component
@Entry
export default struct AuthorPage {
  @State rating: number = 0
build(){
    Column() {

      Column() {


      }
      .backgroundImage($r('app.media.bg1'))
      .backgroundImageSize(ImageSize.Cover)
      .width('80%')
      .height('80%')

      Column() {
        Text(`来给作者打个分!`)
          .fontSize(30)
          .fontWeight(500)
        Text('您的打分是' + this.rating)
          .fontSize(12)
          .fontColor('#daa520')
          .margin({ top: 5 })
        Rating({ rating: this.rating, indicator: false })
          .stars(5)
          .stepSize(0.5)
          .margin({ top: 10 })
          .onChange((value: number) => {
            this.rating = value
          })
      }

    }
    .width('100%')
    .height('100%')
}
}