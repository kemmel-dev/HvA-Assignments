final int SIZE_X = 1920;
final int SIZE_Y = 1080;

final float SCALE_X = SIZE_X / 1920f;
final float SCALE_Y = SIZE_Y / 1080f;

Duck duck;

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    noStroke();
    duck = new Duck(SIZE_X / 2, SIZE_Y / 2);
}

void draw()
{
    background(0);
    duck.draw();
}


void keyPressed()
{
    print(mouseX);
    duck = new Duck(mouseX, mouseY);
}