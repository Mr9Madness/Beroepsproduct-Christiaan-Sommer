public class Sliderbar
{
    private int2 pos;
    private int2 width;
    private int min;
    private int max;
    private int value;

    private int sliderX;

    public Sliderbar( int2 pos, int2 width, int min, int max )
    {
        this.pos = pos;
        this.width = width;
        this.min = min;
        this.max = max;
        this.sliderX = pos.X;
    }
    public void Update()
    {
        if( isOver() && mousePressed ){
            sliderX = mouseX - (width.Y / 2); // TODO: het aantal max is de width
            //value = max * (max * 100 / (mouseX - pos.X) ) / 100;
            value = mouseX - pos.X;
        }

        noStroke();
        fill(204);

        rect(pos.X, pos.Y, width.X, width.Y);

        if (isOver() ) fill(0, 0, 0);
        else fill(102, 102, 102);

        rect(sliderX, pos.Y, width.Y, width.Y);
        fill( 255 );
        text( value, sliderX, pos.Y );
    }

    private boolean isOver() {
        if (mouseX >= pos.X && mouseX <= pos.X + width.X && mouseY >= pos.Y && mouseY <= pos.Y + width.Y)
            return true;
        else
            return false;
    }

    public int GetValue()
    {
        return value / 10; // TODO: change this pls
    }
}
