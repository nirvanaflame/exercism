import java.util.HashSet;
import java.util.Set;

class Triangle {

    double x;
    double y;
    double z;

    int sideSize;

    Triangle(double x, double y, double z) throws TriangleException {
        this.x = x;
        this.y = y;
        this.z = z;
        validate();
        Set<Double> set = new HashSet<>() {{ add(x); add(y); add(z); }};
        sideSize = set.size();
    }

    boolean isEquilateral() {
        return sideSize == 1;
    }

    boolean isIsosceles() {
        return sideSize <= 2;
    }

    boolean isScalene() {
        return sideSize == 3;
    }

    void validate() throws TriangleException {
        if (!(x * y * z != 0.0
                && x + y > z
                && x + z > y
                && y + z > x
        )) throw new TriangleException();
    }
}
