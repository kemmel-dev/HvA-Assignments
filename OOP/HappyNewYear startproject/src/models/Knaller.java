package models;

public class Knaller extends Vuurwerk {

    private int aantalKnallen;
    private int decibel;
    private final static int DECIBEL_LIMIET = 120;

    public Knaller(String naam, double prijs, int aantalKnallen, int decibel, Instructie instructie)
    {
        super(naam, prijs, instructie);
        this.aantalKnallen = aantalKnallen;
        this.decibel = decibel;
    }

    public Knaller(String naam, double prijs, int aantalKnallen, int decibel)
    {
        super(naam, prijs);
        this.aantalKnallen = aantalKnallen;
        this.decibel = decibel;
    }

    @Override
    public boolean isLegaal()
    {
        if (super.isLegaal()) {
            if (decibel <= DECIBEL_LIMIET) {
                return true;
            }
        }
        return false;
    }

    @Override
    public String toString()
    {
        StringBuilder buffer = new StringBuilder("");
        buffer.append(super.toString());
        return buffer.toString();
    }
}
