public class Card
{
    private int2 pos;
    private String id;
    private PImage icon;
    private boolean chosen;
    private ArrayList<PVector> shape;
    private ArrayList<PVector> currentShape;

    public boolean Frozen;
    public boolean Revealed;

    public Card( int2 pos, PImage icon ) {
        this.pos = new int2( pos.X * 100 + 50, pos.Y * 150 + 25 + 75 );
        this.id = GenerateID();
        this.icon = icon;
        this.chosen = false;
        this.Revealed = false;
        this.Frozen = false;
        this.shape = new ArrayList<PVector>();
        this.currentShape = new ArrayList<PVector>(40);
        for( int i = 0; i < 40; i++ ) this.currentShape.add( new PVector() );

        for (int x = this.pos.X - 50; x < this.pos.X + 100; x += 10) shape.add(new PVector( x, -150 ));
        for (int y = this.pos.Y - 75; y < this.pos.Y + 150; y += 10) shape.add(new PVector( 100, y  ));
        for (int x = this.pos.X + 50; x > this.pos.X - 100; x -= 10) shape.add(new PVector( x, 150  ));
        for (int y = this.pos.Y + 75; y > this.pos.Y - 150; y -= 10) shape.add(new PVector( -100, y ));
    }

    public String GetId(){ return id; }
    public boolean IsChosen(){ return this.chosen; }
    public void SetChosen( boolean isChosen ){ chosen = isChosen; }
    private String GenerateID()
    {
        String ID = "";
        for (int i = 0; i < 10; i++) ID += random(0, 255);
        return ID;
    }

    public void Update()
    {
        for( int i = 0; i < shape.size(); i++ ) {
            currentShape.get(i).lerp(shape.get(i), 0.1);
        }

        if( !Revealed && !Frozen )
        {
            if( mousePressed && mouseX >= pos.X && mouseX <= pos.X + 100 && mouseY >= pos.Y && mouseY <= pos.Y + 150 ) {
                this.chosen = true;
                fill(185);
            } else if( mouseX >= pos.X && mouseX <= pos.X + 100 && mouseY >= pos.Y && mouseY <= pos.Y + 150 )
            {
                if( this.chosen ) fill( 125 );
                else fill(205);
            } else {
                if( this.chosen ) fill( 185 );
                else fill(255);
            }
        }
        else if( Revealed ) { fill( 185 ); }
        else if( Frozen ){ fill(255); }

        beginShape();
        for (PVector vertex : currentShape) {
            vertex(vertex.x, vertex.y);
        }
        endShape(CLOSE);

        //rect(pos.X, pos.Y, 100, 150);
        if( this.chosen || this.Revealed ) image(icon, pos.X + 35, pos.Y + 55);
    }
}
