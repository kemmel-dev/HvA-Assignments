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

// Game is drawn at 30 fps. When frameCount reaches frameLimit,
// one second has passed.
final int frameLimit = 30;

final float SIZE_X = 1920, SIZE_Y = 1080;
int incrementOpacity = 255;

public void setup()
{
   
   noStroke();
   rectMode(CENTER);
   textSize(50);
   
   // Draw the game at 30 fps
   frameRate(frameLimit);

   cookies.incrementStep = PApplet.parseInt(255 / frameLimit);
}


public void draw()
{
  background(125);
  cookieButton.Display();
  if (frameCount % frameLimit == 0)
  {
    cookies.Increase();
    incrementOpacity = 255;
  }
  else
  {
    cookies.ShowIncrease();
  }
  DisplayScore();
}

public void DisplayScore()
{
  fill(255);
  textSize(30);
  text(String.format("Je hebt nu:\n%d koenkies", cookies.count), SIZE_X / 32, SIZE_Y - SIZE_Y / 8);
}


class CookieButton extends Styles
{
    CookieButtonStyle cookieButtonStyle = new Styles.CookieButtonStyle();

    public void Display()
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
class Cookies extends Styles
{
  long count = 0L;
  long lastAmount = 0L;

  int incrementOpacity = 255;
  int incrementStep  = 0;

  IncreaseTextStyle increaseTextStyle = new Styles.IncreaseTextStyle();
  
  // Overload method to pass a default argument to int Increase()
  public void Increase()
  {
    Increase(1);
  }

  // Increases and then returns the count of total cookies by a given amount
  // Can be called without an argument to increase cookies by 1
  public double Increase(long amount) 
  {
    lastAmount = amount;
    return count += amount;
  }

  public void ShowIncrease()
  {
    increaseTextStyle.SetStyle(true, incrementOpacity);
    incrementOpacity -= incrementStep;
    text(String.format("+%d", cookies.lastAmount), SIZE_X / 32, SIZE_Y - SIZE_Y / 16);
    increaseTextStyle.SetStyle(false, incrementOpacity);
  }
}
class Styles
{
    class CookieButtonStyle 
    {
        public void SetStyle(Boolean on)
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
        public void SetStyle(Boolean on, int incrementOpacity)
        {
            if (on)
            {
                fill(color(50,230,50), incrementOpacity);
            }
            fill(255);
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
