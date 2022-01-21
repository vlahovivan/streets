public class StandardDivider implements Divider {
    private float divisionProbability;
    private float divisionAngle;

    private ArrayList<DAW> daws;

    private boolean addRandomAngle;

    public StandardDivider(float divisionProbability, float divisionAngle, ArrayList<DAW> daws) {
        this.divisionProbability = divisionProbability;
        this.divisionAngle = divisionAngle;
        this.daws = daws;

        this.addRandomAngle = false;
    }

    public void setAddRandomAngle(boolean b) {
        this.addRandomAngle = b;
    }

    public void divide(DAW daw) {
        float newProbability = (daw.level - 1) * divisionProbability;

        if(daw.getLevel() > 1 && random(1.0) < newProbability) {
            DAW newDAW = daw.copy();

            float newDirection = newDAW.getDirection() + (addRandomAngle ? randomGaussian()*PI/144.0 : 0);

            if(random(1.0) < 0.5) newDirection += divisionAngle;
            else newDirection -= divisionAngle;

            newDAW.setDirection(newDirection);
            newDAW.setLevel(newDAW.getLevel() - 1);

            daws.add(newDAW);
        }
    }
}