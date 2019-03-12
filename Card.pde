public class Card
{
    private PVector pos;
    private String id;
    private PImage icon;
    private boolean chosen;

    public Card (PVector pos, PImage icon) {
        this.pos = pos;
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
}
