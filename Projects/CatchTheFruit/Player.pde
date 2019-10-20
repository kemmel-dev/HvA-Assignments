class Player
{   
    // Stores the image that represents our player
    PImage graphic;

    // Stores this player's x and y coördinates
    PVector position;

    // Stores this player's velocity
    int v = SIZE_X / 200;

    // Controller object controls player's movement
    PlayerController controller;

    Player(int x, int y)
    {
        // Load the graphic for this player object
        graphic = loadImage("basket.png");
        graphic.resize(PLAYER_WIDTH, 0);

        // Initialize position to given start-coörds
        position = new PVector(x, y);

        controller = new PlayerController(this);
    }

    void draw()
    {
        // Display the graphic for this player object
        image(graphic, position.x, position.y);
    }
}