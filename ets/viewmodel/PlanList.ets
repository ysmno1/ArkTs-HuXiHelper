import sms from '@ohos.telephony.sms'
export default interface AccountItem {
  icon: Resource;
  iconSelected: Resource;
  accountType: number;
  typeText: string;
}

export const PayList: Array<AccountItem> = [
  {
    icon: $rawfile('lx.png'),
    iconSelected: $rawfile('lx.png'),
    accountType: 0,
    typeText: '练习'
  },
  {
    icon: $rawfile('bg.png'),
    iconSelected: $rawfile('bg.png'),
    accountType: 0,
    typeText: '报告'
  },
  {
    icon: $rawfile('cx.png'),
    iconSelected: $rawfile('cx.png'),
    accountType: 0,
    typeText: '程序'
  },
  {
    icon: $rawfile('wz.png'),
    iconSelected: $rawfile('wz.png'),
    accountType: 0,
    typeText: '文章'
  },
  {
    icon: $rawfile('sy.png'),
    iconSelected: $rawfile('sy.png'),
    accountType: 0,
    typeText: '实验'
  },
  {
    icon: $rawfile('xm.png'),
    iconSelected: $rawfile('xm.png'),
    accountType: 0,
    typeText: '项目'
  },
  {
    icon: $rawfile('lw.png'),
    iconSelected: $rawfile('lw.png'),
    accountType: 0,
    typeText: '论文'
  },
  {
    icon: $rawfile('yj.png'),
    iconSelected: $rawfile('yj.png'),
    accountType: 0,
    typeText: '演讲'
  },


]

export const EarnList: Array<AccountItem> = [
  {
    icon: $rawfile('wc.png'),
    iconSelected: $rawfile('wc.png'),
    accountType: 1,
    typeText: '外出'
  },
  {
    icon: $rawfile('ly.png'),
    iconSelected: $rawfile('ly.png'),
    accountType: 1,
    typeText: '旅游'
  },
  {
    icon: $rawfile('la.png'),
    iconSelected: $rawfile('la.png'),
    accountType: 1,
    typeText: '恋爱'
  },
  {
    icon: $rawfile('jc.png'),
    iconSelected: $rawfile('jc.png'),
    accountType: 1,
    typeText: '聚餐'
  },
  {
    icon: $rawfile('yx.png'),
    iconSelected: $rawfile('yx.png'),
    accountType: 1,
    typeText: '游戏'
  },
  {
    icon: $rawfile('yd.png'),
    iconSelected: $rawfile('yd.png'),
    accountType: 1,
    typeText: '运动'
  },

]

export const ImageList: Record<string,Resource> = {
  '练习': $rawfile('lx.png'),
  '报告': $rawfile('bg.png'),
  '程序': $rawfile('cx.png'),
  '实验': $rawfile('sy.png'),

  '文章': $rawfile('wz.png'),
  '项目': $rawfile('xm.png'),
  '论文': $rawfile('lw.png'),
  '演讲': $rawfile('yj.png'),






  '外出': $rawfile('wc.png'),
  '旅游': $rawfile('ly.png'),
  '恋爱': $rawfile('la.png'),
  '游戏': $rawfile('yx.png'),
  '运动': $rawfile('yd.png'),
  '聚餐': $rawfile('jc.png'),

}