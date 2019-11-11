class Score extends Styles
{
    ScoreStyle scoreStyle = new Styles.ScoreStyle();

    void Display(long amount)
    {
        scoreStyle.SetStyle(true);
        text(String.format("Je hebt nu:\n%d koenkies", amount), SIZE_X / 32, SIZE_Y - SIZE_Y / 5);
        scoreStyle.SetStyle(false);
    }
}