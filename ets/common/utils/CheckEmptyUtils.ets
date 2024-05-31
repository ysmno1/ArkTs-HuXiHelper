

/**
 * A utility class for checking whether data is empty.
 */
class CheckEmptyUtils {
  /**
   * Check obj is empty.
   *
   * @param {object} obj
   * @return {boolean} true(empty)
   */
  isEmptyObj(obj: object | string) {
    return (typeof obj === 'undefined' || obj === null || obj === '');
  }

  /**
   * Check str is empty.
   *
   * @param {string} str
   * @return {boolean} true(empty)
   */
  isEmptyStr(str: string) {
    return str.trim().length === 0;
  }

  /**
   * Check array is empty.
   *
   * @param {Array}arr
   * @return {boolean} true(empty)
   */
  isEmptyArr(arr: Array<string>) {
    return arr.length === 0;
  }
}

export default new CheckEmptyUtils();