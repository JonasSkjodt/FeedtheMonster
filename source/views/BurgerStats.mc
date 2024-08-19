import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Application.Storage;

class BurgerStats extends WatchUi.View {

    // Storage keys
    private var BURGER_COUNT_KEY = "burgerCount";
    private var TOTAL_BURGERS_KEY = "totalBurgers";
    private var LAST_UPDATE_KEY = "lastUpdateTime";

    function initialize() {
        View.initialize();
    }

    // Load resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.BurgerLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    /*function onUpdate(dc as Dc) as Void {

        // Retrieve the saved burger count from FeedtheMonsterView
        var savedBurgerCount = Storage.getValue("burgerCount");

        // If there's a saved value, display it
        if (savedBurgerCount != null) {
            var burgerAmount = View.findDrawableById("BurgerTotal") as Text;
            burgerAmount.setText("" + savedBurgerCount);
        } else {
            // If there's no saved value, display a message
            var burgerAmount = View.findDrawableById("BurgerTotal") as Text;
            burgerAmount.setText("No burgers saved");
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }*/

    /* currently used for testing purposes
    function resetTotalBurgerCount() as Void {
        Storage.deleteValue(TOTAL_BURGERS_KEY);
        var totalBurgerCount = 0;
        Storage.setValue(TOTAL_BURGERS_KEY, totalBurgerCount);
    }*/

    function onUpdate(dc as Dc) as Void {
        //resetTotalBurgerCount();

        // Retrieve values from storage
        var savedBurgerCount    = Storage.getValue(BURGER_COUNT_KEY);
        var totalBurgerCount    = Storage.getValue(TOTAL_BURGERS_KEY);
        var lastUpdateTime      = Storage.getValue(LAST_UPDATE_KEY);

        // Initialize counts and timestamps if null
        savedBurgerCount    = (savedBurgerCount != null) ? savedBurgerCount : 0;
        totalBurgerCount    = (totalBurgerCount != null) ? totalBurgerCount : 0;
        lastUpdateTime      = (lastUpdateTime != null) ? new Time.Moment(lastUpdateTime) : null;

        System.println("savedBurgerCount: " + savedBurgerCount);
        System.println("totalBurgerCount: " + totalBurgerCount);
        System.println("lastUpdateTime: " + lastUpdateTime);

        // Get the current Time.Moment
        var now = Time.now();

        // Compare the last update time with the current time
        var difference = lastUpdateTime != null ? lastUpdateTime.compare(now) : 86400;
        
        // Check if the difference is greater than or equal to 86400 seconds (24 hours)
        if (lastUpdateTime == null || difference >= 86400) {
            totalBurgerCount += savedBurgerCount;
            Storage.setValue(TOTAL_BURGERS_KEY, totalBurgerCount);
            Storage.setValue(LAST_UPDATE_KEY, now.value());
        }

        // Find and update the Text drawable
        var burgerAmount = View.findDrawableById("BurgerTotal") as Text;
        if (burgerAmount != null) {
            if (totalBurgerCount > 0) {
                burgerAmount.setText("" + totalBurgerCount);
            } else {
                burgerAmount.setText("No burgers saved");
            }
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}

class BurgerStatsDelegate extends WatchUi.BehaviorDelegate {
    
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new FeedtheMonsterMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
}