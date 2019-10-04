class Bird
{
    // Important: positon and size of initial bird
    float x, y, birdD;

    // These derive from bird.x, bird.y and bird.birdD
    float birdR, birdDThird, birdRThird;
    float eyeX, beakX;
    float wingX1, wingX2, wingY;

    // Holds the current movement speed for our bird in the y direction
    float movementSpeedY = MOVE_SPEED_X;

    // Holds the current frame at which the bird needs to stop jumping.
    float jumpOverFrame;

    // Is the bird going up or down?
    Boolean goingUp = true;
    Boolean jumpAllowed = true;

    Style style = new Style();

    Bird()
    {
        x = SIZE_X / 4;
        y = SIZE_Y / 2;
        birdD = style.birdSize;

        // Predetermine a bunch of set variables so we don't calculate them each iteration of display
        birdDThird = birdD / 3;
        birdR = birdD / 2;
        birdRThird = birdR / 3;
        beakX = x + birdR;
        eyeX = x + birdRThird;

        wingX1 = x;
        wingX2 = x - birdRThird;
    }

    void Move()
    {
        // If jumping
        if (!jumpAllowed)
        {
            // If we need to stop jumping
            if (frameCount > jumpOverFrame)
            {
                OnJumpOver();
            }
        }

       float dy = movementSpeedY;
        // Adjust y position to the new position, but dont go out of the canvas
        y = constrain(y + dy, 0, SIZE_Y);
    }

    // When the user has tapped the screen
    void OnTap()
    {
        if (jumpAllowed)
        {   
            // Make a jump
            OnJump();
        }
    }

    // Called when the bird wants to jump
    void OnJump()
    {
        Rotate();
        // Move up
        movementSpeedY = - MOVE_SPEED_X;
        jumpAllowed = false;

        // Set the frame when this jump over.
        jumpOverFrame = frameCount + FRAME_RATE;
    }

    // Called when the bird's jump is over
    void OnJumpOver()
    {
        Rotate();

        movementSpeedY = MOVE_SPEED_X;

        // Allow another jump
        jumpAllowed = true;
    }

    // Rotates the bird 
    void Rotate()
    {
        translate(x, y);
        if (!jumpAllowed)
        {
            rotate(radians(-30));
        }
        else
        {
            rotate(radians(30));
        }
        translate(-x,-y);
    }

    void Display()
    {
        Rotate();
        // Draw the bird's body
        stroke(style.birdStrokeColor);
        strokeWeight(style.birdStrokeWeight);
        fill(style.birdColor);
        ellipse(x,y, birdD, birdD);
        noStroke();

        // Draw the beak
        fill(style.beakColor);
        ellipse(beakX, y, birdDThird, birdDThird);

        // Draw the eye
        fill(style.eyeColor);
        ellipse(eyeX, y - birdRThird, style.eyeSize, style.eyeSize);

        stroke(0);
        strokeWeight(style.birdStrokeWeight);
        line(wingX1, y + birdRThird, wingX2, y + birdRThird);
        noStroke();
    }

    class Style
    {        
        float birdSize = SIZE_X / 16;
        float beakSize = birdSize / 3;
        float eyeSize = beakSize - beakSize / 3;
        color eyeColor = 0;
        color beakColor = color(255, 20, 20);
        color birdColor = color(255, 255, 0);
        color birdStrokeColor = color(67, 69, 0);
        color birdStrokeWeight = SIZE_X / 100;
    }
}