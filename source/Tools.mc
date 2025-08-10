import Toybox.Lang;

class Tools {

    public function getAMPM(is24Hour as Boolean) as Lang.String {
        var clockTime = System.getClockTime();
        if (is24Hour) {
            return "";
        } else {
            return clockTime.hour >= 12 ? "PM" : "AM";
        }
    }

    // get hour
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

    // get minute
  function getSystemMinute() as Lang.String {
    var clockTime = System.getClockTime();
    return clockTime.min.format("%02d");
  }

  // get second
  function getSystemSecond() as Lang.String {
    var clockTime = System.getClockTime();
    return clockTime.sec.format("%02d");
  }
}