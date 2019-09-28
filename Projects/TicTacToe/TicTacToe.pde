int[] grid;

StartMenu startMenu = new StartMenu();

// Screen size
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

void setup()
{
    size(1920, 1080);
    rectMode(CENTER);
    textAlign(CENTER);
}

void draw()
{
    startMenu.Display();
}

