// Defines what a paddle is and can do.
class Paddle
{
  float x, y, w, h;
  float ox, oy;
  boolean hitOnLeft;

  float hitCoordX;
  float top;
  float bottom;

  Paddle(float _x, float _y, float _w, float _h, boolean _hitOnLeft)
  {
    x = _x;
    ox = x;
    y = _y;
    oy = y;
    w = _w;
    h = _h;
    hitOnLeft = _hitOnLeft;
    // Set hit coordinate to left or right side of paddle
    hitCoordX = (hitOnLeft) ? x : x + w;
    top = y;
    bottom = y + h;
  }

  void display()
  {
    rect(x, y, w, h);
  }

  // Move this paddle up, but not out of the canvas.
  void moveUp()
  {
    if (y >= 10)
    {
      y -= 10;
      top -= 10;
      bottom -= 10;
    }
  }

  // Move this paddle down, but not out of the canvas.
  void moveDown()
  {
    if (y <= SIZE_Y - h - 10)
    {
      y += 10;
      top += 10;
      bottom += 10;
    }
  }

  // Checks whether this paddle has currently hit a ball
  Boolean hit(Ball ball)
  {    
    // If paddle is hit on left, concerns the right paddle
    if (hitOnLeft)
    {
      if (!ball.passed)
      {
        if (((ball.x_right >= paddleTwo.hitCoordX && ball.y_top <= paddleTwo.bottom) && ball.y_bottom >= paddleTwo.top))
        {
          ball.passed = true;
          return true;
        }
      }
      return false;
    }
    // Otherwise, concerns the left paddle
    else
    {
      if (!ball.passed)
      {
        if (((ball.x_left <= paddleOne.hitCoordX && ball.y_top <= paddleOne.bottom) && ball.y_bottom >= paddleOne.top))
        {
          ball.passed = true;
          return true;
        }
      }
      return false;
    }
  }
  void reset()
  {
    x = ox;
    y = oy;
    top = y;
    bottom = y + h;
  }
}
