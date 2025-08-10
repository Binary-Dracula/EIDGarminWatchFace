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

    private function setHour() {
        var hourLabel = findDrawableById("Hour") as Text;
        hourLabel.setText(tools.getSystemHour(false));
    }

    private function setMinute() {
        var minuteLabel = findDrawableById("Minute") as Text;
        minuteLabel.setText(tools.getSystemMinute());
    }

    private function setSecond() {
        var secondLabel = findDrawableById("Second") as Text;
        secondLabel.setText(tools.getSystemSecond());
    }

    private function setAMPM() {
        var ampmLabel = findDrawableById("AMPM") as Text;
        ampmLabel.setText(tools.getAMPM(false));
    }

}
