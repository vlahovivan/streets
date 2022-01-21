public class StreetGenerator {
    private ArrayList<DAW> daws;

    public StreetGenerator(ArrayList<DAW> daws) {
        this.daws = daws;
    }

    public void step() {
        ArrayList<DAW> dawsCpy = (ArrayList<DAW>)this.daws.clone();

        println(dawsCpy.size());
        for(DAW daw : dawsCpy) {
            if(daw.isAlive()) daw.step();
        }

        for(DAW daw : dawsCpy) {
            if(!daw.isAlive()) daws.remove(daw);
        }

    } 

    public int size() {
        return daws.size();
    }
}