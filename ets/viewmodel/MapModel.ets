
import { AddressItem, Location } from './AddressItem';
import { PositionItem, GeoCoordinates } from './PositionItem';
import { CommonConstants1 as Const, PositionType } from '../common/constants/CommonConstants1';
import { Geography } from '../common/utils/Geography';
import MapController from '../controller/MapController';

/**
 * Initializing Map Data.
 */
export class MapModel {
  private data?: AddressItem;
  private addressArray: Array<AddressItem> = new Array(Const.MAP_LANDMARKS_LENGTH).fill(undefined);

  /**
   * Obtains landmark objects on the map based on the longitude and latitude.
   *
   * @param geoCoordinates Longitude and latitude.
   * @param type Landmark Type.
   * @param mapContext Objects in a map component.
   * @returns Landmark objects in the map.
   */
  calCoordinateByLonAndLat(geoCoordinates: Array<GeoCoordinates>, type: number, mapWidth: number, mapHeight: number): AddressItem {
    this.data = undefined;
    if (!this.addressArray[type - 1]) {
      let addressItem = new AddressItem();
      addressItem.name = mapLandmarksName[type-1];
      addressItem.icon = mapLandmarksIcon[type - 1];
      addressItem.locations = this.initLocationData(geoCoordinates, mapWidth, mapHeight);
      addressItem.textColor = mapLandmarksTextColor[type - 1];
      this.addressArray[type - 1] = addressItem;
    }
    this.data = this.addressArray[type - 1];
    return this.data;
  }

  /**
   * Initialize the coordinates of landmarks on the map.
   *
   * @param geoCoordinates Longitude and latitude data.
   * @returns Coordinates of landmarks on the map.
   */
  initLocationData(geoCoordinates: Array<GeoCoordinates>, mapWidth: number, mapHeight: number): Array<Location> {
    let locations: Array<Location> = [];
    geoCoordinates.forEach((item: GeoCoordinates) => {
      let pixelCoordinates = Geography.toPixelCoordinates(item.latitude, item.longitude);
      let positionX = pixelCoordinates.coordinateX * mapWidth / MapController.mapMultiples() / Const.MAP_WIDTH;
      let positionY = pixelCoordinates.coordinateY / Const.MAP_HEIGHT * mapHeight / MapController.mapMultiples();
      locations.push(new Location(positionX, positionY));
    })
    return locations;
  }
}

let mapModel = new MapModel();

export default mapModel as MapModel;

export const PositionList: Array<PositionItem> = [
  {
    icon: $r('app.media.gate'),
    text: $r('app.string.gate'),
    type: PositionType.TRAIN_STATION,
    lngLat: [
      {
        longitude: 113.886114,
        latitude: 22.876750
      }
    ]
  },
  {
    icon: $r('app.media.shitang'),
    text: $r('app.string.shitang'),
    type: PositionType.MOTHER_CHILD_ROOM,
    lngLat: [
      {
        longitude: 113.887714,
        latitude: 22.876790
      }
    ]
  },
  {
    icon: $r('app.media.tushuguan'),
    text: $r('app.string.tushuguan'),
    type: PositionType.CAR_ROAD,
    lngLat: [
      {
        longitude: 113.886761,
        latitude: 22.882444
      }
    ]
  },
  {
    icon: $r('app.media.ting'),
    text: $r('app.string.ting'),
    type: PositionType.CAFE,
    lngLat: [
      {
        longitude: 113.889300,
        latitude: 22.880663
      }
    ]
  },
  {
    icon: $r('app.media.sushe'),
    text: $r('app.string.sushe'),
    type: PositionType.SMOKING_AREA,
    lngLat: [
      {
        longitude: 113.888200,
        latitude: 22.876400
      }
    ]
  },
  {
    icon: $r('app.media.caochang'),
    text: $r('app.string.caochang'),
    type: PositionType.CONVENIENCE_STORE,
    lngLat: [
      {
        longitude: 113.885204,
        latitude: 22.878400
      }
    ]
  },
  {
    icon: $r('app.media.bangonglou'),
    text: $r('app.string.bangonglou'),
    type: PositionType.GYMNASIUM,
    lngLat: [
      {
        longitude: 113.887892,
        latitude: 22.878602
      }
    ]
  },
  {
    icon: $r('app.media.likelou'),
    text: $r('app.string.likelou'),
    type: PositionType.RESTAURANT,
    lngLat: [
      {
        longitude: 113.889161,
        latitude: 22.882444
      }
    ]
  },
  {
    icon: $r('app.media.xuehuozhongxin'),
    text: $r('app.string.xuehuozhongxin'),
    type: PositionType.SIDE_WALK,
    lngLat: [
      {
        longitude: 113.888761,
        latitude: 22.882744
      }
    ]
  },
  {
    icon: $r('app.media.zonghelou'),
    text: $r('app.string.zonghelou'),
    type: PositionType.LIBRARY,
    lngLat: [
      {
        longitude: 113.887292,
        latitude: 22.878602
      }
    ]
  }
]

const mapLandmarksName: Array<Resource> = [
  $r('app.string.gate'),
  $r('app.string.shitang'),
  $r('app.string.tushuguan'),
  $r('app.string.ting'),
  $r('app.string.sushe'),
  $r('app.string.caochang'),
  $r('app.string.bangonglou'),
  $r('app.string.likelou'),
  $r('app.string.xuehuozhongxin'),
  $r('app.string.zonghelou')
]

const mapLandmarksTextColor: Array<Resource> = [
  $r('app.color.train_station_color'),
  $r('app.color.mother_child_room_color'),
  $r('app.color.car_road_color'),
  $r('app.color.cafe_color'),
  $r('app.color.smoking_area_color'),
  $r('app.color.convenience_store_color'),
  $r('app.color.gymnasium_color'),
  $r('app.color.restaurant_color'),
  $r('app.color.side_walk_color'),
  $r('app.color.library_color')
]

const mapLandmarksIcon: Array<Resource> = [
  $r('app.media.gate'),
  $r('app.media.shitang'),
  $r('app.media.tushuguan'),
  $r('app.media.ting'),
  $r('app.media.sushe'),
  $r('app.media.caochang'),
  $r('app.media.bangonglou'),
  $r('app.media.likelou'),
  $r('app.media.xuehuozhongxin'),
  $r('app.media.zonghelou')

];