package com.company;
import java.util.ArrayList;
import java.util.Collections;

/**
 * Describes what a company is and can do.
 * @author Kamiel de Visser | 500838438
 */
public class Bedrijf {

    /** Holds the name of this company */
    private String naam;
    /** Holds the employees of this company */
    private ArrayList<Persoon> medewerkers = new ArrayList<>();

    /**
     * Instantiates a Bedrijf (Company) object.
     * @param naam name of this company.
     */
    public Bedrijf(String naam) {
        this.naam = naam;
    }

    /**
     * Used to print the income of this company
     */
    public void printInkomsten()
    {
        StringBuilder result = new StringBuilder("De inkomsten van de medewerkers van ");
        result.append(naam).append(" per persoon:\n");

        // Sort employees alphabetically
        Collections.sort(medewerkers);

        for (Persoon p : medewerkers)
        {
            result.append("\t").append(p).append(", inkomsten:\t");
            double inkomsten = p.berekenInkomsten();
            if (inkomsten == 0)
            {
                result.append("Geen. Dank voor uw inzet!\n");
            }
            else {
                result.append(p.berekenInkomsten()).append("\n");
            }
        }
        System.out.print(result.toString());
    }

    /**
     * Gets the number of managers in medewerkers
     * @return the number of managers in medewerkers
     */
    public int aantalManagers()
    {
        int aantal = 0;
        for (Persoon p : medewerkers)
        {
            if (p instanceof Manager)
            {
                aantal += 1;
            }
        }
        return aantal;
    }

    /**
     * Hires a new person to work at this company
     * (adds them to list of employees)
     * @param nieuweWerknemer the person to hire
     */
    public void neemInDienst(Persoon nieuweWerknemer)
    {
        medewerkers.add(nieuweWerknemer);
    }

    /**
     * Returns a string interpretation of this object.
     * Lists every income and their
     * @return a string interpretation of this object
     */
    @Override
    public String toString()
    {
        StringBuilder buffer = new StringBuilder("Het bedrijf ").append(naam).append(" heeft ");
        int aantalMedewerkers = medewerkers.size();
        if (aantalMedewerkers > 0)
        {
            buffer.append(aantalMedewerkers).append(" medewerkers:\n");
            for (Persoon medewerker : medewerkers)
            {
                buffer.append("\t").append(medewerker);
                // if this person works fulltime for this company
                if (medewerker instanceof Werknemer)
                {
                    // append their employee number
                    buffer.append(", ").append(((Werknemer) medewerker).getPersoneelsNummer());
                }
                buffer.append("\n");
            }
        }
        else {
            buffer.append("geen medewerkers.\n");
        }
        return buffer.toString();
    }
}
