// A hit is created when a bullet hits an invader.
// The hit stores the positions of that invader in invaderGrid
class Hit
{
    // This boolean stores whether this hit is real or not
    boolean hit;
    int i;
    int j;

    Hit (boolean _hit, int _i, int _j)
    {
        // Hit is set to true when the bullet actually hit something.
        hit = _hit;
        i = _i;
        j = _j;
    }
}