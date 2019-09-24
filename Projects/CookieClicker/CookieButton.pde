class CookieButton extends Styles
{
    CookieButtonStyle cookieButtonStyle = new Styles.CookieButtonStyle();

    void Display()
    {
        cookieButtonStyle.SetStyle(true);
        float x = SIZE_X / 2;
        float y = SIZE_Y / 2;
        float w = SIZE_X / 8;
        float h = SIZE_Y / 8;
        rect(SIZE_X / 2, SIZE_Y / 2, w, h);
        fill(0);
        text("Koenk pls", x, y);
        cookieButtonStyle.SetStyle(false);
    }
}
