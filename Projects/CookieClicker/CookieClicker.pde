Cookies cookies = new Cookies();
CookieButton cookieButton = new CookieButton();

// Game is drawn at 30 fps. When frameCount reaches frameLimit,
// one second has passed.
final int frameLimit = 30;

final float SIZE_X = 1920, SIZE_Y = 1080;
int incrementOpacity = 255;

void setup()
{
   size(1920, 1080);
   noStroke();
   rectMode(CENTER);
   textSize(50);
   
   // Draw the game at 30 fps
   frameRate(frameLimit);

   cookies.incrementStep = int(255 / frameLimit);
}


void draw()
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

void DisplayScore()
{
  fill(255);
  textSize(30);
  text(String.format("Je hebt nu:\n%d koenkies", cookies.count), SIZE_X / 32, SIZE_Y - SIZE_Y / 8);
}


