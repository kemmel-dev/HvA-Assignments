package com.company;

/**
 * Describes what a volunteer is and can do
 * @author Kamiel de Visser | 500838438
 */
public class Vrijwilliger extends Persoon implements Oproepbaar {

    /**
     * Constructor that instantiates a new volunteer object.
     * @param naam the name of this volunteer
     */
    public Vrijwilliger(String naam)
    {
        super(naam);
    }

    /**
     * Method used to get this person's income
     * @return this person's income
     */
    @Override
    public double berekenInkomsten()
    {
        return 0d;
    }

    /**
     * Hires an employee for an amount of hours.
     * @param uren the amount of hours hired
     */
    @Override
    public void huurIn(int uren)
    {
        return;
    }
}
