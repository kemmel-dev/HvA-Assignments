class StartMenu
{
    // Define minimum and maximum grid size possible.
    int gridSizeMin = 3;
    int gridSizeMax = 10;

    // Create a reference to our Style class and create a slider
    Style style = new Style();
    Slider slider = new Slider(SIZE_X / 2, SIZE_Y / 2, gridSizeMin, gridSizeMax);
    StartButton startButton = new StartButton(SIZE_X / 2, SIZE_Y - SIZE_Y / 4, SIZE_X / 4, SIZE_Y / 8);

    // Renders everything in our start menu
    void Display()
    {
        background(0);
        fill(255);
        textSize(style.fontSize);
        text("Please choose the grid size you want to play at by inputting a number below:", SIZE_X / 2, SIZE_Y / 3);
        slider.Display();
        startButton.Display();
    }

    // Called by TicTacToe's mousePressed()
    void mousePressed()
    {
        // If start button has been clicked
        if (startButton.CheckClick(mouseX, mouseY))
        {
            // Round is no longer over
            TicTacToe.roundOver = false;
            // Set the current player to a random player
            TicTacToe.currentPlayerType = int(random(1,3));

            int currentValue = int(slider.value);
            // Set gridSize to the slider value
            TicTacToe.gridSize = currentValue;
            
            // Create a new 2d-array board with blank tiles of the size gridSize
            TicTacToe.board = new Tile[currentValue][currentValue];
            int max = TicTacToe.board.length;
            
            // Determine where the board starts on y and the needed tileWidth
            float yPos = SIZE_Y / 6;
            float tileWidth = (SIZE_Y - SIZE_Y / 3) / currentValue;
            // Determine where the board starts on x
            float boardWidth = tileWidth * currentValue;
            float leftOver = SIZE_X - boardWidth;
            float xPos = leftOver / 2;
            for (int y = 0; y < max; y++)
            {
                for (int x = 0; x < max; x++)
                {
                    // fill the board with blank tiles
                    TicTacToe.board[x][y] = new Tile(0, xPos, yPos, tileWidth);
                    xPos += tileWidth;
                }
                xPos = leftOver / 2;
                yPos += tileWidth;
            }
        }
        else 
        {
            slider.mousePressed();
        }
        
    }

    // Called by TicTacToe's mouseReleased()
    void mouseReleased()
    {
        slider.mouseReleased();
    }

    // A slider consists of a slider bar and an indicator
    // It is used to set a value between a minimum and maximum value by a UI element.
    class Slider
    {
        Style style = new Style();

        // Positions, width and height of the slider bar
        float x, y, w, h;

        // The slider has a (minimum/maximum) value, which defaults to the minimum value
        float value, sliderMin, sliderMax;
        
        // Indicates where the slider bar starts and ends
        float sliderMinX, sliderMaxX;

        float textX, textY;

        // Indicator on the slider bar
        Indicator indicator;

        // Stores whether mouse button is still down after a click on indicator
        Boolean clicked = false;
        
        // Constructor function for Slider
        Slider(float _x, float _y, float _sliderMin, float _sliderMax)
        {
            w = SIZE_X / style.rSliderWidth;
            h = SIZE_Y / style.rSliderHeight;
            x = _x;
            y = _y;

            sliderMin = _sliderMin;
            sliderMax = _sliderMax;
            value = sliderMin;

            indicator = new Indicator(x - w / 2, x + w / 2, y, style.rSliderValueHeight);

            textX = x + w - w / 4;
            textY = y + h / 2;
        }

        // Handles mousePressed events
        void mousePressed()
        {
            if (indicator.CheckClick(mouseX, mouseY))
            {
                // Clicked on indicator
                clicked = true;
            }
        }

        // Handles mosueReleased events
        void mouseReleased()
        {
            // No longer clicking
            clicked = false;
        }

        // Displays the slider bar and it's indicator
        void Display()
        {
            // Display value in text
            fill(style.sliderValueColor);
            int tempValue = GetValue();
            text(String.format("%d x %d", tempValue, tempValue), textX, textY);
            // If indicator was clicked and mouse is still down, 
            // move the slider and set the new value.
            if (clicked)
            {
                indicator.x = constrain(mouseX, indicator.xMin, indicator.xMax);
                value = GetValue();
            }
            // Draw the slider bar
            fill(style.sliderBarColor);
            rect(x, y, w, h);
            // Draw the indicator
            fill(style.sliderIndicatorColor);
            indicator.Display();
            
        }

        // Determines at what value the slider is set at
        int GetValue()
        {
            // Gets the distance from the indicator to the start of the slider bar
            float dist = indicator.x - indicator.xMin;
            // Determine how far along the slider bar we're positioned
            float percentage = dist / w;
            // Return the corresponding value
            return int(sliderMin + percentage * (sliderMax - sliderMin));
        }

        // Indicator to set the slider to a certain value.
        class Indicator
        {
            // Indicator has an x and y pos and a height
            float x, y, h;
            // Indicator can't go past xMin and xMax
            float xMin, xMax;

            Indicator(float _xMin, float _xMax, float _y, float _h)
            {
                xMin = _xMin;
                xMax = _xMax;
                x = xMin;
                y = _y;
                h = _h;
            }

            void Display()
            {
                rect(x, y, h, h);
            }

            // Returns true if this indicator has been clicked, false otherwise.
            Boolean CheckClick(float mouseX, float mouseY)
            {
                float distX = abs(mouseX - x);
                float distY = abs(mouseY - y);

                if (distX <= style.rSliderValueHeight / 2 && distY <= style.rSliderValueHeight / 2)
                {
                    return true;
                }
                return false;
            }
        }

        // Contains styling settings for the sliderbar and indicator
        class Style
        {
            color sliderIndicatorColor = 255;
            color sliderBarColor = color(153, 153, 153);
            color sliderValueColor = 255;

            // Relative (r) heights and widths
            // rExampleName would be used as: (SIZE_X or SIZE_Y) / rEXampleName
            int rSliderHeight = 64;
            int rSliderWidth = 4;
            float rSliderValueHeight = rSliderHeight / 1.5;
        }
    }

    class StartButton
    {
        // Startbutton x and y pos, width and height
        float x, y, w, wHalf, h, hHalf;

        StartButton(float _x, float _y, float _w, float _h)
        {
            x = _x;
            y = _y;
            w = _w;
            h = _h;
            wHalf = w / 2;
            hHalf = h / 2;
        }

        void Display()
        {
            rect(x, y, w, h);
        }

        // Returns true if this indicator has been clicked, false otherwise.
        Boolean CheckClick(float mouseX, float mouseY)
        {
            float distX = abs(mouseX - x);
            float distY = abs(mouseY - y);

            if (distX <= wHalf && distY <= hHalf)
            {
                return true;
            }
            return false;
        }
    }

    class Style
    {
        int fontSize = 30;
    }

}