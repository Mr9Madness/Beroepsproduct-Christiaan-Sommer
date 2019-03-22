public class Sliderbar
{
    private int2 barPos;
    private int2 barWidth;
    private int min;
    private int max;
    private int value;

    private int sliderX;

    public Sliderbar( int2 pos, int2 width, int min, int max )
    {
        this.barPos = pos;
        this.barWidth = width;
        this.min = min;
        this.max = max;
        this.sliderX = pos.X;
    }
    public void Update()
    {
        if( isOver() && mousePressed ){
            sliderX = mouseX - (barWidth.Y / 2);
            value = max * ((mouseX - barPos.X) * 100 / barWidth.X ) / 100;
        }

        noStroke();
        fill(204);

        rect(barPos.X, barPos.Y, barWidth.X, barWidth.Y);

        if (isOver() ) fill(0, 0, 0);
        else fill(102, 102, 102);

        rect(sliderX, barPos.Y, barWidth.Y, barWidth.Y);
        fill( 255 );
        text( GetValue(), sliderX, barPos.Y );
        stroke(0);
    }

    private boolean isOver() {
        if (mouseX >= barPos.X && mouseX <= barPos.X + barWidth.X && mouseY >= barPos.Y && mouseY <= barPos.Y + barWidth.Y)
            return true;
        else
            return false;
    }

    public int GetValue()
    {
        return constrain( value, min, max); // TODO: make it so it doesn't need to be clamped
    }
}
