package models;

public class Vuurwerk extends Product {

    private Instructie instructie;
    private final static String INSTRUCTIE_DEFAULT = "ontbreekt";

    public Vuurwerk(String naam, double prijs, Instructie instructie)
    {
        super(naam,prijs);
        this.instructie = instructie;
    }

    public Vuurwerk(String naam, double prijs)
    {
        super(naam, prijs);
        this.instructie = null;
    }

    public boolean isLegaal()
    {
        // Als vuurwerk instructie heeft
        if (instructie != null) {
            // En Nederlandstalig is
            if (instructie.isNederlandstalig()) {
                // Dan is het vuurwerk legaal
                return true;
            }
        }
        return false;
    }

    @Override
    public String toString()
    {
        StringBuilder buffer = new StringBuilder();
        buffer.append(super.toString());
        buffer.append("\n\t  Instructie: ").append(getInstructieString());
        buffer.append("\n\t  Legaal: ").append(isLegaal());
        return buffer.toString();
    }

    private String getInstructieString()
    {
        if (instructie != null) {
            return instructie.toString();
        }
        else {
            return INSTRUCTIE_DEFAULT;
        }
    }
}
