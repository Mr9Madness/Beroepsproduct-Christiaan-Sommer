public class Player
{
    public boolean CurrentTurn;
    public int Score;
    public String Name;
    
    Player( String name )
    {
        this.Name = name;
        CurrentTurn = false;
        Score = 0;
    }
}
