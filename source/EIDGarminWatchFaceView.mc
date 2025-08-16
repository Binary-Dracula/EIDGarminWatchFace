import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

/**
240x240
260x260
280x280
416x416
454x454
*/
class EIDGarminWatchFaceView extends WatchUi.WatchFace {
  private var tools = new Tools();

  function initialize() {
    WatchFace.initialize();
  }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.WatchFace(dc));
  }

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {}

  // Update the view
  function onUpdate(dc as Dc) as Void {
    // Call the parent onUpdate function to redraw the layout
    View.onUpdate(dc);

    setDistance();
    setStepCount();
    setHeartRate();
    setCalories();
    drawTotalCaloriesProgressBar(dc);
    setBattery();
    drawBatteryArc(dc);
    setDate();
    setWeekday();
    setStress();
    drawStressArc(dc);
    setSunsetTime();
    setAMPM();
    setHour();
    setMinute();
    setSecond();
    setWeatherIcon();
    setTemperature();
    setHumidity();
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}

  // The user has just looked at their watch. Timers and animations may be started here.
  function onExitSleep() as Void {}

  // Terminate any active timers and prepare for slow updates.
  function onEnterSleep() as Void {}

  // 距离
  private function setDistance() {
    var distanceLabel = findDrawableById("Distance") as Text;
    distanceLabel.setText(tools.getSystemDistance());
  }

  // 设置步数
  private function setStepCount() {
    var stepLabel = findDrawableById("StepCount") as Text;
    stepLabel.setText(tools.getSystemStepCount().format("%d"));
  }

  // 设置心率
  private function setHeartRate() {
    var heartRateLabel = findDrawableById("HeartRate") as Text;
    heartRateLabel.setText(tools.getSystemHeartRate().format("%d"));
  }

  // 卡路里
  private function setCalories() {
    var caloriesLabel = findDrawableById("Calories") as Text;
    caloriesLabel.setText(tools.getTodayCalories().format("%d"));
  }

  // 卡路里进度
  private function drawTotalCaloriesProgressBar(dc as Dc) as Void {
    tools.drawTotalCaloriesProgressBar(dc);
  }

  // 电量
  private function setBattery() {
    var batteryLabel = findDrawableById("Battery") as Text;
    batteryLabel.setText(
      Lang.format(WatchUi.loadResource(Rez.Strings.BatteryValue), [
        tools.getSystemBattery(),
      ])
    );
  }

  // 绘制电量圆弧
  private function drawBatteryArc(dc as Dc) as Void {
    tools.drawBatteryArc(dc);
  }

  // 日期
  private function setDate() {
    var dateLabel = findDrawableById("Date") as Text;
    dateLabel.setText(tools.getSystemDay());
  }

  // 星期
  private function setWeekday() {
    var weekdayLabel = findDrawableById("Weekday") as Text;
    weekdayLabel.setText(tools.getSystemWeekday());
  }

  // 身体压力值
  private function setStress() {
    var stressLabel = findDrawableById("Stress") as Text;
    stressLabel.setText(tools.getStress().format("%d"));
  }

  // 绘制压力弧形
  private function drawStressArc(dc as Dc) as Void {
    tools.drawStressArc(dc);
  }

  // 日落时间
  private function setSunsetTime() {
    var sunsetTimeLabel = findDrawableById("SunsetTime") as Text;
    sunsetTimeLabel.setText(tools.getSystemSunsetTime());
  }

  // 设置 AM/PM
  private function setAMPM() {
    var ampmLabel = findDrawableById("AMPM") as Text;
    ampmLabel.setText(tools.getAMPM(false));
  }

  // 设置小时
  private function setHour() {
    var hourLabel = findDrawableById("Hour") as Text;
    hourLabel.setText(tools.getSystemHour(false));
  }

  // 设置分钟
  private function setMinute() {
    var minuteLabel = findDrawableById("Minute") as Text;
    minuteLabel.setText(tools.getSystemMinute());
  }

  // 设置秒
  private function setSecond() {
    var secondLabel = findDrawableById("Second") as Text;
    // 根据当前选择的背景色, 设置秒的颜色
    var backgroundType =
      Application.Properties.getValue("BackgroundImage") as Number;
    switch (backgroundType) {
      case 2: // Green
        secondLabel.setColor(Graphics.createColor(1, 8, 153, 117));
        break;
      case 3: // Blue
        secondLabel.setColor(Graphics.createColor(1, 7, 176, 201));
        break;
      case 4: // Red
        secondLabel.setColor(Graphics.createColor(1, 238, 68, 81));
        break;
      case 5: // Purple
        secondLabel.setColor(Graphics.createColor(1, 223, 168, 255));
        break;
      case 6: // Orange
        secondLabel.setColor(Graphics.createColor(1, 255, 135, 1));
        break;
      case 7: // Pink
        secondLabel.setColor(Graphics.createColor(1, 245, 73, 115));
        break;
      default: // White
        secondLabel.setColor(Graphics.createColor(1, 233, 236, 217));
    }
    secondLabel.setText(tools.getSystemSecond());
  }

  // 天气图标
  private function setWeatherIcon() {
    var weatherIconResource = tools.getWeatherIcon() as BitmapResource;
    var weatherIcon = findDrawableById("WeatherIcon") as Bitmap;
    weatherIcon.setBitmap(weatherIconResource);
  }

  // 当前温度
  private function setTemperature() {
    var temperatureLabel = findDrawableById("Temperature") as Text;
    temperatureLabel.setText(tools.getSystemTemperature());
  }

  // 当前湿度
  private function setHumidity() {
    var humidityLabel = findDrawableById("Humidity") as Text;
    humidityLabel.setText(
      Lang.format(WatchUi.loadResource(Rez.Strings.HumidityValue), [
        tools.getSystemHumidity(),
      ])
    );
  }
}
