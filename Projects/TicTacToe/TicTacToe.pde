static Tile[][] board;

StartMenu startMenu = new StartMenu();

// Screen size
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

static Boolean newBoard = false;
static Boolean roundOver = true;
static int gridSize = 0;
static int currentPlayerType = 0;

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
        startMenu.Display();
    }
    else
    {
        background(0);
        text(String.format("Player %d, it's your turn!", currentPlayerType), SIZE_X / 2, SIZE_Y / 8);
        DrawBoard();
    }
}

void DrawBoard()
{
    for (int y = 0; y < board.length; y++)
    {
        for (int x = 0; x < board.length; x++)
        {
            rectMode(CORNER);
            board[x][y].Display();
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
                if (board[x][y].CheckClick(mouseX, mouseY))
                {
                    board[x][y].ChangeType(currentPlayerType);
                    ChangePlayer(currentPlayerType);
                    return;
                }
            }
        }
    }
}

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

void mouseReleased()
{
    startMenu.mouseReleased();
}

class Style
{

}