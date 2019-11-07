// class Snow implements Particle
// {
//     PVector pos;
//     String type;

//     int drawingSize = 5;

//     Snow(PVector _pos, String _type)
//     {
//         pos = _pos;
//         type = _type;
//     }

//     void move()
//     {
//         pos.y = constrain(pos.y + 1, 0, ui.distFromTop);
//     }

//     PVector getPos()
//     {
//         return pos;
//     }

//     int getR()
//     {
//         return r;
//     }

//     void display()
//     {
//         fill(255);
//         circle(pos.x, pos.y, drawingSize);
//     }
// }