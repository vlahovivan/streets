StreetGenerator sg;

void setup() {
    size(600, 600);
    background(0);

    frameRate(60);

    stroke(255);

    ArrayList<DAW> daws = new ArrayList<DAW>();
    
    StandardWalker sw1 = new StandardWalker(10.0, PI/4.0, 0.125);
    StandardDivider sd1 = new StandardDivider(0.125, PI/4.0, daws);

    float x, y, dir;
    x = width/2.0;
    y = 3.0*height/4.0;

    dir = (random(1.0) < 0.5) ? 0.0 : HALF_PI;

    int level = 5;
    daws.add(new DAW(new MyVector(x, y), dir, level, sw1, sd1));
    daws.add(new DAW(new MyVector(x, y), dir - PI, level, sw1, sd1));
    

    StandardWalker sw2 = new StandardWalker(10.0, PI/16.0, 0.45);
    StandardDivider sd2 = new StandardDivider(0.35, PI/4.0, daws);
    sd2.setAddRandomAngle(true);

    x = width/2.0;
    y = 1*height/4.0;
    dir = random(TWO_PI);     

    daws.add(new DAW(new MyVector(x, y), dir, level, sw2, sd2));
    daws.add(new DAW(new MyVector(x, y), dir - PI, level, sw2, sd2));

    sg = new StreetGenerator(daws);

}

void draw() {
    sg.step();

    if(sg.size() == 0) {
        saveFrame("images/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".png");
        noLoop();
        exit();
    }
}
