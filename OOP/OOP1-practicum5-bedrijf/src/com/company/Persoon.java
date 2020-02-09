package com.company;

/**
 * Describes what a person is and can do.
 * @author Kamiel de Visser | 500838438
 */
public abstract class Persoon implements Comparable<Persoon> {

    /** Name of this person */
    private String naam;

    /**
     * Instantiates a new Persoon object
     * @param naam name of this person
     */
    public Persoon(String naam) {
        this.naam = naam;
    }

    /**
     * Abstract method used to get this person's income
     * @return this person's income
     */
    public abstract double berekenInkomsten();

    /**
     * Compares this person to another person (by name).
     * @param anderPersoon the other person to compare with.
     * @return -1 if this person's name is sorted before the other alphabetically
     *         0 if this person's name is equal to the other person's name.
     *         1 if this person's name is sorted after the other person alphabetically.
     */
    public int compareTo(Persoon anderPersoon) {
        return naam.compareTo(anderPersoon.naam);
    }

    /**
     * Returns a string interpretation of this object (this person's name)
     * @return a string interpretation of this object
     */
    public String toString() {
        return this.naam;
    }
}
