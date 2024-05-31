import ZonesItem from './CollegesItem';

class ZonesViewModel {
  getZonesList(): ZonesItem[] {
    return defaultList;
  }

  getZonesByIndex(index: number): ZonesItem {
    return defaultList[index];
  }
}

let zonesViewModel = new ZonesViewModel();

export default zonesViewModel as ZonesViewModel;

const defaultList: ZonesItem[] = [
  {
    id: 0,
    title:'计算机学院',
    subTitle: $r('app.string.area_sub_name_a'),
    thumbnail: $r('app.media.ic_thumbnail_a'),
    swiperPic: $r('app.media.ic_A'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_a'),
      $r('app.string.introduction_paragraph_second_a')],
    subPicTop: $r('app.media.ic_A_photo_top'),
    subPicBottom: $r('app.media.ic_A_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_A'),
    imageList: [$r('app.media.ic_A_1'), $r('app.media.ic_A_2'), $r('app.media.ic_A_3'), $r('app.media.ic_A_4'),
      $r('app.media.ic_A_5')],
    buildingInformation: $r('app.string.build_information_a'),
    buildingPic: $r("app.media.ic_building_A"),
    geographyPic: $r("app.media.ic_geography_dark_A"),
    geographyPicLight: $r("app.media.ic_geography_lighter_A"),
    backgroundColor: $r('app.color.introduction_page_green'),
    starLinePic: [$r("app.media.ic_starLine_A_light"), $r("app.media.ic_starLine_A_dark")]
  },
  {
    id: 1,
    title: '软件学院',
    subTitle: $r('app.string.area_sub_name_b'),
    thumbnail: $r('app.media.ic_thumbnail_b'),
    swiperPic: $r('app.media.ic_B'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_b'),
    $r('app.string.introduction_paragraph_second_b')],
    subPicTop: $r("app.media.ic_B_photo_top"),
    subPicBottom: $r("app.media.ic_B_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_B'),
    imageList: [$r('app.media.ic_B_1'), $r('app.media.ic_B_2'), $r('app.media.ic_B_3'), $r('app.media.ic_B_4'),
    $r('app.media.ic_B_5')],
    buildingInformation: $r('app.string.build_information_b'),
    buildingPic: $r('app.media.ic_building_G'),
    geographyPic: $r("app.media.ic_geography_dark_B"),
    geographyPicLight: $r("app.media.ic_geography_lighter_B"),
    backgroundColor: $r('app.color.introduction_b_page_blue'),
    starLinePic: [$r("app.media.ic_starLine_B_light"), $r("app.media.ic_starLine_B_dark")]
  },
  {
    id: 2,
    title: '自动化学院',
    subTitle: $r('app.string.area_sub_name_c'),
    thumbnail: $r('app.media.ic_thumbnail_c'),
    swiperPic: $r("app.media.ic_C"),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_c'),
    $r('app.string.introduction_paragraph_second_c')],
    subPicTop: $r("app.media.ic_C_photo_top"),
    subPicBottom: $r("app.media.ic_C_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_C'),
    imageList: [$r('app.media.ic_C_1'), $r('app.media.ic_C_2'), $r('app.media.ic_C_3'), $r('app.media.ic_C_4'),
    $r('app.media.ic_C_5')],
    buildingInformation: $r('app.string.build_information_c'),
    buildingPic: $r('app.media.ic_building_C'),
    geographyPic: $r("app.media.ic_geography_dark_C"),
    geographyPicLight: $r("app.media.ic_geography_lighter_C"),
    backgroundColor: $r('app.color.introduction_c_page_blue'),
    starLinePic: [$r("app.media.ic_starLine_C_light"), $r("app.media.ic_starLine_C_dark")]
  },
  {
    id: 3,
    title: '数统学院',
    subTitle: $r('app.string.area_sub_name_d'),
    thumbnail: $r('app.media.ic_thumbnail_d'),
    swiperPic: $r("app.media.ic_D"),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_d'),
    $r('app.string.introduction_paragraph_second_d')],
    subPicTop: $r("app.media.ic_D_photo_top"),
    subPicBottom: $r("app.media.ic_D_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_D'),
    imageList: [$r('app.media.ic_D_1'), $r('app.media.ic_D_2'), $r('app.media.ic_D_3'), $r('app.media.ic_D_4'),
    $r('app.media.ic_D_5')],
    buildingInformation: $r('app.string.build_information_d'),
    buildingPic: $r('app.media.ic_building_D'),
    geographyPic: $r("app.media.ic_geography_dark_D"),
    geographyPicLight: $r("app.media.ic_geography_lighter_D"),
    backgroundColor: $r('app.color.introduction_d_page_blue'),
    starLinePic: [$r("app.media.ic_starLine_D_light"), $r("app.media.ic_starLine_D_dark")]
  },
  {
    id: 4,
    title: '物理学院',
    subTitle: $r('app.string.area_sub_name_e'),
    thumbnail: $r('app.media.ic_thumbnail_e'),
    swiperPic: $r('app.media.ic_E'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_e'),
      $r('app.string.introduction_paragraph_second_e')],
    subPicTop: $r('app.media.ic_E_photo_top'),
    subPicBottom: $r('app.media.ic_E_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_E'),
    imageList: [$r('app.media.ic_E_1'), $r('app.media.ic_E_2'), $r('app.media.ic_E_3'), $r('app.media.ic_E_4'),
      $r('app.media.ic_E_5')],
    buildingInformation: $r('app.string.build_information_e'),
    buildingPic: $r('app.media.ic_building_E'),
    geographyPic: $r("app.media.ic_geography_dark_E"),
    geographyPicLight: $r("app.media.ic_geography_lighter_E"),
    backgroundColor: $r('app.color.introduction_page_orange_dark'),
    starLinePic: [$r('app.media.ic_starLine_E_lighter'), $r('app.media.ic_starLine_E_dark')]
  },
  {
    id: 5,
    title: $r('app.string.area_name_f'),
    subTitle: $r('app.string.area_sub_name_f'),
    thumbnail: $r('app.media.ic_thumbnail_f'),
    swiperPic: $r('app.media.ic_F'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_f'),
      $r('app.string.introduction_paragraph_second_f')],
    subPicTop: $r('app.media.ic_F_photo_top'),
    subPicBottom: $r('app.media.ic_F_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_F'),
    imageList: [$r('app.media.ic_F_1'), $r('app.media.ic_F_2'), $r('app.media.ic_F_3'), $r('app.media.ic_F_4'),
      $r('app.media.ic_F_5')],
    buildingInformation: $r('app.string.build_information_f'),
    buildingPic: $r("app.media.ic_building_F"),
    geographyPic: $r("app.media.ic_geography_lighter_F"),
    geographyPicLight: $r("app.media.ic_geography_lighter_F"),
    backgroundColor: $r('app.color.introduction_page_orange_light'),
    starLinePic: [$r('app.media.ic_starLine_F_lighter'), $r('app.media.ic_starLine_F_dark')]
  }

]