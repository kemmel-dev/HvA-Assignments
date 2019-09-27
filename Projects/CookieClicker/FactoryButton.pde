class FactoryButton extends Styles
{
    float x, y, w, w_half, h, h_half;

    FactoryButtonStyle style = new FactoryButtonStyle();
    
    long total = 0L;
    int maxTotal = 100;

    int cost = 1;
    int increment = 10;
    String name = "Fabriek";
    String pluralName = "Fabrieken";

    String InService()
    {
        return String.format("%s in dienst:\n%d/%d\n(%d koenk/s)", pluralName, total, maxTotal, total * increment);
    }

    String Cost()
    {
        return String.format("Kost %d koenk\n(+%d koenk/s)", cost, increment);
    }

    FactoryButton()
    {
        x = SIZE_X - SIZE_X / 4;
        y = SIZE_Y / 4;
        w = SIZE_X / 5;
        w_half = w / 2;
        h = SIZE_Y / 6;
        h_half = h / 2;
    }

    void Display()
    {
        style.SetStyle(true);
        rect(x, y, w, h);
        fill(255);
        textSize(style.fontSizeSmall);
        text(InService(), x, y + SIZE_Y / 8);
        fill(0);
        text(Cost(), x, y + SIZE_Y / 50);
        textSize(style.fontSize);
        text("Huur " + name, x, y - SIZE_Y / 50);       
        style.SetStyle(false);
    }

    Boolean CheckClick(float mouseX, float mouseY)
    {
        float distX = abs(mouseX - x);
        float distY = abs(mouseY - y);

        if (distX <= w_half && distY <= h_half)
        {
            OnClick();
            return true;
        }
        return false;
    }

    void OnClick()
    {
        if (cookies.count >= cost && total < maxTotal )
        {
            total += 1L;
            cookies.count -= cost;
            increaseAmount += increment;
        }
    }
}