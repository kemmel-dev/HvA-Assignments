class Button
{
    PVector pos;
    int w, h;
    String text;
    color fillColor;

    Button(int x, int y, String _text, color _fillColor)
    {
        pos = new PVector(x, y);
        w = width / 6;
        h = height / 6;
        text = _text;
        fillColor = _fillColor;
    }

    void draw()
    {
        fill(fillColor);
        rect(pos.x, pos.y, w, h);
        fill(textColor);
        text(pos.x + w / 2, pos.y + h / 2)
    }

    boolean clicked()
    {
        if (mouseY > pos.y && mouseY < pos.y + h)
        {
            if (mouseX > pos.x && mouseX < pos.y + h)
            {
                return true;
            }
        }
        return false;
    }
}