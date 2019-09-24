// Defines what a ball is and can do.
class Ball
{
  // x/y pos, width, radius
  float x, y, w, r;
  // velocity
  float v_x = SIZE_X / 100;
  float v_y = v_x;

  // Coordinates of the ball's bounds
  float x_left;
  float x_right;
  float y_top;
  float y_bottom;
  
  Boolean passed = false;

  Ball(float _x, float _y, float _w)
  {
    x = _x;
    y = _y;
    w = _w;
    r = w / 2;
    x_left = x - r;
    x_right = x + r;
    y_top = y - r;
    y_bottom = y + r;
  }

  void move()
  {
    x += v_x;
    x_left = x - r;
    x_right = x + r;
    y += v_y;
    y_top = y - r;
    y_bottom = y + r;
  }

  void display()
  {
    ellipse(x, y, w, w);
  }
  
  // Reset the ball to the starting position for player 1 or 2.
  void reset(int playerNo)
  {
    if (playerNo == 1)
    {
      ball.x = SIZE_X / 4;
      ball.y = HALF_Y;
      ball.v_x = - SIZE_X / 100;
      ball.v_y = 0;
    }
    else if (playerNo == 2)
    {
      ball.x = (SIZE_X / 4) * 3;
      ball.y = HALF_Y;
      ball.v_x = SIZE_X / 100;
      ball.v_y = 0;
    }
  }
}
