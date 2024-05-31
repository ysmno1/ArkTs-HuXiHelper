
/**
 * Fill arc data.
 */
export default class FillArcData {
  /**
   * The x-axis coordinate of the center of the arc.
   */
  x: number;

  /**
   * The y-axis coordinate of the center of the arc.
   */
  y: number;

  /**
   * Radius of the arc.
   */
  radius: number;

  /**
   * The start point of the arc, in radians.
   */
  startAngle: number;

  /**
   * The end point of the arc, in radians.
   */
  endAngle: number;

  /**
   * The constructor of FillArcData.
   *
   * @param x The x-axis coordinate of the center of the arc.
   * @param y The y-axis coordinate of the center of the arc.
   * @param radius Radius of the arc.
   * @param startAngle The start point of the arc, in radians.
   * @param endAngle The end point of the arc, in radians.
   * @param fillColor The fill color of the arc.
   */
  constructor(x: number, y: number, radius: number, startAngle: number, endAngle: number) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.startAngle = startAngle;
    this.endAngle = endAngle;
  }
}
