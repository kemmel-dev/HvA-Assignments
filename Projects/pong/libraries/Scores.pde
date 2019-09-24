class Scores
{
  int scoreP1, scoreP2;
  float x1, x2, y;
  
  Scores(float _x1, float _x2, float _y)
  {
    scoreP1 = 0;
    scoreP2 = 0;
    x1 = _x1;
    x2 = _x2;
    y = _y;
  }
  
  void addPointTo(int playerNo)
  {
    if (playerNo == 1)
    {
      scoreP1 += 1;
    }
    else if (playerNo == 2)
    {
      scoreP2 += 1;
    }
  }
  
  void update()
  {
    fill(255);
    text(scoreP1, x1, y);
    text(scoreP2, x2, y);
  }
}
