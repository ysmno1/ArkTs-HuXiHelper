import relationalStore from '@ohos.data.relationalStore';
export interface AccountTable {
  tableName: string;
  sqlCreate: string;
  columns: string[];
}
export interface UserTable {
  tableName: string;
  sqlCreate: string;
  columns: string[];
}
export interface MoneyTable {
  tableName: string;
  sqlCreate: string;
  columns: string[];
}
export default  class CommonConstants {
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };

  static readonly ACCOUNT_TABLE: AccountTable = {
    tableName: 'accountTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS accountTable(id INTEGER PRIMARY KEY AUTOINCREMENT, accountType INTEGER, ' +
      'typeText TEXT, amount INTEGER,Date Text, remark Text)',
    columns: ['id', 'accountType', 'typeText', 'amount','Date','remark']
  };
  static readonly User_TABLE: UserTable = {
    tableName: 'userTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS userTable(id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    'username TEXT, password Text, realname Text)',
    columns: ['id', 'username', 'password', 'realname']
  };
  static readonly Money_TABLE: MoneyTable = {
    tableName: 'moneyTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS moneyTable(id INTEGER PRIMARY KEY AUTOINCREMENT, accountType INTEGER, ' +
    'typeText TEXT, amount INTEGER, remark TEXT)',
    columns: ['id', 'accountType', 'typeText', 'remark']
  };
  static readonly SEARCH_TEXT = '搜索';
  static readonly TOAST_TEXT_1 = '账目类型不能为空';
  static readonly TOAST_TEXT_2 = '账目金额不为正整数';
  static readonly TOAST_TEXT_3 = '请选择账目日期';
  static readonly TOAST_TEXT_4 = '用户名或密码不能为空';
  static readonly TOAST_TEXT_5 = '注册成功';
  static readonly FULL_WIDTH = '100%';
  static readonly FULL_HEIGHT = '100%';
  static readonly DIALOG_HEIGHT = '95%';
  static readonly TABS_HEIGHT = '70%';
  static readonly MINIMUM_SIZE = 0;
  static readonly FULL_SIZE = 1;
  static readonly PROMPT_BOTTOM = '70vp';
  static readonly EDIT_POSITION_X = '43.5%';
  static readonly EDIT_POSITION_Y = '90%';
  static readonly RDB_TAG = '[Debug.Rdb]';
  static readonly TABLE_TAG = '[Debug.AccountTable]';
  static readonly INDEX_TAG = '[Debug.Index]';

  /**
   * Watermelon image url.
   */
  static readonly WATERMELON_IMAGE_URL: string = '../../../resources/base/media/ic_watermelon.png';

  /**
   * Hamburg image url.
   */
  static readonly HAMBURG_IMAGE_URL: string = '../../../resources/base/media/ic_hamburg.png';

  /**
   * Cake image url.
   */
  static readonly CAKE_IMAGE_URL: string = '../../../resources/base/media/ic_cake.png';

  /**
   * Beer image url.
   */
  static readonly BEER_IMAGE_URL: string = '../../../resources/base/media/ic_beer.png';

  /**
   * Smile image url.
   */
  static readonly SMILE_IMAGE_URL: string = '../../../resources/base/media/ic_smile.png';

  /**
   * Transform angle.
   */
  static readonly TRANSFORM_ANGLE: number = -120;

  /**
   * 360 degrees.
   */
  static readonly CIRCLE: number = 360;

  /**
   * 180 degrees.
   */
  static readonly HALF_CIRCLE: number = 180;

  /**
   * count.
   */
  static readonly COUNT: number = 6;

  /**
   * Small circle count.
   */
  static readonly SMALL_CIRCLE_COUNT: number = 8;

  /**
   * Image size.
   */
  static readonly IMAGE_SIZE: number = 40;

  /**
   * Prize angle.
   */
  static readonly ANGLE: number = 270;

  /**
   * duration.
   */
  static readonly DURATION: number = 4000;

  /**
   * One.
   */
  static readonly ONE: number = 1;

  /**
   * Two.
   */
  static readonly TWO: number = 2;

  /**
   * Three.
   */
  static readonly THREE: number = 3;

  /**
   * Four.
   */
  static readonly FOUR: number = 4;

  /**
   * Five.
   */
  static readonly FIVE: number = 5;

  /**
   * Six.
   */
  static readonly SIX: number = 6;

  /**
   * Flower point y ratios.
   */
  static readonly FLOWER_POINT_Y_RATIOS: number = 0.255;

  /**
   * Flower radius ratios.
   */
  static readonly FLOWER_RADIUS_RATIOS: number = 0.217;

  /**
   * Flower inner radius ratios.
   */
  static readonly FLOWER_INNER_RATIOS: number = 0.193;

  /**
   * Out circle ratios.
   */
  static readonly OUT_CIRCLE_RATIOS: number = 0.4;

  /**
   * Small circle ratios.
   */
  static readonly SMALL_CIRCLE_RATIOS: number = 0.378;

  /**
   * Small circle radius.
   */
  static readonly SMALL_CIRCLE_RADIUS: number = 4.1;

  /**
   * Inner circle ratios.
   */
  static readonly INNER_CIRCLE_RATIOS: number = 0.356;

  /**
   * Inner white circle ratios.
   */
  static readonly INNER_WHITE_CIRCLE_RATIOS: number = 0.339;

  /**
   * Inner arc ratios.
   */
  static readonly INNER_ARC_RATIOS: number = 0.336;

  /**
   * Image dx ratios.
   */
  static readonly IMAGE_DX_RATIOS: number = 0.114;

  /**
   * Image dy ratios.
   */
  static readonly IMAGE_DY_RATIOS: number = 0.052;

  /**
   * Arc text start angle.
   */
  static readonly ARC_START_ANGLE: number = 34;

  /**
   * Arc text end angle.
   */
  static readonly ARC_END_ANGLE: number = 26;

  /**
   * Text align.
   */
  static readonly TEXT_ALIGN: CanvasTextAlign = 'center';

  /**
   * Text base line.
   */
  static readonly TEXT_BASE_LINE: CanvasTextBaseline = 'middle';

  /**
   * Canvas font.
   */
  static readonly CANVAS_FONT: string = 'px sans-serif';
}

/**
 * Enumerated Value.
 */
export enum EnumeratedValue {
  ONE = 1,
  TWO = 2,
  THREE = 3,
  FOUR = 4,
  FIVE = 5,
  SIX = 6
}