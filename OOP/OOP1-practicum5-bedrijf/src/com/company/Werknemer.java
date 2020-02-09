package com.company;

/**
 * Describes what an employee is and can do.
 * @author Kamiel de Visser | 500838438
 */
public class Werknemer extends Persoon {

    /** The current employee number */
    private int personeelsNummer;

    /** The number at which employee numbers start */
    private final static int PERSONEELS_NUMMER_START = 1000;
    /** The first value laatstePersoneelsNummer should get */
    private final static int PERSONEELS_NUMMER_STARTWAARDE = PERSONEELS_NUMMER_START - 1;
    /** The last value personeelsNummer used in Werknemer(maandsalaris, naam) */
    private static int laatstePersoneelsNummer = PERSONEELS_NUMMER_STARTWAARDE;
    /** The monthly salary of this employee */
    protected double maandSalaris;

    /**
     * Instantiates a new Werknemer (employee)
     * @param maandSalaris their monthly salary
     * @param naam their name
     */
    public Werknemer(double maandSalaris, String naam)
    {
        super(naam);
        this.maandSalaris = maandSalaris;
        this.personeelsNummer = laatstePersoneelsNummer + 1;
        this.laatstePersoneelsNummer = personeelsNummer;
    }

    /**
     * Gets the employee's employee number
     * @return this employee's employee number.\
     */
    public int getPersoneelsNummer() {
        return personeelsNummer;
    }

    /**
     * Gets this employee's income
     * @return this employee's income
     */
    public double berekenInkomsten()
    {
        return maandSalaris;
    }
}
