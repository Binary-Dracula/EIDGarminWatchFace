import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

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
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        setStepCount();
        setHeartRate();
        setHour();
        setMinute();
        setSecond();
        setAMPM();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
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
        secondLabel.setText(tools.getSystemSecond());
    }

    // 设置 AM/PM
    private function setAMPM() {
        var ampmLabel = findDrawableById("AMPM") as Text;
        ampmLabel.setText(tools.getAMPM(false));
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
}
