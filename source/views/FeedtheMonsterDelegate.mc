import Toybox.Lang;
import Toybox.WatchUi;

class FeedtheMonsterDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new FeedtheMonsterMenuDelegate(), WatchUi.SLIDE_DOWN);
        return true;
    }
}