package models;

/**
 * Beschrijft een instructie. Een instructie kan Nederlandstalig zijn, heeft een
 * minimum leeftijd om het object waar de instructie bij hoort te gebruiken, en heeft
 * een omschrijving waarin de instructies gegeven worden.
 *
 * @Author Kamiel de Visser | 500838438
 */
public class Instructie {

    private boolean nederlandstalig;
    private int minimumLeeftijd;
    private String omschrijving;

    /**
     * Constructor functie, wordt gebruikt om nieuwe instances van instructies aan te maken.
     * @param nederlandstalig of deze instructie Nederlandstalig is
     * @param minimumLeeftijd de minimum leeftijd om dit object te gebruiken
     * @param omschrijving de instructies.
     */
    public Instructie(boolean nederlandstalig, int minimumLeeftijd, String omschrijving) {
        this.nederlandstalig = nederlandstalig;
        this.minimumLeeftijd = minimumLeeftijd;
        this.omschrijving = omschrijving;
    }

    /**
     * Haalt op of deze instructie Nederlandstalig is.
     * @return of de instructie Nederlandstalig is
     */
    public boolean isNederlandstalig() {
        return nederlandstalig;
    }

    /**
     * Haalt de minimum leeftijd van deze instructie op.
     * @return de minimum leeftijd van deze instructie.
     */
    public int getLeeftijd() {
        return minimumLeeftijd;
    }

    @Override
    public String toString() {
        return "Nederlandstalig=" + nederlandstalig + ", leeftijd=" + minimumLeeftijd + ", omschrijving=" + omschrijving;
    }
}


