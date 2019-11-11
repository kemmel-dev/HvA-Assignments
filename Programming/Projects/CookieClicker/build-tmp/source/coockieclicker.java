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

public class coockieclicker extends PApplet {

Cookies cookies = new Cookies();

// Game is drawn at 30 fps. When frameCount reaches frameLimit,
// one second has passed.
final int frameLimit = 30;

final float SIZE_X = 960, SIZE_Y = 540;

int incrementOpacity = 255;
int incrementStep = PApplet.parseInt(255/frameLimit);

public void setup()
{
   
   
   textSize(50);
   
   // Draw the game at 30 fps
   frameRate(frameLimit);
}


public void draw()
{
  background(0);
  if (frameCount % frameLimit == 0)
  {
    cookies.Increase();
    incrementOpacity = 255;
  }
  else
  {
    ShowIncrease();
  }
  text(String.format("Je hebt nu:\n%d koenkies", cookies.count), SIZE_X / 32, SIZE_Y - SIZE_Y / 3);
}

public void ShowIncrease()
{
    fill(color(50,230,50, incrementOpacity));
    incrementOpacity -= incrementStep;
    text(String.format("+%d", cookies.lastAmount), SIZE_X / 32, SIZE_Y - SIZE_Y / 16);
    fill(255);
}
class CookieButton
{
  
}
class Cookies
{
  long count = 0L;
  long lastAmount = 0L;
  
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
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "coockieclicker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
