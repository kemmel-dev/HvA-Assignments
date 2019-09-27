Cookies cookies = new Cookies();
GoldenCookie goldenCookie = new GoldenCookie();
CookieButton cookieButton = new CookieButton();
GrandmaButton grandmaButton = new GrandmaButton();
BakeryButton bakeryButton = new BakeryButton();
FactoryButton factoryButton = new FactoryButton();
Score score = new Score();

// Game is drawn at 30 fps. When frameCount reaches frameLimit,
// one second has passed.
final int frameLimit = 30;
int resetColorFrame = 0;
int resetGoldencookieFrame = 0;

final float SIZE_X = 1920, SIZE_Y = 1080;
int incrementOpacity = 255;

long increaseAmount = 0L;

Boolean countingFrames = false;

void setup()
{
   size(1920, 1080);
   
   noStroke();
   ellipseMode(CENTER);
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
  goldenCookie.style.SetFontSize(50);
  grandmaButton.style.SetFontSize(50);
  cookieButton.style.SetFontSize(50);
  factoryButton.style.SetFontSize(50);
  cookies.increaseTextStyle.SetFontSize(30);
  score.scoreStyle.SetFontSize(80);
}

void draw()
{
  background(0);
  goldenCookie.Display();
  bakeryButton.Display();
  cookieButton.Display();
  grandmaButton.Display();
  factoryButton.Display();
  if (countingFrames)
  {
    if (frameCount > resetColorFrame)
    {
      ResetClickedColors();
      resetColorFrame = 0;
      if (goldenCookie.hidden)
      {
        countingFrames = false;
      }
    }
  }

  if (frameCount % frameLimit == 0)
  {
    if (goldenCookie.hidden)
    {
      PlaceGoldenCookie();
    }
    else
    {
      if (frameCount > resetGoldencookieFrame)
      {
        goldenCookie.hidden = true;
      }
    }
    cookies.Increase(increaseAmount);
    cookies.increaseTextStyle.incrementOpacity = 255;
  }
  cookies.ShowIncrease();
  score.Display(cookies.count);
}

// If no golden cookie is shown, takes a chance to place a golden cookie randomly.
void PlaceGoldenCookie()
{
  if (goldenCookie.hidden)
  {
    // Get a random number up to pMax as p
    float pMax = 100;
    float p = random(0, pMax);

    // percentageCorrect defines the probability at which we place a cookie.
    float percentageCorrect = 5;
    if (p <= percentageCorrect)
    {
      goldenCookie.hidden = false;
      goldenCookie.SetRandomPos();
      countingFrames = true;
      resetGoldencookieFrame = frameCount + 60;
    }
  }
}

void mouseClicked()
{
  if (cookieButton.CheckClick(mouseX, mouseY))
  {
    cookieButton.style.currentColor = cookieButton.style.clickedColor;
    cookieButton.style.currentChipColor = cookieButton.style.chocolateChipColorClicked;
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
  {
    factoryButton.style.currentColor = factoryButton.style.clickedColor;
    CountFrames();
    return;
  }
  if (goldenCookie.CheckClick(mouseX, mouseY))
    return;
}

void CountFrames()
{
  resetColorFrame = frameCount + int(frameLimit / 2);
  countingFrames = true;
}

void ResetClickedColors()
{
  cookieButton.style.currentColor = cookieButton.style.originalColor;
  cookieButton.style.currentChipColor = cookieButton.style.chocolateChipColor;
  grandmaButton.style.currentColor = grandmaButton.style.originalColor;
  bakeryButton.style.currentColor = bakeryButton.style.originalColor;
  factoryButton.style.currentColor = factoryButton.style.originalColor;
}

