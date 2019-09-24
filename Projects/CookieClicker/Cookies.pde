class Cookies extends Styles
{
  long count = 0L;
  long lastAmount = 0L;

  int incrementOpacity = 255;
  int incrementStep  = 0;

  IncreaseTextStyle increaseTextStyle = new Styles.IncreaseTextStyle();
  
  // Overload method to pass a default argument to int Increase()
  void Increase()
  {
    Increase(1);
  }

  // Increases and then returns the count of total cookies by a given amount
  // Can be called without an argument to increase cookies by 1
  double Increase(long amount) 
  {
    lastAmount = amount;
    return count += amount;
  }

  void ShowIncrease()
  {
    increaseTextStyle.SetStyle(true, incrementOpacity);
    incrementOpacity -= incrementStep;
    text(String.format("+%d", cookies.lastAmount), SIZE_X / 32, SIZE_Y - SIZE_Y / 16);
    increaseTextStyle.SetStyle(false, incrementOpacity);
  }
}
