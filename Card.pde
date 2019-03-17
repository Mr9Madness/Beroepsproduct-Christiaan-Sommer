public class Card
{
    private int2 pos;
    private String id;
    private PImage icon;
    private boolean chosen;

    public boolean Frozen;
    public boolean Revealed;

    public Card( int2 pos, PImage icon ) {
        this.pos = new int2( pos.X * 100, pos.Y * 150 + 25 );
        this.id = GenerateID();
        this.icon = icon;
        this.chosen = false;
        this.Revealed = false;
        this.Frozen = false;
    }

    public String GetId(){ return id; }
    public boolean IsChosen(){ return this.chosen; }
    public void SetChosen( boolean isChosen ){ chosen = isChosen; }
    private String GenerateID()
    {
        String ID = "";
        for (int i = 0; i < 10; ++i) {
            ID += random(0, 255);
        }
        return ID;
    }

    public void Update()
    {
        if( !Revealed && !Frozen )
        {
            if( mousePressed && mouseX >= pos.X && mouseX <= pos.X + 100 && mouseY >= pos.Y && mouseY <= pos.Y + 150 ) {

                // TODO This gets called every frame to it jump between true and false
                // TODO Find a way to have a mouse released event variable thats only true for one frame
                if( this.chosen ) this.chosen = false;
                else this.chosen = true;
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
        rect(pos.X, pos.Y, 100, 150);
        if( this.chosen || this.Revealed ) image(icon, pos.X + 35, pos.Y + 55);
    }
}
