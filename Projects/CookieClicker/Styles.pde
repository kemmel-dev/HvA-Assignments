class Styles
{
    class CookieButtonStyle 
    {
        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(255);
                textSize(16);
                stroke(125);
                strokeWeight(5);
                return;
            }
            noStroke();
        }
    }

    class IncreaseTextStyle
    {
        void SetStyle(Boolean on, int incrementOpacity)
        {
            if (on)
            {
                fill(color(50,230,50), incrementOpacity);
            }
            fill(255);
        }
    }
}
