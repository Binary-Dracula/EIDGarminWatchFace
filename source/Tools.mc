import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Weather;
import Toybox.Graphics;
import Toybox.Position;

class Tools {
  // 获取当前距离
  function getSystemDistance() as Lang.String {
    var distance = ActivityMonitor.getInfo().distance as Lang.Number?;
    if (distance != null && distance != 0) {
      // distance 的单位是 cm, 要转成 km
      return (distance / 100000.0).format("%0.2f");
    }
    return "5.50";
  }

  // 获取当前步数
  function getSystemStepCount() as Lang.Number {
    var steps = ActivityMonitor.getInfo().steps as Lang.Number?;
    if (steps != null && steps != 0) {
      return steps;
    }
    return 6000;
  }

  // 获取当前心率
  function getSystemHeartRate() as Lang.Number {
    var heartRate = Activity.getActivityInfo().currentHeartRate as Lang.Number?;
    if (heartRate != null && heartRate != 0) {
      return heartRate;
    }
    return 75;
  }

  // 获取当前卡路里
  function getTodayCalories() as Lang.Number {
    var calories = ActivityMonitor.getInfo().calories as Lang.Number?;
    if (calories != null && calories != 0) {
      return calories;
    }
    return 1980;
  }

  // 绘制总卡路里进度条
  function drawTotalCaloriesProgressBar(dc as Dc) as Void {
    var targetCalories =
      Application.Properties.getValue("TargetCalories") as Number;
    var currentCalories = getTodayCalories();
    var progress = currentCalories / targetCalories;
    // Graphics.drawRect(dc, 10, 10, 220, 20, Gfx.COLOR_WHITE);
    // Graphics.fillRect(dc, 10, 10, 220 * progress, 20, Gfx.COLOR_GREEN);
  }

  // 获取当前电量百分比
  function getSystemBattery() as Lang.String {
    // 只取整数位
    var battery = System.getSystemStats().battery as Lang.Float;
    return battery.format("%d");
  }

  // 绘制电量弧形
  function drawBatteryArc(dc as Dc) as Void {
    // x坐标
    var centerX = 38;
    // y坐标
    var centerY = 130;
    // 半径
    var radius = 24;
    // 粗细
    var thickness = 3;
    // 前景色
    var foregroundColor = Graphics.createColor(1, 195, 195, 195);
    // 背景色
    var backgroundColor = Graphics.COLOR_TRANSPARENT;
    // 系统电量
    var batteryPercent = System.getSystemStats().battery / 100;
    // 固定起点 (0% 位置)
    var startAngle = 124;
    // 总弧长
    var totalAngleSpan = 288;
    // --- 3. 根据公式计算终点 ---
    var endAngle = startAngle + totalAngleSpan * batteryPercent;

    drawRoundedArc(
      dc,
      centerX,
      centerY,
      radius,
      thickness,
      foregroundColor,
      backgroundColor,
      startAngle,
      endAngle.toNumber()
    );
  }

  // 获取日期
  function getSystemDay() as Lang.String {
    var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
    return today.day.format("%02d");
  }

  // 获取星期的全英文
  function getSystemWeekday() as Lang.String {
    var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
    switch (today.day_of_week) {
      case 1:
        return "SUNDAY";
      case 2:
        return "MONDAY";
      case 3:
        return "TUESDAY";
      case 4:
        return "WEDNESDAY";
      case 5:
        return "THURSDAY";
      case 6:
        return "FRIDAY";
      case 7:
        return "SATURDAY";
      default:
        return "";
    }
  }

  // 当前压力值
  function getStress() as Lang.Number {
    var stress = ActivityMonitor.getInfo().stressScore as Lang.Number?;
    if (stress != null) {
      return stress;
    }
    return 50; // 默认值
  }

  // 绘制压力弧形
  function drawStressArc(dc as Dc) as Void {
    // x坐标
    var centerX = 222;
    // y坐标
    var centerY = 130;
    // 半径
    var radius = 24;
    // 粗细
    var thickness = 3;
    // 前景色
    var foregroundColor = Graphics.createColor(1, 195, 195, 195);
    // 背景色
    var backgroundColor = Graphics.COLOR_TRANSPARENT;
    // 系统压力值
    var stressPercent = getStress() / 100.0;
    // 固定起点 (0% 位置)
    var startAngle = 124;
    // 总弧长
    var totalAngleSpan = 288;
    // --- 3. 根据公式计算终点 ---
    var endAngle = startAngle + totalAngleSpan * stressPercent;

    drawRoundedArc(
      dc,
      centerX,
      centerY,
      radius,
      thickness,
      foregroundColor,
      backgroundColor,
      startAngle,
      endAngle.toNumber()
    );
  }

