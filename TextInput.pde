public class TextInput
{
    private int2 inputPos;
    private int2 inputWidth;
    private String text;
    private boolean coolDown;

    public TextInput (int2 inputPos, int2 inputWidth, String text) {
        this.inputPos = inputPos;
        this.inputWidth = inputWidth;
        this.text = text;
        this.coolDown = false;
    }

    public void Update()
    {
        fill( 200 );
        rect( inputPos.X, inputPos.Y, inputWidth.X, inputWidth.Y );
        fill( 255 );
        text( text, inputPos.X + 5, inputPos.Y + inputWidth.Y / 2 );

        if (keyPressed && isOver())
        {
            if( coolDown && key != CODED ){
                text += key;
                coolDown = false;
            }

            if (keyCode == BACKSPACE)
                if (text.length() > 0) text = text.substring(0, text.length() - 1);
            else if (keyCode == DELETE)
                text = "";
        }
        if( millis() % 202 > 200 ) coolDown = true;
    }
    private boolean isOver() {
        if (mouseX >= inputPos.X && mouseX <= inputPos.X + inputWidth.X && mouseY >= inputPos.Y && mouseY <= inputPos.Y + inputWidth.Y)
            return true;
        else
            return false;
    }
    public String GetValue(){ return text; }
}
