public class StandardWalker implements Walker {
    private float stepSize;
    private float turnAngle;
    private float turnProbability;

    private boolean addRandomAngle;

    public StandardWalker(float stepSize, float turnAngle, float turnProbability) {
        this.stepSize = stepSize;
        this.turnAngle = turnAngle;
        this.turnProbability = turnProbability;

        this.addRandomAngle = false;
    }

    public void setAddRandomAngle(boolean b) {
        this.addRandomAngle = b;
    }

    public void walk(DAW daw) {
        MyVector newPos = daw.getPosition().copy();

        int checkSteps = 10;

        float walkAngle = daw.getDirection() + (addRandomAngle ? randomGaussian()*PI/144.0 : 0);

        MyVector dirVector = fromAngle(daw.getDirection()).mult(stepSize / (float)checkSteps);

        loadPixels();
        int mul = 3;
        for(; mul<checkSteps; mul++) {
            MyVector tmpVec = dirVector.copy().mult(mul).add(newPos);

            int x = (int)tmpVec.x;
            int y = (int)tmpVec.y;

            int pos = y*width+x;

            if(pos < 0 || pos >= width*height || red(pixels[y*width+x]) > 80) {
                newPos = tmpVec;
                daw.setAlive(false);
            } 
        }

        if(daw.isAlive()) newPos.add(dirVector.mult(checkSteps));

        daw.setPosition(newPos);

        if(random(1.0) < turnProbability) {
            float clockwiseOrNot = 1.0;
            if(random(1.0) < 0.5) clockwiseOrNot = -1.0;

            daw.setDirection(daw.getDirection() + clockwiseOrNot * turnAngle);
        }
    }

    private MyVector fromAngle(float angle) {
        PVector p = PVector.fromAngle(angle);
        return new MyVector(p.x, p.y);
    }

}