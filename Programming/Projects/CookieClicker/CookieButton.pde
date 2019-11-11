class CookieButton extends Styles
{
    CookieButtonStyle style = new Styles.CookieButtonStyle();

    float x, y, r, d, smallR;

    CookieButton()
    {
        x = SIZE_X / 2;
        y = SIZE_Y - SIZE_Y / 4;
        d = SIZE_X / 8;
        r = d / 2;
        smallR = r / 4;
    }

    void Display()
    {
        style.SetStyle(true);
        ellipse(x, y, d, d);
        fill(style.currentChipColor);
        ellipse(x - smallR, y, smallR, smallR);
        ellipse(x + smallR + smallR / 2, y - smallR * 2, smallR, smallR);
        ellipse(x + smallR + smallR / 2, y + smallR * 2, smallR, smallR);
        ellipse(x - smallR * 3, y + smallR, smallR, smallR);
        ellipse(x + smallR * 3, y - smallR, smallR, smallR);
        ellipse(x - smallR, y - smallR * 3, smallR, smallR);
        ellipse(x - smallR, y + smallR * 3, smallR, smallR);
        fill(style.textColor);
        text("Koenk\npls!", x, y - r / 8);
        style.SetStyle(false);
    }

    // Checks whether a circular button has been clicked
    Boolean CheckClick(float mouseX, float mouseY)
    {
        // Get horizontal and vertical distance from center of button to mouse
        float distX = abs(mouseX - x);
        float distY = abs(mouseY - y);
        // Get diagonal distance from center to mouse through Pythagoras
        float dist = sqrt(distX * distX + distY * distY);
        // if that distance is smaller than the radius of the button, click
        if (dist <= r)
        {
            OnClick();
            return true;
        }
        return false;
    }

    void OnClick()
    {
        cookies.Increase(1);
        cookies.increaseTextStyle.incrementOpacity = 255;
        cookies.ShowIncrease();
    }
}
