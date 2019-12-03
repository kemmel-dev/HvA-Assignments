package com.company;

import java.time.LocalDate;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

    }

    String askForNewString(String type)
    {
        Scanner scanner = new Scanner(System.in);
        StringBuilder result = new StringBuilder();
        try {
            if (type == "int")
            {
                System.out.print("Vul alsjeblieft een geheel getal in: ");
                scanner.next();
            }
            else if (type == "string")
            {
                System.out.print("Vul alsjeblieft alleen letters en getallen in: ");
                scanner.next();
            }
            System.out.print("Geef een naam voor de klas: ");
            String name = scanner.nextLine();
        } catch (Exception e)
        {
            if (type == "int")
            {
                System.out.print("Vul alsjeblieft een geheel getal in: ");
                scanner.next();
            }
            else if (type == "string")
            {
                System.out.print("Vul alsjeblieft alleen letters en getallen in: ");
                scanner.next();
            }
        }
    }
}
