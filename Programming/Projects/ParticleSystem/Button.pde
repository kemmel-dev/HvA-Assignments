
class Button
{
    PVector pos;
    int w, h;
    String name;
    color fillColor;
    color textColor;
    int fontSize;

    Button(int x, int y, String _name, color _fillColor, color _textColor)
    {
        pos = new PVector(x, y);
        w = width / 6;
        h = height / 6;
        name = _name;
        fillColor = _fillColor;
        textColor = _textColor;
    }

    // Buttons are drawn assuming textAlign(CENTER, CENTER) and rectMode(CORNER) are used.
    void draw()
    {
        fill(fillColor);
        rect(pos.x, pos.y, w, h);
        fill(textColor);
        text(name, pos.x + w / 2, pos.y + h / 2);
    }

    boolean clicked()
    {
        if (mouseX > pos.x && mouseX < pos.x + w)
        {
            return true;
        }
        return false;
    }
}