package com.company;

/**
 * class which holds default information for a course type object.
 * this includes it's name, the ECTS you get for completing this course,
 * and the study year this course is attended in.
 * @author Kamiel de Visser
 */
public class LesEenheid {
    protected String naam;
    protected int ects;
    protected int studiejaar;

    protected static final double STD_CIJFER = -1d;
    protected static final boolean STD_GEHAALD = false;
    protected static final float ONDERGRENS_VOLDOENDE = 5.5f;

    /**
     * Default constructor for this class
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    LesEenheid(String naam, int ects, int studiejaar)
    {
        this.naam = naam;
        this.ects = ects;
        this.studiejaar = studiejaar;
    }

    /**
     *  Returns a string representation of this class.
     */
    public String toString()
    {
        StringBuilder result = new StringBuilder();
        result.append(naam).append(", ").append(ects).append(" ects, ");
        result.append("studiejaar ").append(studiejaar);
        return result.toString();
    }
}
