// @ts-nocheck
// xxx.ets
import Comp_me, { Comp_me } from '../view/MyinfoComponent';
import PlanComponent from '../view/PlanComponent';
import { Map } from '../view/MapComponent';
import { Zones } from '../view/CollegesComponent';
@Entry
@Component
struct TabContentExample {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#ffa500'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder0(index: number) {
    Column() {
      Image(this.currentIndex === index ? $rawfile('account_select.png') : $rawfile('account.png'))
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(`计划Helper`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }
  @Builder TabBuilder1(index: number) {
    Column() {
      Image(this.currentIndex === index ? $rawfile('graph_select.png') : $rawfile('graph.png'))
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(`地图Helper`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }
  @Builder TabBuilder2(index: number) {
    Column() {
      Image(this.currentIndex === index ? $rawfile('mouny_select.png') : $rawfile('mouny.png'))
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(`资讯Helper`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }
  @Builder TabBuilder3(index: number) {
    Column() {
      Image(this.currentIndex === index ? $rawfile('me_select.png') : $rawfile('me.png'))
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(`我的Helper`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {

        TabContent() {
          Zones()
        }.tabBar(this.TabBuilder2(0))

        TabContent() {
          PlanComponent()()
        }.tabBar(this.TabBuilder0(1))

        TabContent() {
          Map()
        }.tabBar(this.TabBuilder1(2))


        TabContent() {
          Comp_me()
        }.tabBar(this.TabBuilder3(3))
      }
      .vertical(false)
      .barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}