  // 获取当前太阳落山时间
  function getSystemSunsetTime() as Lang.String {
    var curLocation = Position.getInfo().position as Position.Location?;
    var today = Time.now();
    if (curLocation != null) {
      var sunset = Weather.getSunset(curLocation, today);
      if (sunset != null) {
        var sunsetInfo = Gregorian.info(sunset, Time.FORMAT_SHORT);
        return (
          sunsetInfo.hour.format("%02d") + ":" + sunsetInfo.min.format("%02d")
        );
      }
    }
    return "18:00";
  }

  // 获取 AM/PM
  public function getAMPM(is24Hour as Boolean) as Lang.String {
    var clockTime = System.getClockTime();
    if (is24Hour) {
      return "";
    } else {
      return clockTime.hour >= 12 ? "PM" : "AM";
    }
  }

  // 获取小时
  function getSystemHour(is24Hour as Boolean) as Lang.String {
    var clockTime = System.getClockTime();
    var hours = clockTime.hour;
    if (is24Hour) {
      return hours.format("%02d");
    } else {
      if (hours > 12) {
        hours = hours - 12;
      }
      return hours.format("%02d");
    }
  }

  // 获取分钟
  function getSystemMinute() as Lang.String {
    var clockTime = System.getClockTime();
    return clockTime.min.format("%02d");
  }

  // 获取秒
  function getSystemSecond() as Lang.String {
    var clockTime = System.getClockTime();
    return clockTime.sec.format("%02d");
  }

  // 获取当前天气ICON
  function getWeatherIcon() as BitmapResource {
    var currentWeatherConditions =
      Weather.getCurrentConditions() as Weather.CurrentConditions?;

    var weatherIconResource = Application.loadResource(
      Rez.Drawables.WeatherConditionUnknown
    );
    if (currentWeatherConditions != null) {
      var condition = currentWeatherConditions.condition;
      switch (condition) {
        case Weather.CONDITION_CLEAR:
          break;
        case Weather.CONDITION_PARTLY_CLOUDY:
          break;
        default:
          break;
      }
    }
    return weatherIconResource;
  }

  // 获取当前温度
  function getSystemTemperature() as Lang.String {
    var currentWeatherConditions =
      Weather.getCurrentConditions() as Weather.CurrentConditions?;
    if (currentWeatherConditions != null) {
      return currentWeatherConditions.temperature.format("%d");
    }
    return "25";
  }

  // 获取当前湿度
  function getSystemHumidity() as Lang.String {
    var currentWeatherConditions =
      Weather.getCurrentConditions() as Weather.CurrentConditions?;
    if (currentWeatherConditions != null) {
      return currentWeatherConditions.relativeHumidity.format("%d");
    }
    return "60";
  }

  using Toybox.Graphics;
  using Toybox.Math;
  using Toybox.System;

  // ... 在你的 View class 内部或外部添加这个函数

  /**
   * 绘制一个两端为圆角的圆弧
   * @param dc a a             - 图形上下文 (Dc)
   * @param centerX a a        - 圆心 X 坐标
   * @param centerY a a        - 圆心 Y 坐标
   * @param radius a a         - 圆弧半径
   * @param penWidth a a       - 圆弧线宽
   * @param startAngle a a     - 起始角度 (0度在3点钟方向)
   * @param endAngle a a       - 结束角度
   */
  function drawRoundedArc(
    dc as Dc,
    centerX as Number,
    centerY as Number,
    radius as Number,
    penWidth as Number,
    foregroundColor as Graphics.ColorType,
    backgroudColor as Graphics.ColorType,
    startAngle as Number,
    endAngle as Number
  ) as Void {
    // 步骤 1: 设置画笔宽度和颜色
    dc.setPenWidth(penWidth);
    // 颜色可以作为参数传入，这里为了演示设为橙色
    dc.setColor(foregroundColor, backgroudColor);

    // 步骤 2: 绘制基础弧线
    // 注意：这里的角度方向是逆时针 (ARC_COUNTER_CLOCKWISE)
    dc.drawArc(
      centerX,
      centerY,
      radius,
      Graphics.ARC_COUNTER_CLOCKWISE,
      startAngle,
      endAngle
    );

    // 步骤 3: 计算起点和终点的坐标
    // 将角度从度转换为弧度，因为 Math.cos/sin 需要弧度
    var startRad = Math.toRadians(startAngle.toFloat());
    var endRad = Math.toRadians(endAngle.toFloat());

    // 起点坐标
    var startX = centerX + radius * Math.cos(startRad);
    var startY = centerY - radius * Math.sin(startRad); // Y 坐标系是向下的，所以用减法

    // 终点坐标
    var endX = centerX + radius * Math.cos(endRad);
    var endY = centerY - radius * Math.sin(endRad); // Y 坐标系是向下的，所以用减法

    // 步骤 4: 在起点和终点绘制实心圆作为圆角
    var capRadius = penWidth / 2.0;
    //dc.fillCircle(startX, startY, capRadius);
    //dc.fillCircle(endX, endY, capRadius);
  }
}
