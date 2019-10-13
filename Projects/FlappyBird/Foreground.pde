class Foreground
{

    Bird bird = new Bird();
    
    float gapSize = SIZE_Y / 5;
    float yMax = SIZE_Y - 2 * gapSize;

    ArrayList<Pipe> pipeList = new ArrayList<Pipe>();
    StartButton startButton = new StartButton(SIZE_X / 2, SIZE_Y / 2, SIZE_X / 3, SIZE_Y / 8);

    void SpawnPipes()
    {   
        float x = SIZE_X;
        float gapPos = random(gapSize, yMax + 1);
        pipeList.add(new Pipe(x, 0, gapPos));
        float y = gapPos + gapSize;
        pipeList.add(new Pipe(x, y, SIZE_Y - y));
    }

    void HandlePipes()
    {
        int removeCount = 0;
        for (Pipe p : pipeList)
        {
            if (p.x < 0 - p.w)
            {
                removeCount += 1;
            }
            else
            {
                if (p.CheckCollision(bird))
                {
                    onGameOver();
                }
                p.Move();
                p.Display();
            }
        }

        if (removeCount > 0)
        {
            for (int i = 0; i < removeCount; i++)
            {
                pipeList.remove(0);
            }
            SpawnPipes();
            scoreboard.score += 1;
        }
    }

    void Display()
    {
        if (gameOver)
        {
            startButton.Display();
        }
        else
        {
            HandlePipes();
            bird.Move();
            
        }
        bird.Display();
    }

    // Gets called when the mouse has been pressed
    void mousePressed()
    {
        if (gameOver)
        {
            startButton.CheckClick();
        }
        else 
        {
            // Lets bird know there's been a click
            bird.OnClick();
        }
    }

    class StartButton
    {
        float x, y, w, h;
        float wHalf, hHalf;
        float leftBound, rightBound;
        float topBound, bottomBound;
        Style style;

        StartButton(float _x, float _y, float _w, float _h)
        {
            x = _x;
            y = _y;
            w = _w;
            h = _h;
            wHalf = w / 2;
            hHalf = h / 2;
            leftBound = x - wHalf;
            rightBound = x + wHalf;
            topBound = y - hHalf;
            bottomBound = y + hHalf;
            style = new Style();
        }

        void Display()
        {
            fill(style.fillColor);
            rect(x, y, w, h);
            fill(style.textColor);  
            textAlign(CENTER);
            text("START", x, y + h/6);
            
            text(String.format("Highscore: %d", scoreboard.highScore), x, y + h);
        }

        Boolean CheckClick()
        {
            if (mouseX > leftBound && mouseX < rightBound)
            {
                if (mouseY > topBound && mouseY < bottomBound)
                {
                    gameOver = false;
                    return true;
                }
            }
            return false;
        }

        class Style
        {
            color textColor = 255;
            color fillColor = color(230, 20, 20);
        }
    }
}