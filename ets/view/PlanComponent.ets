import AccountTable from '../common/database/tables/PlanTable';
import AccountData from '../viewmodel/PlanData';
import CommonConstants from '../common/constants/CommonConstants';
import { DialogComponent } from '../view/DialogComponent';
import { ImageList } from '../viewmodel/PlanList';
import Logger from '../common/utils/Logger';
import promptAction from '@ohos.promptAction';

const allmenu:string[]=['完成查找','时间查找','备注查找','类型查找']

@Component
export default struct PlanComponent {

  @State accounts: Array<AccountData> = [];
  @State searchText: string = '';
  @State searchtype: string = '暂无查找';
  @State searchcheck: number= 1;
  @State isInsert: boolean = false;
  @State newAccount: AccountData = { id: 0, accountType: 0, typeText: '', amount: '未完成' ,Date:'',remark:''};
  @State index: number = -1;
  @State totalint: number = 0;
  @State totalout: number = 0;
  private AccountTable = new AccountTable(() => {});
  private deleteList: Array<AccountData> = [];



  controller: TextClockController = new TextClockController();
  searchController: SearchController = new SearchController();
  private scrollerForList: Scroller = new Scroller()
  dialogController: CustomDialogController = new CustomDialogController({
    builder: DialogComponent({
      isInsert: $isInsert,
      newAccount: $newAccount,
      confirm: (isInsert: boolean, newAccount: AccountData) => this.accept(isInsert, newAccount)
    }),
    customStyle: true,
    alignment: DialogAlignment.Bottom,
  });




  accept(isInsert: boolean, newAccount: AccountData): void {
    if (isInsert) {
      Logger.info(`${CommonConstants.INDEX_TAG}`, `The account inserted is:  ${JSON.stringify(newAccount)}`);
      this.AccountTable.insertData(newAccount, (id: number) => {
        newAccount.id =id;
        this.accounts.push(newAccount);
      });
    } else {
      this.AccountTable.updateData(newAccount, () => {
      });
      let list = this.accounts;
      this.accounts = [];
      list[this.index] = newAccount;
      this.accounts = list;
      this.index = -1;


    }
  }

  aboutToAppear() {
    this.AccountTable.getRdbStore(() => {
      this.AccountTable.query('', (result: AccountData[]) => {
        this.accounts = result;
      }, true);
    });
  }

  selectListItem(item: AccountData) {
    this.isInsert = false;
    this.index = this.accounts.indexOf(item);
    this.newAccount = {
      id: item.id,
      accountType: item.accountType,
      typeText: item.typeText,
      amount: item.amount,
      Date:item.Date,
      remark:item.remark,
    };
  }

  deleteListItem() {
    for (let i = 0; i < this.deleteList.length; i++) {
      let index = this.accounts.indexOf(this.deleteList[i]);
      this.accounts.splice(index, 1);
      if(this.deleteList[i].accountType === 1){
        this.totalint = this.totalint - 1;
      }else {
        this.totalout = this.totalout - 1;
      }
      this.AccountTable.deleteData(this.deleteList[i], () => {
      });
    }
    this.deleteList = [];
  }

  jisuan(account: AccountData[]) {
    this.totalint = 0;
    this.totalout = 0;
    for (let i = 0;i < account.length; i++) {
      if (account[i].amount == '未完成') {
        this.totalint++;
      }
      else {
        this.totalout++;
      }
    }
  }

  @Builder itemEnd(index: number,item) {
    // 侧滑后尾端出现的组件
    Button({ type: ButtonType.Normal }) {
      Text('删除')
        .fontSize(15)
        .fontColor(Color.White)
    }
    .width(55)
    .height(50)
    .borderRadius($r('app.float.radius_size_M'))
    .backgroundColor(Color.Red)
    .onClick(() => {
      this.deleteList.push(item);
      this.deleteListItem();
    })
  }


