package driver;
import models.*;
import java.util.ArrayList;

public class HappyNewYearDriver {

    public static void main(String[] args) {

        String studentNaam = "Kamiel";
        int studentNummer = 500838438;
        String studentKlas = "IS107";
        System.out.printf("Happy new year from: %s, %d, %s\n", studentNaam, studentNummer, studentKlas);

        ArrayList<Vuurwerk> pakket = new ArrayList<Vuurwerk>();
        stap1(pakket);

        /* TODO stap 2: haal commentaar weg
        stap2(pakket);
        einde TODO stap 2 */

        /* TODO stap 3: haal commentaar weg
        stap3(pakket);
        einde TODO stap 3 */

        /* TODO stap 4: haal commentaar weg
        stap4(pakket);
        einde TODO stap 4 */

        /* TODO stap 5: haal commentaar weg
        stap5(pakket);
        einde TODO stap 5 */

        /* TODO stap 6: haal commentaar weg
        stap6(pakket);
        einde TODO stap61 */
    }

    private static void stap1(ArrayList<Vuurwerk> pakket) {
        System.out.println("\n--- STAP 1 ---");

        Vuurwerk vuurwerk;

        // vuurwerk met Nederlandstalige instructie
        vuurwerk = new Vuurwerk("Veiligheidsbril", 2.5,
                new Instructie(true, 6, "Draag bij aansteken"));
        pakket.add(vuurwerk);
        System.out.println(vuurwerk);

        // vuurwerk met Engelstalige instructie
        vuurwerk = new Vuurwerk("Safety glass", 2.5,
                new Instructie(false, 6, "Wear before ignition"));
        pakket.add(vuurwerk);
        System.out.println(vuurwerk);

        // vuurwerk zonder instructie
        vuurwerk = new Vuurwerk("Aansteeklont zonder instructie", 0.25);
        pakket.add(vuurwerk);
        System.out.println(vuurwerk);
    }

    /* TODO stap 2: haal commentaar weg
    private static void stap2(ArrayList<Vuurwerk> pakket) {
        System.out.println("\n--- STAP 2 ---");

        Knaller knaller;

        // knaller met Engelstalige instructie en 75 decibel
        knaller = new Knaller("Celebration Crackers", 10, 777, 75,
                new Instructie(false, 21, "Keep minimum 10 ft distance"));
        pakket.add(knaller);
        System.out.println(knaller);

        // knaller met Nederlandstalige instructie en 120 decibel
        knaller = new Knaller("Peking Rol", 45, 500, 120,
                new Instructie(true, 21, "Houd minimaal 5 meter afstand"));
        pakket.add(knaller);
        System.out.println(knaller);

        // knaller met Nederlandstalige instructie en 125 decibel
        knaller = new Knaller("Shanghai Rol", 85, 1000, 125,
                new Instructie(true, 21, "Houd minimaal 5 meter afstand"));
        pakket.add(knaller);
        System.out.println(knaller);

        // knaller zonder instructie en 100 decibel
        knaller = new Knaller("Hongkong Rol", 82.5, 1000, 100, null);
        pakket.add(knaller);
        System.out.println(knaller);
    }
    einde TODO stap 2 */

    /* TODO stap 3: haal commentaar weg
    private static void stap3(ArrayList<Vuurwerk> pakket) {
        System.out.println("\n--- STAP 3 ---");

        Vuurpijl vuurpijl;

        // vuurpijl met Nederlandstalige instructie, correcte kleurverhouding, leeftijd 10
        vuurpijl = new Vuurpijl("Cruise Rocket", 2.50, 40, new int[]{50, 25, 25},
                new Instructie(true, 10, "Niet in de hand houden"));
        pakket.add(vuurpijl);
        System.out.println(vuurpijl);

        // vuurpijl met Nederlandstalige instructie, incorrecte kleurverhouding, leeftijd 16
        vuurpijl = new Vuurpijl("Killing Arrow", 4.25, 40, new int[]{25, 30, 44},
                new Instructie(true, 16, "Niet in de hand houden"));
        pakket.add(vuurpijl);
        System.out.println(vuurpijl);

        // vuurpijl met Engelstalige instructie, incorrecte kleurverhouding, leeftijd 20
        vuurpijl = new Vuurpijl("Magic Sky", 2.75, 40, new int[]{50, 41, 10},
                new Instructie(false, 20, "Keep minimum 10 ft distance"));
        pakket.add(vuurpijl);
        System.out.println(vuurpijl);

        // vuurpijl zonder instructie, correcte kleurverhouding
        vuurpijl = new Vuurpijl("Golden Sky", 3.25, 40, new int[]{50, 50, 0}, null);
        pakket.add(vuurpijl);
        System.out.println(vuurpijl);
    }
    einde TODO stap 3 */

    /* TODO stap 4: haal commentaar weg
    public static void stap4(ArrayList<Vuurwerk> pakket) {
        System.out.println("\n--- STAP 4 ---");
        toonVuurwerk(pakket);
    }
    einde TODO stap 4 */

    /* TODO stap 5: haal commentaar weg
    public static void stap5(ArrayList<Vuurwerk> pakket) {
        System.out.println("\n--- STAP 5 ---");
        toonInstructies(pakket, -1);
        toonInstructies(pakket, 3);
        toonInstructies(pakket, 10);
        toonInstructies(pakket, 11);
    }
    einde TODO stap 5 */

    /* TODO stap 6: haal commentaar weg
    public static void stap6(ArrayList<Vuurwerk> pakket) {
        System.out.println("\n--- STAP 6 ---");
        printHardeKnallers(pakket, 100);
    }
    einde TODO stap 6 */
}