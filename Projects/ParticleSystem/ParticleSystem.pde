
UserInterface ui = new UserInterface();

void settings()
{
    size(1920 / 2, 1080 / 2);
}

void setup()
{
    ui.init();
    textAlign(CENTER);
}

void draw()
{
    background(0);
    ui.draw();
}