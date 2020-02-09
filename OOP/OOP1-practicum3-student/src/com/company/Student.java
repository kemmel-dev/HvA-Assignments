package com.company;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

public class Student {
    int studentNr;
    String voornaam;
    String achternaam;
    LocalDate geboorteDatum;
    Adres adres;

    public Student(int _studentNr, String _voornaam, String _achternaam, LocalDate _geboorteDatum, Adres _adres)
    {
        studentNr = _studentNr;
        voornaam = _voornaam;
        achternaam = _achternaam;
        geboorteDatum = _geboorteDatum;
        adres = _adres;
    }

    public String toString()
    {
        StringBuilder result = new StringBuilder("");
        result.append(studentNr).append(' ').append(voornaam).append(' ').append(achternaam);
        result.append(" (").append(korteGeboorteDatum()).append(")\n");
        result.append("Adres: ").append(adres.toString());
        return result.toString();
    }

    private String korteGeboorteDatum()
    {
        return geboorteDatum.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT));
    }
}