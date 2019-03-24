public class TextInput
{
    private int2 inputPos;
    private int2 inputWidth;
    private String text;
    private boolean coolDown;
    private boolean active;
    private int coolDownCount;
    private int coolDownLength;

    public TextInput (int2 inputPos, int2 inputWidth, String text) {
        this.inputPos = inputPos;
        this.inputWidth = inputWidth;
        this.text = text;
        this.coolDown = false;
        this.coolDownCount = 0;
        this.coolDownLength = 45;
    }

    public void Update()
    {
        if( isOver() ) fill( 225 );
        else if( active ) fill( 200 );
        else fill( 255 );
        rect( inputPos.X, inputPos.Y, inputWidth.X, inputWidth.Y );
        
        fill( 0 );
        text( text, inputPos.X + 5, inputPos.Y + inputWidth.Y / 2 + 5 );

        if( mousePressed && isOver() )
            active = true;
        else if( mousePressed && !isOver() )
            active = false;

        if( active && ( text.length() == 0 || text.charAt(text.length() - 1) != '|' ))
            text += "|";
        else if( !active && text.length() > 0 && text.charAt(text.length() - 1) == '|')
            text = text.substring(0, text.length() - 1);

        if( coolDownCount > coolDownLength ) {
            coolDown = true;
            coolDownCount = 0;
        }
        else coolDownCount++;


        if( keyPressed && active && coolDown )
        {
            if( key != CODED && key != BACKSPACE && key != '|' )
                text = text.substring(0, text.length() - 1) + key + "|";
            else if( key == BACKSPACE )
                if (text.length() > 1) text = text.substring(0, text.length() - 2) + "|";

            coolDown = false;
        }
    }
    private boolean isOver() {
        if (mouseX >= inputPos.X && mouseX <= inputPos.X + inputWidth.X && mouseY >= inputPos.Y && mouseY <= inputPos.Y + inputWidth.Y)
            return true;
        else
            return false;
    }
    public String GetValue(){ return text; }
}
