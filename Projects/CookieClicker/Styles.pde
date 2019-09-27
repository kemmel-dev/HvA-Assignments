class Styles
{
    class ScoreStyle
    {
        int fontSize = 1;

        int SetFontSize(int _fontSize)
        {
            return fontSize = _fontSize;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                textSize(fontSize);
                fill(255, 255);
                return;
            }
        }
    }

    class IncreaseTextStyle
    {
        int fontSize = 1;
        int incrementOpacity = 255;
        int incrementStep  = 0;

        // Gets a value from CookieClicker.pde's DetermineFontSizes() method
        void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            return;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(color(50,230,50), incrementOpacity);
                incrementOpacity -= incrementStep;
                textSize(fontSize);
                return;
            }
        }
    }

    class CookieButtonStyle 
    {
        int fontSize = 1;

        int r = 216;
        int g = 173;
        int b = 106;
        color originalColor = color(r,g,b);
        color currentColor = originalColor;
        color clickedColor = color(r-30, g-30, b-30); 
        color textColor = 0;

        color chocolateChipColor = color(210,105,30);
        color chocolateChipColorClicked = color(180, 75, 0);
        color currentChipColor = chocolateChipColor;

        int SetFontSize(int _fontSize)
        {
            return fontSize = _fontSize;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(currentColor);
                textSize(fontSize);
                textAlign(CENTER);
                // More styling in CookieButton.Display()
                return;
            }
            textAlign(LEFT);
            noStroke();
        }
    }

    class GrandmaButtonStyle
    {
        int fontSize = 1;
        int fontSizeSmall = 1;

        int r = 249;
        int g = 180;
        int b = 183;
        color originalColor = color(r,g,b);
        color currentColor = originalColor;
        color clickedColor = color(r-30, g-30, b-30); 

        void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            fontSizeSmall = int(fontSize / 2);
            return;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(currentColor);
                stroke(255);
                strokeWeight(5);
                textAlign(CENTER);
                // More text styling is done in GrandmaButton.Display()
                return;
            }
            textAlign(LEFT);
            noStroke();
        }
    }

    class BakeryButtonStyle
    {
        int fontSize = 1;
        int fontSizeSmall = 1;

        int r = 240;
        int g = 215;
        int b = 167;
        color originalColor = color(r,g,b);
        color currentColor = originalColor;
        color clickedColor = color(r-30, g-30, b-30); 

        void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            fontSizeSmall = int(fontSize / 2);
            return;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(currentColor);
                stroke(255);
                strokeWeight(5);
                textAlign(CENTER);
                // More text styling is done in FactoryButton.Display()
                return;
            }
            textAlign(LEFT);
            noStroke();
        }
    }

    class FactoryButtonStyle
    {
        int fontSize = 1;
        int fontSizeSmall = 1;

        int r = 153;
        int g = 153;
        int b = 153;
        color originalColor = color(r,g,b);
        color currentColor = originalColor;
        color clickedColor = color(r-30, g-30, b-30); 

        void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            fontSizeSmall = int(fontSize / 2);
            return;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(currentColor);
                stroke(255);
                strokeWeight(5);
                textAlign(CENTER);
                // More text styling is done in FactoryButton.Display()
                return;
            }
            textAlign(LEFT);
            noStroke();
        }
    }

    class GoldenCookieStyle 
    {
        int fontSize = 1;

        int r = 218;
        int g = 165;
        int b = 32;
        color originalColor = color(r,g,b);
        color currentColor = originalColor;
        color clickedColor = color(r-30, g-30, b-30); 
        color textColor = 0;

        color chocolateChipColor = color(128,0,0);

        int SetFontSize(int _fontSize)
        {
            return fontSize = _fontSize;
        }

        void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(currentColor);
                textSize(fontSize);
                textAlign(CENTER);
                // Later also fill (0) for text in CookieButton.Display()
                return;
            }
            textAlign(LEFT);
            noStroke();
        }
    }
}
