package com.company;

/**
 * Describes what a manager is and can do.
 * @author Kamiel de Visser | 500838438
 */
public class Manager extends Werknemer {

    /** The bonus this manager earned */
    private double bonus;

    /**
     * Initializes a new Manager
     * @param maandSalaris their monthly salary
     * @param naam their name
     */
    public Manager(double maandSalaris, String naam)
    {
        super(maandSalaris, naam);
    }

    /**
     * Method used to get this person's income
     * @return this person's income
     */
    @Override
    public double berekenInkomsten()
    {
        return maandSalaris + bonus;
    }

    /**
     * Grant this manager a bonus
     * @param bonus the bonus granted to this manager
     */
    public void kenBonusToe(double bonus)
    {
        this.bonus = bonus;
    }
}
