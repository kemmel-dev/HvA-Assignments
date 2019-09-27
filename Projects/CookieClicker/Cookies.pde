class Cookies extends Styles
{
  long count = 0L;
  long lastAmount = 0L;

  int incrementOpacity = 255;

  IncreaseTextStyle increaseTextStyle = new Styles.IncreaseTextStyle();

  void SetFontSize(int _fontSize)
  {
    increaseTextStyle.SetFontSize(_fontSize);
  }

  // Increases and then returns the count of total cookies by a given amount
  double Increase(long amount) 
  {
    lastAmount = amount;
    return count += amount;
  }

  void ShowIncrease()
  {
    increaseTextStyle.SetStyle(true);
    text(String.format("+%d", cookies.lastAmount), SIZE_X / 32, SIZE_Y - SIZE_Y / 32);
    increaseTextStyle.SetStyle(false);
  }
}
