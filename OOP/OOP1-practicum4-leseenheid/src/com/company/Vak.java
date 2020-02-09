package com.company;

/**
 * Stores a course's name and it's grade
 * contains a method to see whether the grade
 * is high enough to pass this course.
 * @author Kamiel de Visser | 500838438
 * */
public class Vak extends LesEenheid {

    private Double cijfer;

    /**
     * Constructor for the Vak class
     * @param cijfer the grade got for this course
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    Vak(Double cijfer, String naam, int ects, int studiejaar)
    {
        super(naam, ects, studiejaar);
        this.cijfer = cijfer;
    }

    /**
     * Overload constructor for the Vak class which sets the cijfer to STD_CIJFER
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    Vak(String naam, int ects, int studiejaar)
    {
        this(STD_CIJFER, naam, ects, studiejaar);
    }

    /**
     * See whether user passed this course
     * @return whether user passed this course
     */
    public boolean isAfgerond()
    {
        if (cijfer >= ONDERGRENS_VOLDOENDE)
        {
            return true;
        }
        return false;
    }

    /**
     * Sets the cijfer
     * @param cijfer cijfer to be set
     */
    public void setCijfer(Double cijfer)
    {
        this.cijfer = cijfer;
    }

    /**
     * Prints this object
     * @return a string representation of this object
     */
    public String toString()
    {
        StringBuilder result = new StringBuilder();
        result.append(super.toString()).append(", cijfer ").append(cijfer);
        return result.toString();
    }
}
