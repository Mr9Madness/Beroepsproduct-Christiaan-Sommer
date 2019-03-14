// Dit is een kleine "struct" voor het opslaan van twee ints op een x en y wijze
// Dit doe ik alleen omdat ik een array van ints of twee int properties niet mooi vind.
private class int2
{
    public int X;
    public int Y;
    public int2 (int x, int y) {
        this.X = x;
        this.Y = y;
    }
    public int2 Multiply( int times )
    {
        this.X *= times;
        this.Y *= times;
        return this;
    }
}
