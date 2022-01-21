public class MyVector implements Comparable<MyVector> {
    public float x;
    public float y;

    public MyVector(float x, float y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null) return false;

        if (getClass() != o.getClass()) return false;

        MyVector v = (MyVector) o;

        return this.compareTo(v) == 0; 
    }

    @Override
    public int compareTo(MyVector v) {
        MyVector s1 = this;
        MyVector s2 = v;

        if(abs(s1.x-s2.x) < 1e-3 && abs(s1.y-s2.y) < 1e-3) return 0;

        return ((((s1.x == s2.x) ? (s1.y - s2.y) : (s1.x - s2.x)) < 0) ? -1 : 1);
    }

    public MyVector copy() {
        return new MyVector(this.x, this.y);
    }

    public MyVector add(MyVector v) {
        this.x += v.x;
        this.y += v.y;

        return this;
    }

    public MyVector mult(float s) {
        this.x *= s;
        this.y *= s;

        return this;
    }
}