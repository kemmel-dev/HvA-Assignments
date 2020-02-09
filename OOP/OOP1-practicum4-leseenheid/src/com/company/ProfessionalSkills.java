package com.company;

/**
 * This course stores the data for a course 'Professional Skills'
 * it contains a method to see whether the course has been passed.
 * It inherits from the LesEenheid class
 * @author Kamiel de Visser | 500838438
 */
public class ProfessionalSkills extends LesEenheid {

    private boolean gehaald;

    /**
     * Constructor for the ProfessionalSkills class
     * @param gehaald whether user has passed this course
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    ProfessionalSkills(boolean gehaald, String naam, int ects, int studiejaar)
    {
        super(naam, ects, studiejaar);
        this.gehaald = gehaald;
    }

    /**
     * Overload default constructor which sets the gehaald param to false
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    ProfessionalSkills(String naam, int ects, int studiejaar)
    {
        this(STD_GEHAALD, naam, ects, studiejaar);
    }

    /**
     * See whether user passed this course
     * @return whether user passed this course
     */
    public boolean isAfgerond()
    {
        return gehaald;
    }

    /**
     * Sets whether user passed this course
     * @param gehaald whether user passed this course
     */
    public void setGehaald(boolean gehaald)
    {
        this.gehaald = gehaald;
    }
}
