import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Weather;

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
}
