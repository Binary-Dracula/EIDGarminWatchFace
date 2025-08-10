import Toybox.Lang;

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
    var steps = ActivityMonitor.getInfo().steps as Lang.Number or Null;
    if (steps != null && steps != 0) {
      return steps;
    }
    return 6000;
  }

  // 获取当前心率
  function getSystemHeartRate() as Lang.Number {
    var heartRate = Activity.getActivityInfo().currentHeartRate as Lang.Number or Null;
    if (heartRate != null && heartRate != 0) {
      return heartRate;
    }
    return 75;
  }
}