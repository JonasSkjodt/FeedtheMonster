import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class FeedtheMonsterMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :burger_home) {
            //pop once to close the menu
			WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
			//switch to the new view
			WatchUi.switchToView(new FeedtheMonsterView(), new FeedtheMonsterDelegate(), WatchUi.SLIDE_UP);
        } else if (item == :burger_stats) {
			WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
			WatchUi.switchToView(new BurgerStats(), new BurgerStatsDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :burger_tasks) {
			WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
			WatchUi.switchToView(new BurgerTasks(), new BurgerTasksDelegate(), WatchUi.SLIDE_UP);
        }
    }
}