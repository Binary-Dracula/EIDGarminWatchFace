import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Weather;
import Toybox.Graphics;

class Tools {
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

  // 获取当前步数
  function getSystemStepCount() as Lang.Number {
    var steps = ActivityMonitor.getInfo().steps as Lang.Number?;
    if (steps != null && steps != 0) {
      return steps;
    }
    return 6000;
  }

  // 获取当前距离
  function getSystemDistance() as Lang.String {
    var distance = ActivityMonitor.getInfo().distance as Lang.Number?;
    if (distance != null && distance != 0) {
      // distance 的单位是 cm, 要转成 km
      return (distance / 100000.0).format("%0.2f");
    }
    return "5.5";
  }

  // 获取当前心率
  function getSystemHeartRate() as Lang.Number {
    var heartRate = Activity.getActivityInfo().currentHeartRate as Lang.Number?;
    if (heartRate != null && heartRate != 0) {
      return heartRate;
    }
    return 75;
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
        return "Sunday";
      case 2:
        return "Monday";
      case 3:
        return "Tuesday";
      case 4:
        return "Wednesday";
      case 5:
        return "Thursday";
      case 6:
        return "Friday";
      case 7:
        return "Saturday";
      default:
        return "";
    }
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
    // var calories = getTodayCalories();
    // var progress = calories / 2000.0; // 假设2000卡路里为满格
    // Graphics.drawRect(dc, 10, 10, 220, 20, Gfx.COLOR_WHITE);
    // Graphics.fillRect(dc, 10, 10, 220 * progress, 20, Gfx.COLOR_GREEN);
  }

  // 获取当前电量百分比
  function getSystemBattery() as Lang.String {
    // 只取整数位
    var battery = System.getSystemStats().battery as Lang.Float;
    return battery.format("%0d");
  }

  // 绘制电量弧形
  function drawBatteryArc(dc as Dc) as Void {
    // var batteryLevel = getSystemBattery();
    // var startAngle = 0;
    // var endAngle = batteryLevel * 3.6; // 将电量转换为角度
    // Graphics.drawArc(dc, 10, 10, 20, startAngle, endAngle, Gfx.COLOR_GREEN);
  }

  // 获取当前温度
  function getSystemTemperature() as Lang.String {
    // var temperature = Weather.getInfo().temperature as Lang.Number?;
    // if (temperature != null) {
    //   return temperature.format("%0.1f");
    // }
    return "25";
  }

  // 获取当前湿度
  function getSystemHumidity() as Lang.String {
    // var humidity = Weather.getInfo().humidity as Lang.Number?;
    // if (humidity != null) {
    //   return humidity.format("%0.1f");
    // }
    return "60";
  }

  // 获取当前太阳落山时间
  function getSystemSunsetTime() as Lang.String {
    // var sunsetTime = Weather.getInfo().sunset as Lang.String?;
    // if (sunsetTime != null) {
    //   return sunsetTime;
    // }
    return "18:00";
  }

}
