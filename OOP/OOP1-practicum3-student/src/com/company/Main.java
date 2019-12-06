package com.company;

import java.time.LocalDate;
import java.util.Scanner;

/**
 * Asks a user to input the data for all the students in a school's class
 * then prints the class.
 * @author Kamiel de Visser | 500838438
 */
public class Main {

    /**
     * Executes the program
     * @param args list of parameters this program is called with
     */
    public static void main(String[] args) {

        // Ask for the name of this school class
        System.out.print("Vul de naam van je klas in: ");
        String klasnaam = askForString();
        Klas klas = new Klas(klasnaam);

        System.out.print("Hoeveel studenten zitten er in je klas? ");
        int aantalStudenten = askForInt();

        // For all students in a class
        for (int i = 0; i < aantalStudenten; i++)
        {
            // Ask for this student's general details
            System.out.print("Vul het studentnummer van de volgende student in: ");
            int studentNr = askForInt();
            System.out.print("Vul de voornaam van de volgende student in: ");
            String voornaam = askForString();
            System.out.print("Vul de achternaam van deze student in: ");
            String achternaam = askForString();

            // Ask for this student's birthday details
            System.out.print("Vul de geboortedag van deze student in: ");
            int dag = askForInt();
            System.out.print("Vul de geboortemaand van deze student in: ");
            int maand = askForInt();
            System.out.print("Vul het geboortejaar van deze student in: ");
            int jaar = askForInt();
            // Create the birthday
            LocalDate datum = LocalDate.of(jaar, maand, dag);

            // Ask for this student's address
            System.out.print("Vul de straat van deze student in: ");
            String straat = askForString();
            System.out.print("Vul het huisnummer van deze student in: ");
            int huisNr = askForInt();
            System.out.print("Vul de postcode van deze student in: ");
            String postcode = askForString();
            // Ensure postcode is a valid postcode
            while (!Adres.checkPostcode(postcode))
            {
                System.out.print("Deze postcode klopt niet.\n");
                System.out.print("Vul de postcode van deze student in: ");
                postcode = askForString();
            }
            System.out.print("Vul de woonplaats van deze student in: ");
            String plaats = askForString();
            // Create the address
            Adres adres = new Adres(straat, huisNr, postcode, plaats);

            // Create the student
            Student student = new Student(studentNr, voornaam, achternaam, datum, adres);
            // Add student to the class
            klas.voegStudentToe(student);
        }

        // Print the class
        System.out.print(String.format("\n\nklas.toString() OUTPUT follows after one blank line:\n\n%s", klas.toString()));
    }

    /**
     * Ask for integer input
     * @return  the integer user has inputted
     *          -1 if failed
     */
    static private int askForInt()
    {
        Scanner scanner = new Scanner(System.in);
        boolean correct = false;
        while (!correct)
        {
            try {
                int input = scanner.nextInt();
                correct = true;
                return input;
            } catch (Exception e)
            {
                System.out.print("Enkel cijfers zijn toegestaan in de invoer.\nVoer opnieuw in: ");
                scanner.next();
            }
        }
        return -1;
    }

    /**
     * Ask for String input
     * @return  the string user has inputted
     *          (is empty if input was incorrect)
     */
    static private String askForString()
    {
        Scanner scanner = new Scanner(System.in);
        StringBuilder stringBuilder = new StringBuilder();
        try {
            stringBuilder.append(scanner.nextLine());
            return stringBuilder.toString();
        } catch (Exception e)
        {
            System.out.print("Enkel getallen en cijfers zijn toegestaan in de invoer.\nVoer opnieuw in: ");
            scanner.next();
        }
        return "";
    }


}