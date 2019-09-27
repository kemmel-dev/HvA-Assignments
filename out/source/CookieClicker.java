import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CookieClicker extends PApplet {

Cookies cookies = new Cookies();
CookieButton cookieButton = new CookieButton();
GrandmaButton grandmaButton = new GrandmaButton();
BakeryButton bakeryButton = new BakeryButton();
FactoryButton factoryButton = new FactoryButton();
Score score = new Score();

// Game is drawn at 30 fps. When frameCount reaches frameLimit,
// one second has passed.
final int frameLimit = 30;
int resetColorFrame = 0;

final float SIZE_X = 1920, SIZE_Y = 1080;
int incrementOpacity = 255;

long increaseAmount = 0L;


public void setup()
{
   
   
   noStroke();
   rectMode(CENTER);
   textSize(50);
   
   // Draw the game at 30 fps
   frameRate(frameLimit);
   cookies.increaseTextStyle.incrementStep = PApplet.parseInt(255 / frameLimit);
   DetermineFontSizes();
}

public void DetermineFontSizes()
{
  bakeryButton.style.SetFontSize(50);
  grandmaButton.style.SetFontSize(50);
  cookieButton.style.SetFontSize(50);
  factoryButton.style.SetFontSize(50);
  cookies.increaseTextStyle.SetFontSize(30);
  score.scoreStyle.SetFontSize(80);
}

public void draw()
{
  background(0);
  bakeryButton.Display();
  cookieButton.Display();
  grandmaButton.Display();
  factoryButton.Display();
  if (frameCount > resetColorFrame)
  {
    ResetClickedColors();
    resetColorFrame = 0;
  }
  if (frameCount % frameLimit == 0)
  {
    cookies.Increase(increaseAmount);
    cookies.increaseTextStyle.incrementOpacity = 255;
  }
  cookies.ShowIncrease();
  score.Display(cookies.count);
}

public void mouseClicked()
{
  if (cookieButton.CheckClick(mouseX, mouseY))
  {
    cookieButton.style.currentColor = cookieButton.style.clickedColor;
    CountFrames();
    return;
  }
  if (grandmaButton.CheckClick(mouseX, mouseY))
  {
    grandmaButton.style.currentColor = grandmaButton.style.clickedColor;
    CountFrames();
    return;
  }
  if (bakeryButton.CheckClick(mouseX, mouseY))
  {
    bakeryButton.style.currentColor = bakeryButton.style.clickedColor;
    CountFrames();
    return;
  }
  if (factoryButton.CheckClick(mouseX, mouseY))
    factoryButton.style.currentColor = factoryButton.style.clickedColor;
    CountFrames();
    return;
}

public void CountFrames()
{
  resetColorFrame = frameCount + PApplet.parseInt(frameLimit / 2);
}

public void ResetClickedColors()
{
  cookieButton.style.currentColor = cookieButton.style.originalColor;
  grandmaButton.style.currentColor = grandmaButton.style.originalColor;
  bakeryButton.style.currentColor = bakeryButton.style.originalColor;
  factoryButton.style.currentColor = factoryButton.style.originalColor;
}

class BakeryButton extends Styles
{
    float x, y, w, w_half, h, h_half;

    BakeryButtonStyle style = new BakeryButtonStyle();
    
    long total = 0L;
    int maxTotal = 500;

    int cost = 100;
    int increment = 5;
    String name = "Bakker";
    String pluralName = "Bakkers";

    public String InService()
    {
        return String.format("%s in dienst:\n%d/%d\n(%d koenk/s)", pluralName, total, maxTotal, total * increment);
    }

    public String Cost()
    {
        return String.format("Kost %d koenk\n(+%d koenk/s)", cost, increment);
    }

    BakeryButton()
    {
        x = SIZE_X / 2;
        y = SIZE_Y / 4;
        w = SIZE_X / 5;
        w_half = w / 2;
        h = SIZE_Y / 6;
        h_half = h / 2;
    }

    public void Display()
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

    public Boolean CheckClick(float mouseX, float mouseY)
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

    public void OnClick()
    {
        if (cookies.count >= cost && total < maxTotal )
        {
            total += 1L;
            cookies.count -= cost;
            increaseAmount += increment;
        }
    }
}
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

    public void Display()
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

    public Boolean CheckClick(float mouseX, float mouseY)
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

    public void OnClick()
    {
        cookies.Increase(1);
        cookies.increaseTextStyle.incrementOpacity = 255;
        cookies.ShowIncrease();
    }
}
class Cookies extends Styles
{
  long count = 0L;
  long lastAmount = 0L;

