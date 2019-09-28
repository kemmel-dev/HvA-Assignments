Tile[] board;

StartMenu startMenu = new StartMenu();

// Screen size
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

static Boolean newBoard = false;
static Boolean roundOver = true;
static int gridSize = 0;

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
        if (newBoard)
        {
            CreateNewBoard();
        }
    }
}

void CreateNewBoard()
{
    board = new Tile[gridSize];
    for (int i = 0; i < board.length; i++)
    {
        board[i] = new Tile(0);
        print(board[i].type);
    }
}

void mousePressed()
{
    startMenu.mousePressed();
}

void mouseReleased()
{
    startMenu.mouseReleased();
}


