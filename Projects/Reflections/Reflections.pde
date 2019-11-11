Player player;
Bullet bullet;

Boolean leftPressed = false;
Boolean rightPressed = false;
Boolean upPressed = false;
Boolean downPressed = false;

final int BULLET_SPEED = 10;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup()
{
    size(1920, 1080);
    player = new Player(new PVector(width / 2, height / 2));
    imageMode(CENTER);
    rectMode(CENTER);
}


void draw()
{
    background(255);
    player.show();
    int index = 0;
    IntList indecesToRemove = new IntList();
    for (Bullet b : bullets)
    {
        if (b.numBounces >= 5)
        {
            indecesToRemove.append(index);
        }
        b.move();
        b.show();
        b.hitEdge();
        index++;
    }

    for (int i : indecesToRemove)
    {
        bullets.remove(i);
    }
}

void keyPressed()
{
    if (key == ' ')
    {
        player.shoot();
    }
    if (key == CODED)
    {
        switch(keyCode)
        {
            case UP:
                upPressed = true;
                return;
            case DOWN:
                downPressed = true;
                return;
            case LEFT:
                leftPressed = true;
                return;
            case RIGHT:
                rightPressed = true;
                return;
            default:
                return; 
        }
    }

}

void keyReleased()
{
    if (key == CODED)
    {
        switch(keyCode)
        {
            case UP:
                upPressed = false;
                return;
            case DOWN:
                downPressed = false;
                return;
            case LEFT:
                leftPressed = false;
                return;
            case RIGHT:
                rightPressed = false;
                return;
            default:
                return; 
        }
    }
}

class Player
{
    PImage graphic;
    PVector pos;
    float angle;
    int d;

    Player(PVector _pos)
    {
        pos = _pos;
        angle = radians(0);
        d = 100;
        graphic = loadImage("player.png");
        graphic.resize(100, 100);
    }

    void shoot()
    {   
        PVector dir = PVector.sub(pos, new PVector(mouseX, mouseY));
        dir = PVector.mult(dir.normalize(), BULLET_SPEED);
        bullets.add(new Bullet(pos, dir));
    }

    void show()
    {
        changeRotation();
        translate(pos.x, pos.y);
        rotate(angle);
        image(graphic, 0, 0);
        move();
        rotate(-angle);
        translate(-pos.x, -pos.y);
    }

    void move()
    {
        int moveSpeed = 5;
        if (upPressed)
        {
            pos.y -= moveSpeed;
        }
        if (downPressed)
        {
            pos.y += moveSpeed;
        }
        if (rightPressed)
        {
            pos.x += moveSpeed;
        }
        if (leftPressed)
        {
            pos.x -= moveSpeed;
        }
    }

    void changeRotation()
    {
        angle = getAngleToMouse();
    }

    float getAngleToMouse()
    {
        float dx = mouseX - pos.x;
        float dy = pos.y - mouseY;
        float angle = atan2(dx, dy);
        return angle;
    }
}