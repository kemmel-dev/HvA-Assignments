// This class is a non-used template class for button types.
class GrandmaButton extends Styles
{
    // x,y coöords, width and height for button
    float x, y, w, w_half, h, h_half;

    // Get the style from Styles
    GrandmaButtonStyle style = new GrandmaButtonStyle();
    
    // Current total and max total allowed of this type
    long total = 0L;
    int maxTotal = 1000;

    // Cost of this type and what it increments Cookies.increaseAmount by
    int cost = 25;
    int increment = 1;

    // Name of this button
    String name = "Oma";
    String pluralName = "Oma's";
    
    // Set on creation
    GrandmaButton()
    {
        x = SIZE_X / 4;
        y = SIZE_Y / 4;
        w = SIZE_X / 5;
        w_half = w / 2;
        h = SIZE_Y / 6;
        h_half = h / 2;
    }

    //  -------------------------------------------------------------------

    // Returns the amount in service string
    String InService()
    {
        return String.format("%s in dienst:\n%d/%d\n(%d koenk/s)", pluralName, total, maxTotal, total * increment);
    }

    // Returns the cost string
    String Cost()
    {
        return String.format("Kost %d koenk\n(+%d koenk/s)", cost, increment);
    }

    // Displays our button and it's text when called
    void Display()
    {
        style.SetStyle(true);
        rect(x, y, w, h);
        fill(255);
        textSize(style.fontSizeSmall);
        text(InService(), x, y + SIZE_Y / 8);
        fill(0);
        text(Cost(), x, y + SIZE_Y / 50);
        textSize(style.fontSize);
        text("Huur " + name, x, y - SIZE_Y / 50);       
        style.SetStyle(false);
    }

    // Returns true if this button has been clicked, false otherwise.
    Boolean CheckClick(float mouseX, float mouseY)
    {
        float distX = abs(mouseX - x);
        float distY = abs(mouseY - y);

        if (distX <= w_half && distY <= h_half)
        {
            OnClick();
            return true;
        }
        return false;
    }

    // Called when this button is clicked.
    void OnClick()
    {
        // Increase the rate at which you earn cookies by increment
        if (cookies.count >= cost && total < maxTotal )
        {
            total += 1L;
            cookies.count -= cost;
            increaseAmount += increment;
        }
    }
}