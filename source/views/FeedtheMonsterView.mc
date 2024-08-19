import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
using Toybox.Application.Storage;

class FeedtheMonsterView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {

        // Get total calories burned for the day
        var totalCalories = Toybox.ActivityMonitor.getInfo().calories;

        // Assuming 250 calories per burger (normal hamburger)
        var burgerCount = Math.floor(totalCalories / 250);

        // Save the burger count to storage so we can access it in burgerStats
        Storage.setValue("burgerCount", burgerCount);

        // Display the burger count
        var burgerAmount = View.findDrawableById("BurgerAmount") as Text;
        burgerAmount.setText("" + burgerCount);

        // Display the total calories
        var burgerCalories = View.findDrawableById("BurgerCalories") as Text;
        burgerCalories.setText("" + "(" + totalCalories + " calories)");

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
