import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;

class CustomBackgroundDrawable extends WatchUi.Drawable {

    function initialize() {
        Drawable.initialize({ :identifier => "CustomBackgroundDrawable" });
    }

    function draw(dc as Dc) as Void {
        var backgroundBitmap = getBackgroundBitmap() as BitmapResource;
        dc.drawBitmap(0, 0, backgroundBitmap);
    }

    /**
     * Returns the background bitmap based on the selected background image.
     * The background image is stored in Application.Properties.
     * If no match is found, it defaults to the white background.
     */
    function getBackgroundBitmap() as BitmapResource {
        var backgroundImage = Application.Properties.getValue("BackgroundImage") as Number;
        switch (backgroundImage) {
            case 2:
                return Application.loadResource( Rez.Drawables.BackgroundGreen ) as BitmapResource;
            case 3:
                return Application.loadResource( Rez.Drawables.BackgroundBlue ) as BitmapResource;
            case 4:
                return Application.loadResource( Rez.Drawables.BackgroundRed ) as BitmapResource;
            case 5:
                return Application.loadResource( Rez.Drawables.BackgroundPurple ) as BitmapResource;
            case 6:
                return Application.loadResource( Rez.Drawables.BackgroundOrange ) as BitmapResource;
            case 7:
                return Application.loadResource( Rez.Drawables.BackgroundPink ) as BitmapResource;
            default:
                // Default to white if no match found
                return Application.loadResource( Rez.Drawables.BackgroundWhite ) as BitmapResource;
        }
    }
}