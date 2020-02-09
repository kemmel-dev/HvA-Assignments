package com.company;

/**
 * Describes what a ZZP'er is and can do.
 * @author Kamiel de Visser | 500838438
 */
public class Zzper extends Persoon implements Oproepbaar {

    /** The hourly rate for this ZZP'er */
    private double uurtarief;
    /** The amount of hours this ZZP'er has worked for */
    private int urenGewerkt;

    /**
     * Constructor function that instantiates a new ZZP'er object
     * @param uurtarief this ZZP'ers hourly rate
     * @param naam this ZZP'ers name
     */
    public Zzper(double uurtarief, String naam)
    {
        super(naam);
        this.uurtarief = uurtarief;
    }

    /**
     * Hires an employee for an amount of hours.
     * @param uren the amount of hours hired
     */
    @Override
    public void huurIn(int uren)
    {
        urenGewerkt += uren;
    }

    /**
     * Method used to get this person's income
     * @return this person's income
     */
    @Override
    public double berekenInkomsten()
    {
        return uurtarief * urenGewerkt;
    }
}
