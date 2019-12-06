package com.company;

public class Klas {

    private String naam;
    private int aantalStudenten;
    private Student[] studenten;

    public static final int MAX_AANTAL_STUDENTEN = 30;

    Klas(String _naam)
    {
        naam = _naam;
        aantalStudenten = 0;
        studenten = new Student[MAX_AANTAL_STUDENTEN];
    }

    protected int getAantalStudenten()
    {
        return aantalStudenten;
    }

    public String toString()
    {
        StringBuilder result = new StringBuilder("Klas: ");
        result.append(naam);
        result.append(" (");
        result.append(aantalStudenten);
        result.append(" studenten)\n");
        for (int i = 0; i < aantalStudenten; i++)
        {
            result.append(studenten[i].toString());
            if (i != aantalStudenten - 1)
            {
                result.append("\n");
            }
        }
        return result.toString();
    }

    public Boolean voegStudentToe(Student student)
    {
        if (aantalStudenten == MAX_AANTAL_STUDENTEN)
        {
            return false;
        }
        studenten[aantalStudenten] = student;
        aantalStudenten += 1;
        return true;
    }
}