  build() {
    Stack() {
      Column() {
        Text('计划Helper')
          .height($r('app.float.component_size_SP'))
          .fontSize(30)
          .align(Alignment.Center)

        Row() {
          Column() {
            TextClock({ timeZoneOffset: -8, controller: this.controller })
              .format('yyyyMMdd')
              .fontSize(20)
              .height($r('app.float.component_size_SP'))
          }.margin({ left: ('12vp') })
        }
        .width(CommonConstants.FULL_WIDTH)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top:('5vp'), bottom: ('0vp') })

        Row(){
          Column() {
            Text('总任务：' + `${this.totalint + this.totalout}`+'项')
              .height($r('app.float.component_size_SP'))
              .fontSize(30)
              .fontColor('#DAA520')
              .margin({ left: ('10vp'), bottom: ('10vp') })
              .align(Alignment.Center)

            Text(`未完成：` + `${this.totalint}` + '项')
              .height($r('app.float.component_size_SP'))
              .fontSize(22)
              .fontColor(Color.White)
              .textAlign(TextAlign.Start)
              .alignSelf(ItemAlign.Start)
              .margin({ left: ('20vp') })

            Text(`已完成：` + `${this.totalout}`+'项')
              .height($r('app.float.component_size_SP'))
              .fontSize(22)
              .fontColor(Color.White)
              .textAlign(TextAlign.Start)
              .alignSelf(ItemAlign.Start)
              .margin({ left: ('20vp') })
          }
          .backgroundImage($r('app.media.bg10'))
          .backgroundImageSize(ImageSize.Cover)
          .opacity(0.9)
          .width('100%')
          .height(120)
          .borderRadius($r('app.float.radius_size_M'))
          .borderWidth($r('app.float.border_size_S'))
          .borderColor($r('app.color.border_color'))

        }
        .width(CommonConstants.FULL_WIDTH)
        //.justifyContent(FlexAlign.SpaceBetween)
        .margin({ top:('5vp'), bottom: ('0vp') })


        Row() {
          Search({
            value: this.searchText,
            placeholder: CommonConstants.SEARCH_TEXT,
            controller: this.searchController
          })
            .width(CommonConstants.FULL_WIDTH)
            .borderRadius($r('app.float.radius_size_M'))
            .borderWidth($r('app.float.border_size_S'))
            .borderColor($r('app.color.border_color'))
            .placeholderFont({ size: $r('app.float.font_size_M') })
            .textFont({ size: $r('app.float.font_size_M') })
            .backgroundColor(Color.White)
            .onChange((searchValue: string) => {
              this.searchText = searchValue;
            })
            .onSubmit((searchValue: string) => {
              if (searchValue === '') {
                this.AccountTable.query('', (result: AccountData[]) => {
                  this.accounts = result;
                  this.jisuan(this.accounts)
                }, true);
              }

              else if(this.searchcheck === 1){
                if(searchValue === 'w'){
                  searchValue = '未完成';
                }
                else if(searchValue === 'y'){
                  searchValue = '已完成';
                }
                this.AccountTable.query(searchValue, (result: AccountData[]) => {
                  this.accounts = result;
                }, false);

              }else if(this.searchcheck === 2){
                this.AccountTable.queryDate(searchValue, (result: AccountData[]) => {
                  this.accounts = result;
                }, false);

              }else if(this.searchcheck === 3){
                this.AccountTable.queryremark(searchValue, (result: AccountData[]) => {
                  this.accounts = result;
                }, false);
              }

              else if(this.searchcheck === 4){
                if(searchValue === 'bg'){
                  searchValue = '报告';
                }else if(searchValue === 'cx'){
                  searchValue = '程序';
                }else if(searchValue === 'lx'){
                  searchValue = '练习';
                }else if(searchValue === 'wz'){
                  searchValue = '文章';
                }else if(searchValue === 'sy'){
                  searchValue = '实验';
                }else if(searchValue === 'xm'){
                  searchValue = '项目';
                }else if(searchValue === 'lw'){
                  searchValue = '论文';
                }else if(searchValue === 'yj'){
                  searchValue = '演讲';
                } else if(searchValue === 'wc'){
                searchValue = '外出';
              }else if(searchValue === 'ly'){
                searchValue = '旅游';
              }else if(searchValue === 'la'){
                searchValue = '恋爱';
              }else if(searchValue === 'jc'){
                searchValue = '聚餐';
              }else if(searchValue === 'yx'){
                searchValue = '游戏';
              }else if(searchValue === 'yd'){
                searchValue = '运动';
              }
              else{
                  promptAction.showToast({ message: '请输入正确的检字组合！' })
                }
                this.AccountTable.queryType(searchValue, (result: AccountData[]) => {
                  this.accounts = result;
                }, false);
              }
            })
        }
        .width(CommonConstants.FULL_WIDTH)
        .padding({ left: $r('app.float.edge_size_M'), right: $r('app.float.edge_size_M') })
        .margin({ top: ('0vp'), bottom: ('2vp') })

        Row({space:6}) {
          Image($r('app.media.edit'))
            .width($r('app.float.component_size_S'))
            .aspectRatio(CommonConstants.FULL_SIZE)
            .bindMenu([
              {
                value:allmenu[0],
                action:()=>{
                  this.searchcheck = 1;
                  this.searchtype='完成查找'
                }
              },
              {
                value: allmenu[1],
                action: () => {
                  this.searchcheck = 2;
                  this.searchtype='时间查找'
                }
              },
              {
                value: allmenu[2],
                action: () => {
                  this.searchcheck = 3;
                  this.searchtype='备注查找'
                }
              },
              {
                value: allmenu[3],
                action: () => {
                  this.searchcheck = 4;
                  this.searchtype='类型查找'
                }
              },
            ])

          Text('查询类型:'+this.searchtype)
            .fontSize(18)

          Divider()
            .vertical(true)
            .height(15)

          Button() {
            Text('刷新')
              .fontSize(15)
              .fontColor(Color.White)
          }
          .width(80)
          .height(35)
          .backgroundColor($r('app.color.gold'))
          .onClick(()=>{
            this.AccountTable.query('', (result: AccountData[]) => {
              this.accounts = result;
              this.jisuan(this.accounts)
            }, true);
          })

        }.justifyContent(FlexAlign.Center)


        Row() {
          List({ space: CommonConstants.FULL_SIZE, scroller: this.scrollerForList }) {
            ForEach(this.accounts, (item: AccountData) => {
              ListItem() {
                Row() {
                  Image(ImageList[item.typeText])
                    .width($r('app.float.component_size_M'))
                    .aspectRatio(CommonConstants.FULL_SIZE)
                    .margin({ right: $r('app.float.edge_size_MP') })
                    .onClick(() => {
                      item.amount='已完成'
                      this.totalout++;
                      this.totalint--;
                      this.AccountTable.query('', (result: AccountData[]) => {
                        this.accounts= result;
                        }, true);
                    })


                  Column() {
                    Row({space:8}){
                      Text(item.typeText)
                        .height($r('app.float.component_size_SM'))
                        .fontSize($r('app.float.font_size_M'))

                    }
                    Row({space:8}) {
                      Text(item.Date)
                        .height($r('app.float.component_size_SM'))
                        .fontSize($r('app.float.font_size_M'))

                      if (item.remark === '') {
                        Text(`备注:无`)
                          .height($r('app.float.component_size_SM'))
                          .fontSize($r('app.float.font_size_M'))
                          .fontColor(Color.Gray)
                      }
                      else {
                        Text(`备注:${item.remark}`)
                          .height($r('app.float.component_size_SM'))
                          .fontSize($r('app.float.font_size_M'))
                          .fontColor(Color.Gray)
                      }
                    }
                  }.alignItems(HorizontalAlign.Start)

                  Blank()
                    .layoutWeight(1)

                  Text(item.amount == '未完成' ?  '未完成' : '已完成')
                    .fontSize(20)
                    .fontColor(item.amount == '未完成' ?  $r('app.color.pay_color') : $r('app.color.gold'))
                    .align(Alignment.End)
                    .flexGrow(CommonConstants.FULL_SIZE)
                    .onAppear(() => {
                      if(item.amount == '未完成'){
                        this.totalint++;
                      }
                    })
                }
                .width(CommonConstants.FULL_WIDTH)
                .padding({ left: $r('app.float.edge_size_M'), right: $r('app.float.edge_size_M') })
              }
              .backgroundColor(Color.White)
              .borderRadius($r('app.float.radius_size_M'))
              .swipeAction({ end: () => {
                this.itemEnd(this.index, item)
              }
              }) // 设置侧滑属性.
              //.backgroundColor(item.amount == '未完成' ?  $r('app.color.pay_color') : $r('app.color.gold'))
              .width(CommonConstants.FULL_WIDTH)
              .height($r('app.float.component_size_LM'))
              .onClick(() => {
                this.selectListItem(item);
                this.dialogController.open();
                //this.dialogController1.open();
              })
            })
          }
          .height("71%")
          .width('100%')
          .borderRadius($r('app.float.radius_size_M'))


          Divider()
            .vertical(false)
            .height(15)
            .width(50)
            .opacity(0.3)
            .margin({left:8,right:8})

        }
        .width(CommonConstants.FULL_WIDTH)
        .padding({ left: $r('app.float.edge_size_M'), right: $r('app.float.edge_size_M') })
        .margin({ top:'2vp' })
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.FULL_HEIGHT)


      Button() {
        Image($r('app.media.add'))
      }
      .width(55)
      .height(55)
      .position({ x: CommonConstants.EDIT_POSITION_X, y: CommonConstants.EDIT_POSITION_Y })
      .onClick(() => {
        this.isInsert = true;
        this.newAccount = { id: 0, accountType: 0, typeText: '', amount: '未完成' ,Date:'',remark:''};
        this.dialogController.open();
      })
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundImage($r('app.media.bg1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}