  int incrementOpacity = 255;

  IncreaseTextStyle increaseTextStyle = new Styles.IncreaseTextStyle();

  public void SetFontSize(int _fontSize)
  {
    increaseTextStyle.SetFontSize(_fontSize);
  }

  // Increases and then returns the count of total cookies by a given amount
  public double Increase(long amount) 
  {
    lastAmount = amount;
    return count += amount;
  }

  public void ShowIncrease()
  {
    increaseTextStyle.SetStyle(true);
    text(String.format("+%d", cookies.lastAmount), SIZE_X / 32, SIZE_Y - SIZE_Y / 32);
    increaseTextStyle.SetStyle(false);
  }
}
class FactoryButton extends Styles
{
    float x, y, w, w_half, h, h_half;

    FactoryButtonStyle style = new FactoryButtonStyle();
    
    long total = 0L;
    int maxTotal = 100;

    int cost = 1;
    int increment = 10;
    String name = "Fabriek";
    String pluralName = "Fabrieken";

    public String InService()
    {
        return String.format("%s in dienst:\n%d/%d\n(%d koenk/s)", pluralName, total, maxTotal, total * increment);
    }

    public String Cost()
    {
        return String.format("Kost %d koenk\n(+%d koenk/s)", cost, increment);
    }

    FactoryButton()
    {
        x = SIZE_X - SIZE_X / 4;
        y = SIZE_Y / 4;
        w = SIZE_X / 5;
        w_half = w / 2;
        h = SIZE_Y / 6;
        h_half = h / 2;
    }

    public void Display()
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

    public Boolean CheckClick(float mouseX, float mouseY)
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

    public void OnClick()
    {
        if (cookies.count >= cost && total < maxTotal )
        {
            total += 1L;
            cookies.count -= cost;
            increaseAmount += increment;
        }
    }
}
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
    public String InService()
    {
        return String.format("%s in dienst:\n%d/%d\n(%d koenk/s)", pluralName, total, maxTotal, total * increment);
    }

    // Returns the cost string
    public String Cost()
    {
        return String.format("Kost %d koenk\n(+%d koenk/s)", cost, increment);
    }

    // Displays our button and it's text when called
    public void Display()
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
    public Boolean CheckClick(float mouseX, float mouseY)
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
    public void OnClick()
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
class Score extends Styles
{
    ScoreStyle scoreStyle = new Styles.ScoreStyle();

    public void Display(long amount)
    {
        scoreStyle.SetStyle(true);
        text(String.format("Je hebt nu:\n%d koenkies", amount), SIZE_X / 32, SIZE_Y - SIZE_Y / 5);
        scoreStyle.SetStyle(false);
    }
}
class Styles
{
    class ScoreStyle
    {
        int fontSize = 1;

        public int SetFontSize(int _fontSize)
        {
            return fontSize = _fontSize;
        }

        public void SetStyle(Boolean on)
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
        public void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            return;
        }

        public void SetStyle(Boolean on)
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
        int originalColor = color(r,g,b);
        int currentColor = originalColor;
        int clickedColor = color(r-30, g-30, b-30); 

        public int SetFontSize(int _fontSize)
        {
            return fontSize = _fontSize;
        }

        public void SetStyle(Boolean on)
        {
            if (on)
            {
                fill(currentColor);
                textSize(fontSize);
                stroke(255);
                strokeWeight(5);
                textAlign(CENTER);
                // Later also fill (0) for text in CookieButton.Display()
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
        int originalColor = color(r,g,b);
        int currentColor = originalColor;
        int clickedColor = color(r-30, g-30, b-30); 

        public void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            fontSizeSmall = PApplet.parseInt(fontSize / 2);
            return;
        }

        public void SetStyle(Boolean on)
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
        int originalColor = color(r,g,b);
        int currentColor = originalColor;
        int clickedColor = color(r-30, g-30, b-30); 

        public void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            fontSizeSmall = PApplet.parseInt(fontSize / 2);
            return;
        }

        public void SetStyle(Boolean on)
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
        int originalColor = color(r,g,b);
        int currentColor = originalColor;
        int clickedColor = color(r-30, g-30, b-30); 

        public void SetFontSize(int _fontSize)
        {
            fontSize = _fontSize;
            fontSizeSmall = PApplet.parseInt(fontSize / 2);
            return;
        }

        public void SetStyle(Boolean on)
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
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CookieClicker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
