

UserInterface ui = new UserInterface();

// Types of particles you can place:
// Fire, Smoke, Water, Wood, Rocks, Snow
String currentType = "Fire";

boolean mouseDown = false;

final float GRAVITY = 9.81f;

ArrayList<Particle> particleList = new ArrayList<Particle>();

void settings()
{
    size(1920 / 2, 1080 / 2);
}

void setup()
{
    ui.init();
    textAlign(CENTER, CENTER);
    textSize(width / 25);

    rectMode(CORNER);
}

void draw()
{
    background(0);
    ui.draw();
    if (mouseDown)
    {
        addParticle();
    }
    drawParticles();
}

String setPenType(String type)
{
    return currentType = type;
}

void mousePressed()
{
    if (mouseY > ui.distFromTop)
    {
        ui.mousePressed();
    }
    else
    {
        mouseDown = true;
    }
}

// Called whenever we want to place a particle at mouseX, mouseY
void addParticle()
{
    if (frameCount % 5 == 0)
    {
        noStroke();
        Particle p;
        switch(currentType)
        {
            // case "Snow":
            //     p = new Snow(new PVector(mouseX, mouseY), currentType);
            //     break;
            // <...> 
            case "Fire":
                p = new Fire(new PVector(mouseX, mouseY), currentType);
                break;
            default:
                return;
        }
        particleList.add(p);
    }
}

void drawParticles()
{
    for (Particle p : particleList)
    {
        p.display();
        p.move();
        collision(p);
    }
}

// http://flatredball.com/documentation/tutorials/math/circle-collision/
Boolean collision(Particle p)
{
    PVector thisPos = p.getPos();
    float x = thisPos.x;
    float y = thisPos.y;

    float r = p.getR();
    
    for (Particle other : particleList)
    {
        if (p == other)
        {
            
            continue;
        }

        PVector otherPos = other.getPos();

        float otherX = otherPos.x;
        float otherY = otherPos.y;

        float otherR = other.getR();

        float distanceBetweenCirclesSquared = 
            (otherX - x) * (otherX - x) + 
            (otherY - y) * (otherY - y);

        if (distanceBetweenCirclesSquared < (r + otherR) * (r + otherR))
        {
            float angle = atan2(otherY - y, otherX - x);

            float distanceBetweenCircles = sqrt(distanceBetweenCirclesSquared);
            float distToMove = r + otherR - distanceBetweenCircles;

            

            otherPos.x += cos(angle) * distToMove;
            otherPos.y = constrain(otherPos.y - cos(angle) * distToMove, 0, ui.distFromTop);
            return true;
        }
    }
    return false;
}

void mouseReleased()
{
    mouseDown = false;
}