package com.company;

/**
 * Holds the information about an address
 * @Author Kamiel de Visser
 */
public class Adres {
    private String straat;
    private int huisNr;
    private String postcode;
    private String plaats;

    /**
     * Instantiates a new Adres object.
     * @param _straat street address
     * @param _huisNr unit number
     * @param _postcode zip code
     * @param _plaats city
     */
    public Adres(String _straat, int _huisNr, String _postcode, String _plaats)
    {
        straat = _straat;
        huisNr = _huisNr;
        postcode = _postcode;
        plaats = _plaats;
    }

    public String toString()
    {
        StringBuilder result = new StringBuilder();
        result.append(straat).append(' ').append(huisNr).append(", ");
        result.append(postcode).append(' ').append(plaats);
        return result.toString();
    }

    /**
     * Checks whether the a post code is a valid (Dutch) postcode.
     * @param postcode string that contains the postcode to check.
     * @return true or false
     */
    public static Boolean checkPostcode(String postcode)
    {
        int length = postcode.length();
        // First check whether string is of correct length
        if (length == 6) {

            // Then for each character...
            for (int i = 0; i < length; i++) {
                char c = postcode.charAt(i);
                // If the character must represent a number
                if (i < 4)
                {
                    if (Character.isDigit(c)) {
                        // Special case: First character
                        if (i == 0)
                        {
                            int num = Character.getNumericValue(c);
                            if (num == 0) {
                                // Returns false if first character is a zero.
                                return false;
                            }
                        }
                        // Character must be valid
                    }
                }
                // Character should be alphabetic
                else {
                    if (!Character.isAlphabetic(c)) {
                        // If it's not, returns false.
                        return false;
                    }
                }
            }
            // Returns true if all checks have passed
            return true;
        }
        return false;
    }

    /**
     * Returns true if an integer num is between (inclusive)
     * min and max, Returns false otherwise
     * @param num number to check
     * @param min minimum bound
     * @param max maximum bound
     * @return (num >= min && num <= max)
     */
    private static Boolean isNumBetween(int num, int min , int max)
    {
        if (num >= min && num <= max)
        {
            return true;
        }
        return false;
    }
}