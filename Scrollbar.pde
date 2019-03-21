public class Scrollbar {
    private int2 pos;
    private int2 width;
    private int min;
    private int max;

    public Scrollbar (int2 pos, int2 width, int min, int max) {
        this.pos = pos;
        this.width = width;
        this.min = min;
        this.max = max;
    }

    public void Update()
    {

    }

    public boolean IsMouseOver()
    {
        if( mouseX >= pos.X && mouseX <= pos.X + width.X &&
            mouseY >= pos.Y && mouseY <= pos.Y + width.Y )
            return true;
        else
            return false;
    }
}
