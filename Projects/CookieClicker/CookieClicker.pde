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


void setup()
{
   size(1920, 1080);
   
   noStroke();
   rectMode(CENTER);
   textSize(50);
   
   // Draw the game at 30 fps
   frameRate(frameLimit);
   cookies.increaseTextStyle.incrementStep = int(255 / frameLimit);
   DetermineFontSizes();
}

void DetermineFontSizes()
{
  bakeryButton.style.SetFontSize(50);
  grandmaButton.style.SetFontSize(50);
  cookieButton.style.SetFontSize(50);
  factoryButton.style.SetFontSize(50);
  cookies.increaseTextStyle.SetFontSize(30);
  score.scoreStyle.SetFontSize(80);
}

void draw()
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

void mouseClicked()
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

void CountFrames()
{
  resetColorFrame = frameCount + int(frameLimit / 2);
}

void ResetClickedColors()
{
  cookieButton.style.currentColor = cookieButton.style.originalColor;
  grandmaButton.style.currentColor = grandmaButton.style.originalColor;
  bakeryButton.style.currentColor = bakeryButton.style.originalColor;
  factoryButton.style.currentColor = factoryButton.style.originalColor;
}

