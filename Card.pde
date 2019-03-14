public class Card
{
    private int2 pos;
    private String id;
    private PImage icon;
    private boolean chosen;

    public Card( int2 pos, PImage icon ) {
        this.pos = new int2( pos.X * 100, pos.Y * 150 );
        this.id = GenerateID();
        this.icon = icon;
        this.chosen = false;
    }

    public String GetId(){ return id; }
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
        fill(125);
        rect(pos.X, pos.Y, 100, 150);
        image(icon, pos.X + 35, pos.Y + 55);
    }
}
