class CookieButton extends Styles
{
    CookieButtonStyle style = new Styles.CookieButtonStyle();

    float x, y, w, w_half, h, h_half;

    CookieButton()
    {
        x = SIZE_X / 2;
        y = SIZE_Y - SIZE_Y / 4;
        w = SIZE_X / 8;
        w_half = w / 2;
        h = SIZE_Y / 6;
        h_half = h / 2;
    }

    void Display()
    {
        style.SetStyle(true);
        x = SIZE_X / 2;
        y = SIZE_Y - SIZE_Y / 4;
        w = SIZE_X / 8;
        w_half = w / 2;
        h = SIZE_Y / 6;
        rect(x, y, w, h);
        fill(0);
        text("Koenk\npls!", x, y - h / 8);
        style.SetStyle(false);
    }

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

    void OnClick()
    {
        cookies.Increase(1);
        cookies.increaseTextStyle.incrementOpacity = 255;
        cookies.ShowIncrease();
    }
}
