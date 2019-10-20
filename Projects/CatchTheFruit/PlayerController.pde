class PlayerController
{
    Player player;

    Boolean leftDown = false;
    Boolean rightDown = false;

    int xBoundStart;
    int xBoundEnd;

    PlayerController(Player _player)
    {
        player = _player;
        xBoundStart = player.graphic.width / 2;
        xBoundEnd = SIZE_X - xBoundStart;
    }

    void move()
    {
        if (leftDown)
        {
            player.position.x = constrain(player.position.x - player.v, xBoundStart, xBoundEnd);
        }
        if (rightDown)
        {
            player.position.x = constrain(player.position.x + player.v, xBoundStart, xBoundEnd);
        }
    }

    void keyPressed()
    {
        switch(key)
        {
            case 'a':
                leftDown = true;
                return;
            case 'd':
                rightDown = true;
                return;
            default:
                return;
        }  
    }

    void keyReleased()
    {
        switch(key)
        {
            case 'a':
                leftDown = false;
                return;
            case 'd':
                rightDown = false;
                return;
            default:
                return;
        }  
    }
}