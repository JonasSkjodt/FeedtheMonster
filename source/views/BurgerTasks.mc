    import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Application.Storage;
    
class BurgerTasks extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.BurgerLayout(dc));
    }

    function onShow() as Void {
        // Get all tasks
        // var getTaskOne = Storage.getValue()
        // var getTaskTwo = Storage.getValue()
        // var getTaskThree = Storage.getValue()

        // Make a task for each (find some data to keep track of)

        // Set text to the new tasks

    }

    function onHide() as Void {

    }

    function onUpdate(dc as Dc) as Void {
        // Get all tasks
        // var getTaskOne = Storage.getValue()
        // var getTaskTwo = Storage.getValue()
        // var getTaskThree = Storage.getValue()

        // check of update on the tracked tasks

        // if a task has reached completion, make the backgound gray (or something)

        // update text to the new values
    }
}

class BurgerTasksDelegate extends WatchUi.BehaviorDelegate {
    
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new FeedtheMonsterMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
}