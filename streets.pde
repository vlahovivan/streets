StreetGenerator sg;

void setup() {
    size(600, 600);
    background(0);

    randomSeed(5);

    // frameRate(10);

    stroke(255);

    // pushStyle();
    // strokeWeight(7);
    // noFill();
    // rect(width/2-75, height/2-100, 150, 200);
    // popStyle();

    ArrayList<DAW> daws = new ArrayList<DAW>();
    
    StandardWalker sw1 = new StandardWalker(30.0, PI/4.0, 0.4);
    StandardDivider sd1 = new StandardDivider(0.57, PI/4.0, daws);

    for(int i=0; i<2; i++) {
        float x, y, dir;
        x = i*width;
        y = height/2.0;
        // y = 3.0*height/4.0;

        // dir = (random(1.0) < 0.5) ? 0.0 : HALF_PI;
        // dir = random(TWO_PI);
        dir = i*PI;

        int level = 5;
        
        // daws.add(new DAW(new MyVector(x, y), dir, level, sw1, sd1));
        // daws.add(new DAW(new MyVector(x, y), dir - PI, level, sw1, sd1));
    }

    StandardWalker sw2 = new StandardWalker(8.0, PI/16.0, 0.6);
    StandardDivider sd2 = new StandardDivider(0.65, PI/2.0, daws);

    for(int i=0; i<10; i++) daws.add(new DAW(new MyVector(width/2, height/2), random(TWO_PI), 5, sw2, sd2));

    sg = new StreetGenerator(daws);
}

void draw() {
    sg.step();

    if(sg.size() == 0) {
        saveFrame("images/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".png");
        noLoop();
        // exit();
    }
}
