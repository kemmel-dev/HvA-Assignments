package models;

public abstract class Product {
    /**
     * Symbool voor Euro-teken
     */
    public static final String EURO = "\u20AC";

    protected String naam;
    protected double prijs;

    public Product(String naam, double prijs)
    {
        this.naam = naam;
        this.prijs = prijs;
    }

    public abstract boolean isLegaal();

    @Override
    public String toString() {
        StringBuilder buffer = new StringBuilder("Naam: ");
        buffer.append(naam).append("\n\tPrijs: ");
        buffer.append(EURO).append(String.format("%.2f", prijs));
        return buffer.toString();
    }
}
