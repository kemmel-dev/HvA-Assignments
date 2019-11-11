class Duck
{
    PVector pos;

    private int bodyWidth, bodyHeight;
    private int headXOffset, headYOffset, headWidth;
    private int beakXOffset, beakHeight, beakWidth;
    private int wingWidth, wingHeight;
    private int eyeXOffset, eyeYOffset, eyeSize;

    color headColor;
    color bodyColor;
    color beakColor;
    color wingColor;

    Duck(int x, int y)
    {
        int dir = int(random(0,2));
        if (dir == 0)
        {
            dir = -1;
        }
        else
        {
            dir = 1;
        }
        pos = new PVector(x, y);
        bodyWidth = int(100 * SCALE_X);
        bodyHeight = int(40 * SCALE_Y);
        headYOffset = int(25 * SCALE_Y);
        headXOffset = headYOffset * dir;
        headWidth = int(38 * SCALE_X);
        beakXOffset = headXOffset + int(15 * SCALE_X) * dir;
        beakWidth = int(20 * SCALE_X);
        beakHeight = int(10 * SCALE_Y);
        eyeSize = int(3 * SCALE_X);
        eyeXOffset = headXOffset + int(5 * SCALE_X) * dir;
        eyeYOffset = headYOffset + int(8 * SCALE_X);
        setColors();
    }

    void draw()
    {
        fill(bodyColor);
        // Body
        ellipse(pos.x, pos.y, bodyWidth, bodyHeight);

        fill(headColor);
        // Head
        circle(pos.x + headXOffset, pos.y - headYOffset, headWidth);

        // Beak
        fill(beakColor);
        ellipse(pos.x + beakXOffset, pos.y - headYOffset, beakWidth, beakHeight);

        // Eyes
        fill(0);
        circle(pos.x + eyeXOffset, pos.y - eyeYOffset, eyeSize);

        // Wing
        fill(wingColor);
        stroke(0);
        ellipse(pos.x, pos.y, bodyWidth / 3, bodyHeight / 3);
        noStroke();
    }

    void setColors()
    {
        int type = int(random(0, 4));

        color white = 255;
        color offWhite = color(222, 216, 204);
        color duckYellow = color(255,239,1);
        color duckYellowDarker = color(235,219,1);
        color duckOrange = color(255, 125, 25);
        color duckGreen = color(3, 123, 9);
        color duckBeige = color(215, 196, 163);
        color duckBeigeDarker = color(178, 161, 132);
        switch(type)
        {
            // Yellow ducky case
            case 0:
                headColor = duckYellow;
                bodyColor = duckYellow;
                beakColor = duckOrange;
                wingColor = duckYellowDarker;
                return;
            // Mallard case
            case 1:
                headColor = duckGreen;
                bodyColor = duckBeige;
                beakColor = duckYellowDarker;
                wingColor = duckBeigeDarker;
                return;
            // White duck case orange beak
            case 2:
                headColor = white;
                bodyColor = white;
                beakColor = duckOrange;
                wingColor = offWhite;
                return;
            case 3:
                headColor = duckBeigeDarker;
                bodyColor = duckBeige;
                wingColor = duckBeigeDarker;
                beakColor = duckOrange;
            default:
                return;
        }
    }
}