class GoldenCookie extends Styles
{
    GoldenCookieStyle style = new Styles.GoldenCookieStyle();

    Boolean hidden = true;

    float x, y, r, d, smallR;

    GoldenCookie()
    {
        d = SIZE_X / 8;
        r = d / 2;
        smallR = r / 4;
        SetRandomPos();
    }

    void SetRandomPos()
    {
        x = random(r, SIZE_X - r);
        y = random(r, SIZE_Y - r);
    }

    void Display()
    {
        if (hidden)
        {
            return;
        }
        style.SetStyle(true);
        ellipse(x, y, d, d);
        fill(style.chocolateChipColor);
        ellipse(x - smallR, y, smallR, smallR);
        ellipse(x + smallR + smallR / 2, y - smallR * 2, smallR, smallR);
        ellipse(x + smallR + smallR / 2, y + smallR * 2, smallR, smallR);
        ellipse(x - smallR * 3, y + smallR, smallR, smallR);
        ellipse(x + smallR * 3, y - smallR, smallR, smallR);
        ellipse(x - smallR, y - smallR * 3, smallR, smallR);
        ellipse(x - smallR, y + smallR * 3, smallR, smallR);
        fill(style.textColor);
        text("MEGA\nKOENK!", x, y - r / 8);
        style.SetStyle(false);
    }

    // Checks whether a circular button has been clicked
    Boolean CheckClick(float mouseX, float mouseY)
    {
        if (hidden)
        {
            return false;
        }
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
        cookies.Increase(500);
        cookies.ShowIncrease();
        hidden = true;
    }
}
