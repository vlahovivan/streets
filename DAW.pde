public class DAW {
    private MyVector position;
    private float direction;
    private ArrayList<MyVector> aggregate;

    private int level;

    private boolean alive;
    
    public Walker walker;
    public Divider divider;

    public DAW(MyVector position, float direction, int level, Walker walker, Divider divider) {
        this.position = position;
        this.direction = direction;
        this.aggregate = new ArrayList<MyVector>();
        
        this.level = level;

        this.alive = true;

        this.walker = walker;
        this.divider = divider;

    }

    public boolean isAlive() {
        return this.alive;
    }

    public void setAlive(boolean newAlive) {
        this.alive = newAlive;
    }

    public MyVector getPosition() {
        return this.position;
    }

    public void setPosition(MyVector newPos) {
        this.position = newPos;
    }

    public float getDirection() {
        return this.direction;
    }

    public void setDirection(float newDir) {
        this.direction = newDir;
    }

    public int getLevel() {
        return this.level;
    }

    public void setLevel(int newLevel) {
        this.level = newLevel;
    }

    public int getAggregateLength() {
        return this.aggregate.size();
    }

    public void step() {
        aggregate.add((MyVector)position.copy());
        
        walker.walk(this);
        divider.divide(this);

        if(aggregate.size() > 0) {
            pushStyle();

            strokeWeight(level);

            MyVector p1 = aggregate.get(aggregate.size() - 1);
            float x1 = p1.x;
            float y1 = p1.y;
            float x2 = position.x;
            float y2 = position.y;
            line(x1, y1, x2, y2);

            popStyle();
        }


        if(position.x < 0 || position.x > width || position.y < 0 || position.y > height) {
            this.alive = false;
        }
    }

    public DAW copy() {
        return new DAW(this.position, this.direction, this.level, this.walker, this.divider);
    }

}