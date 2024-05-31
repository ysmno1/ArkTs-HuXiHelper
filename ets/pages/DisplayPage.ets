import CommonConstants from '../common/constants/CommonConstants'
import AccountTable from '../common/database/tables/PlanTable';
import AccountData from '../viewmodel/PlanData';
import { DialogComponent } from '../view/DialogComponent';
import { ImageList } from '../viewmodel/PlanList';
import Logger from '../common/utils/Logger';
import promptAction from '@ohos.promptAction';
import web_webview from '@ohos.web.webview'
import router from '@ohos.router';

@Entry
@Component


struct AppPage {
  @State rating: number = 0
  @State accounts: Array<AccountData> = [];
  @State searchText: string = '';
  @State searchtype: string = '暂无查找';
  @State searchcheck: number= 1;
  @State isInsert: boolean = false;
  @State newAccount: AccountData = { id: 0, accountType: 0, typeText: '', amount: '未完成' ,Date:'',remark:''};
  @State index: number = -1;
  @State totalint: number = 0;
  @State totalout: number = 0;


  controller1: web_webview.WebviewController = new web_webview.WebviewController()
  scroller: Scroller = new Scroller()
  private AccountTable = new AccountTable(() => {});
  private timetable: any = [
    {
      title:'大二上课程概览',
      projects:['数据结构与算法', '数字逻辑']
    },
    {
      title:'大二下课程概览',
      projects:['计算机组成原理', '数据库系统', '机器学习']
    },
    {
      title:'大三上课程概览',
      projects:['计算机网络', '操作系统', '软件工程','移动应用开发']
    },
    {
      title:'大三下课程概览',
      projects:['编译原理', '网络安全概述']
    }
  ]


  @Builder itemStart(index: number,item) {
    Column() {
      Text('您的打分是' + this.rating)
        .fontSize(12)
        .fontColor(Color.White)
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


  @Builder itemEnd(index: number,item) {
    Button({ type: ButtonType.Normal }) {
      Text('资源')
        .fontSize(15)
        .fontColor(Color.White)
    }
    .width(55)
    .height(50)
    .borderRadius($r('app.float.radius_size_M'))
    .backgroundColor('#004ea2')
    .onClick(() => {
      router.pushUrl({ url: 'pages/HelpPage' })
    })

  }

  @Builder itemHead(text:string) {
    Text(text)
      .fontSize(20)
      .fontColor(Color.White)
      .backgroundColor('#daa520')
      .width("100%")
      .padding(10)
  }

  @Builder itemFoot(num:number) {
    Text('共' + num + "节课")
      .fontSize(16)
      .fontColor(Color.White)
      .backgroundColor('#daa520')
      .width("100%")
      .padding(5)
  }

  controller: TextClockController = new TextClockController();
  searchController: SearchController = new SearchController();
  private scrollerForList: Scroller = new Scroller()

  build() {
    Column(){
      Column(){
        Row() {
          Image($r('app.media.user'))
            .width('90vp')
            .height('90vp')
            .margin({ top: '10vp' })

          Row({space: 5}) {
            Text('计算机学院')
              .height($r('app.float.component_size_SP'))
              .fontSize(30)
              .fontColor('#daa520')
          }.margin({top:'10vp'})
        }
        Column({space: 5}) {
          Text('学院简介')
            .height($r('app.float.component_size_SP'))
            .fontSize(20)
          .fontColor('#daa520')
          Column({space: 5}) {
            Scroll(this.scroller) {
              Text('重庆大学计算机学院是我国高校最早开展计算机研究的基地之一，1978年和1986年获西南地区首个硕士和博士点，1998年成立计算机学院，2003年获批一级学科博士点。目前学院拥有计算机科学与技术一级学科博士学位授予点，计算机科学与技术博士后科研工作流动站，计算机软件与理论国家重点培育学科，信息物理社会可信服务计算（CPS）教育部重点实验室，曙光计算机科学教育部基础学科拔尖学生培养计划2.0基地（重庆市高校唯一），软件理论与技术重庆市重点实验室，计算机基础重庆市级实验教学示范中心。计算机学科在陈廷槐、童頫、程代杰和吴中福等老一辈学科带头人的带领下，在国内开创了容错计算、并行分布式处理等研究领域，不仅培养出徐杰、黄开源、沈一栋等著名学者，并且上世纪80年代在德国Springer出版《容错计算》专著，产出一系列国际领先成果。学院计算机学科一直保持ESI全球前1%的排名，尤其是人工神经网络研究领域的ESI排名处于世界12位。学院现有教职工130余人，其中管理9人，专任教师100余人；专任教师中正高30余人，副高40余人；IEEE Fellow 以及各类人才40余人次。现有在校博士生约100人，硕士生500余人，本科生二三四年级合计900余人。')
                .fontSize(15)
                .fontColor(Color.Black)
            }
            .scrollable(ScrollDirection.Vertical)
          }
          .height(70)


    Column() {
      Text('精品课程')
        .height($r('app.float.component_size_SP'))
        .fontSize(20)
        .fontColor('#daa520')

      List({ space: 20 }) {
        ForEach(this.timetable, (item) => {
          ListItemGroup({ header:this.itemHead(item.title), footer:this.itemFoot(item.projects.length) }) {
            ForEach(item.projects, (project) => {
              ListItem() {
                Row() {
                  Text(project)
                    .width("100%")
                    .height(100)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)

                }
                .backgroundColor(Color.White)
                .borderRadius($r('app.float.radius_size_M'))
              }
              .width('95%')
              .height($r('app.float.component_size_LM'))
              .swipeAction({ end: () => {
                this.itemEnd(this.index, item)
              }
              })
              .swipeAction({ start: () => {
                this.itemStart(this.index, item)
              }
              })
            })
          }
          .borderRadius(20)
          .divider({ strokeWidth: 1, color: '#6e4175' }) // 每行之间的分界线
        })
      }
      .width('90%')
      .sticky(StickyStyle.Header|StickyStyle.Footer)
    }.width('100%').height('100%')
    .backgroundColor('#6e4175')
    .padding({ top: 5 })



          Column() {
            Rating({ rating: this.rating, indicator: false })
              .stars(5)
              .stepSize(0.5)
              .margin({ top: 24 })
              .onChange((value: number) => {
                this.rating = value
              })
            Text('您的打分是' + this.rating)
              .fontSize(16)
              .fontColor('rgba(24,36,49,0.60)')
              .margin({ top: 16 })
          }.width(360).height(93).backgroundColor('#FFFFFF').margin({ top: 68 })


        }
        .alignItems(HorizontalAlign.Start)
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