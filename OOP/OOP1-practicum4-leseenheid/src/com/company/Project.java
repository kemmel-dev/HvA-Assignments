package com.company;

/**
 * This class holds the data for the grading of a project.
 * It holds mutiple grades for multiple courses and contains
 * a method to see whether all these courses are passed.
 * It inherits from the LesEenheid class.
 * @author Kamiel de Visser | 500838438
 */
public class Project extends LesEenheid {
    private Double[] cijfers = new Double[3];
    private Double productCijfer;
    private Double procesCijfer;
    private Double methodenEnTechniekenCijfer;

    private final int INDEX_PRODUCT = 0;
    private final int INDEX_PROCES = 1;
    private final int INDEX_METHODEN = 2;

    /**
     * Constructor for this class
     * @param productCijfer grade for the product evaluation
     * @param procesCijfer grade for the process evaluation
     * @param methodenEnTechniekenCijfer grade for the technical evaluation
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    public Project(Double productCijfer, Double procesCijfer, Double methodenEnTechniekenCijfer, String naam, int ects, int studiejaar)
    {
        super(naam, ects, studiejaar);
        this.productCijfer = productCijfer;
        cijfers[INDEX_PRODUCT] = productCijfer;
        this.procesCijfer = procesCijfer;
        cijfers[INDEX_PROCES] = procesCijfer;
        this.methodenEnTechniekenCijfer = methodenEnTechniekenCijfer;
        cijfers[INDEX_METHODEN] = methodenEnTechniekenCijfer;
    }

    /**
     * Overload constructor for this class
     * sets all grades to the default values
     * @param naam the name of this course
     * @param ects the number of ECTS this course is worth
     * @param studiejaar the year this course is attended in.
     */
    public Project(String naam, int ects, int studiejaar)
    {
        this(STD_CIJFER, STD_CIJFER, STD_CIJFER, naam, ects, studiejaar);
    }

    /**
     * @return whether user passed this project
     */
    public boolean isAfgerond()
    {
        for (Double cijfer : cijfers)
        {
            if (cijfer < ONDERGRENS_VOLDOENDE)
            {
                return false;
            }
        }
        return true;
    }

    /**
     *  Returns a string representation of this class.
     */
    public String toString()
    {
        StringBuilder result = new StringBuilder();
        String spacing = ", ";
        result.append(naam).append(spacing);
        result.append(ects).append(' ').append("ects").append(spacing);
        result.append("studiejaar ").append(studiejaar);
        result.append(" (");
        result.append(productCijfer).append(spacing);
        result.append(procesCijfer).append(spacing);
        result.append(methodenEnTechniekenCijfer);
        result.append(')');
        return result.toString();
    }

    /**
     * @param productCijfer the grade for the product evaluation
     */
    public void setProductCijfer(double productCijfer) {
        cijfers[INDEX_PRODUCT] = productCijfer;
        this.productCijfer = productCijfer;
    }

    /**
     * @param procesCijfer the grade for the process evaluation
     */
    public void setProcesCijfer(double procesCijfer) {
        cijfers[INDEX_PROCES] = procesCijfer;
        this.procesCijfer = procesCijfer;
    }

    /**
     * @param methodenEnTechniekenCijfer the grade for the technical evaluation
     */
    public void setMethodenEnTechniekenCijfer(double methodenEnTechniekenCijfer) {
        cijfers[INDEX_METHODEN] = methodenEnTechniekenCijfer;
        this.methodenEnTechniekenCijfer = methodenEnTechniekenCijfer;
    }
}
