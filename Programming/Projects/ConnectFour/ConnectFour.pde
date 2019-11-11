static Tile[][] board;
static Chip[][] chips;

StartMenu startMenu = new StartMenu();

Style style = new Style();

// Screen size
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

static Boolean newBoard = false;
static Boolean roundOver = true;
static int gridSize = 0;
static int currentPlayerType = 0;

Boolean delayFrame = false;

void setup()
{
    size(1920, 1080);
    rectMode(CENTER);
    textAlign(CENTER);
}

void draw()
{
    if (roundOver)
    {
        if (delayFrame)
        {
            delay(5000);
            delayFrame = false;
        }
        startMenu.Display();
    }
    else
    {
        background(style.backgroundColor);
        fill(style.textColor);
        text(String.format("Player %d, it's your turn!", currentPlayerType), SIZE_X / 2, SIZE_Y / 8);
        DrawBoard();
        DrawChips();
        if (NoFalling())
        {
            if (CheckWin())
            {
                textSize(50);
                fill(0, 255, 0);
                text("The game has been won and will reset in 5 seconds", SIZE_X / 2, SIZE_Y / 2);
                roundOver = true;
                delayFrame = true;
                frameCount = -1;
            }
        }
    }
}

Boolean NoFalling()
{
    for (int y = 0; y < board.length; y++)
    {
        for (int x = 0; x < board.length; x++)
        {   
            Tile t = board[x][y];
            if (t.chipHere != null)
            {
                Chip c = t.chipHere;
                if (c.falling)
                {
                    return false;
                }
            }
        }
    }
    return true;
}

Boolean CheckWin()
{
    for (int type = 1; type < 2 + 1; type++)
    {
        if (CheckVertical(type))
        {
            return true;
        }
        else if (CheckHorizontal(type))
        {
            return true;
        }
        else if (CheckDiagonal(type))
        {
            return true;
        }
    }
    // No win found
    return false;
}

// Check whether a diagonal is completed by playerType
Boolean CheckDiagonal(int type)
{
    Chip chipTopLeft = (board[0][0].chipHere != null) ? board[0][0].chipHere : null;
    Chip chipTopRight = (board[gridSize-1][0].chipHere != null) ? board[gridSize-1][0].chipHere : null;

    // If there's no top left chip, don't bother looking for completion
    // from top left to bottom right
    if (chipTopLeft != null)
    {   
        // Also check it's type for that reason
        if (chipTopLeft.type == type)
        {
            // Set count to 0
            int count = 0;
            for (int x = 0; x < gridSize; x++)
            {
                // Only look at the tiles on this diagonal
                if (board[x][x].chipHere != null)
                {
                    if (board[x][x].chipHere.type == type)
                    {
                        // Count if there's a same typed chip on the diagonal
                        count++;
                    }
                }
            }
            // If diagonal is complete, return true
            if (count == gridSize)
            {
                return true;
            }
        }
    }
    // If there's no top right chip, don't bother looking for completion
    // from top right to bottom left
    else if (chipTopRight != null)
    {
        if (chipTopRight.type == type)
        {
            // Set count to 0
            int count = 0;
            int y = gridSize - 1;
            for (int x = 0; x < gridSize; x++)
            {
                // Only look at the tiles on this diagonal
                if (board[x][y].chipHere != null)
                {
                    if (board[x][y].chipHere.type == type)
                    {
                        // Count if there's a same typed chip on the diagonal
                        count++;
                    }
                }
                y--;
            }
            // If diagonal is complete, return true
            if (count == gridSize)
            {
                return true;
            }
        }
    }
    // No win found
    return false;
}

// Check whether a column is completed by playerType
Boolean CheckVertical(int type)
{
    for (int x = 0; x < gridSize; x++)
    {
        int count = 0;
        for (int y = 0; y < gridSize; y++)
        {
            Tile t = board[x][y];
            if (t.chipHere != null)
            {
                if (t.chipHere.type == type)
                {
                    count++;
                }
            }
            if (count == gridSize)
            {
                return true;
            }
        }
    }
    return false;
}

// Check whether a row is completed by playerType
Boolean CheckHorizontal(int type)
{
    for (int y = 0; y < gridSize; y++)
    {
        int count = 0;
        for (int x = 0; x < gridSize; x++)
        {
            Tile t = board[x][y];
            if (t.chipHere != null)
            {
                if (t.chipHere.type == type)
                {
                    count++;
                }
            }
            if (count == gridSize)
            {
                return true;
            }
        }
    }
    return false;
}

// Count the number of chips in a column of the board at position x
int CheckPresenceVertical(int x)
{
    int count = 0;
    for (int y = 0; y < gridSize; y++)
    {
        Tile t = board[x][y];
        if (t.full)
        {
            count++;
        }
    }
    return count;
}

void DrawBoard()
{
    rectMode(CORNER);
    // Draw each tile and it's chip if it has one.
    for (int y = 0; y < board.length; y++)
    {
        for (int x = 0; x < board.length; x++)
        {   
            Tile t = board[x][y];
            t.Display();
            if (t.chipHere != null)
            {
                Chip c = t.chipHere;
                if (c.falling)
                {
                    c.yCurrent = constrain(c.yCurrent + c.fallSpeed, 0, c.y);
                    if (c.yCurrent >= c.y)
                    {
                        c.falling = false;
                    }
                }
            }
        }
    }
}

void DrawChips()
{
    rectMode(CORNER);
    // Draw each tile and it's chip if it has one.
    for (int y = 0; y < board.length; y++)
    {
        for (int x = 0; x < board.length; x++)
        {   
            Tile t = board[x][y];
            if (t.chipHere != null)
            {
                t.chipHere.Display();
            }
        }
    }
}

void mousePressed()
{
    if (roundOver)
    {
        startMenu.mousePressed();
    }
    else 
    {
        for (int y = 0; y < board.length; y++)
        {
            for (int x = 0; x < board.length; x++)
            {
                Tile t = board[x][y];
                // If clicked on an empty tile
                if (t.CheckClick(mouseX, mouseY) && t.full != true)
                {   
                    
                    // Set xPos to corresponding tile's xPos
                    float xPos = t.x + t.wHalf;
                    // Set the default yPos for a chip to the bottom row's height
                    float yPos = board[0][gridSize-1].y + t.wHalf;

                    // Count the number of chips in this vertical row
                    int numChips = CheckPresenceVertical(x);
                    // Increase the yPos if there's a number of chips in the row already
                    yPos = yPos - t.w * numChips;

                    // Create a new chip at the height it should fall to
                    Chip newChip = new Chip(currentPlayerType, xPos, yPos, t.w);
                    
                    int gridMax = gridSize - 1;
                    
                    // If we're not looking at the bottom row, chips have a chance to land
                    // on a different tile than clicked.
                    if (y < gridMax)
                    {
                        // Occupy the correct tile on the board with the new chip
                        board[x][gridMax - numChips].Occupy(newChip);
                    }
                    else
                    {
                        // Occupy the current tile on the board with the new chip
                        t.Occupy(newChip);
                    }
                    // Hand over turn to other player
                    ChangePlayer(currentPlayerType);
                    return;
                }
            }
        }
    }
}

// Called whenever the mouse is released.
void mouseReleased()
{
    startMenu.mouseReleased();
}

// Switches the current player.
int ChangePlayer(int _currentPlayerType)
{
    switch(_currentPlayerType)
    {
        case 1:
            return currentPlayerType = 2;
        case 2:
            return currentPlayerType = 1;
        default:
            return currentPlayerType = 0;
    }
}

class Style
{
    color fillColor = 255;
    color textColor = 255;
    color backgroundColor = 0;
}