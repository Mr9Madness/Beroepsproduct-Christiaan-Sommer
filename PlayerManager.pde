class PlayerManager
{
    public Player PlayerOne;
    public Player PlayerTwo;
    
    public int Turn;

    PlayerManager( boolean isMultiplayer, boolean... hasAI )
    {
        boolean _hasAI = Util.GetBoolean( false, hasAI );

        if( isMultiplayer ) {
            PlayerOne = new Player();
            PlayerTwo = new Player();
        } else if( !isMultiplayer && _hasAI ) {
            PlayerOne = new Player();
            PlayerTwo = new Player();
        } else {
            PlayerOne = new Player();
        }
        PlayerOne.CurrentTurn = true;
        Turn = 1;

    }

    public void GiveScore( int amount )
    {
        if( PlayerOne.CurrentTurn ){
            if( PlayerOne.Score + amount <= 0 ) //<>//
                PlayerOne.Score = 0;
            else 
                PlayerOne.Score += amount;
        } else if( PlayerTwo != null && PlayerTwo.CurrentTurn ){
            if( PlayerTwo.Score + amount <= 0 ) PlayerTwo.Score = 0;
            else PlayerTwo.Score += amount;
        }
    }
    public void ToggleTurn()
    {
        if( PlayerTwo != null )
        {
            if( PlayerTwo.CurrentTurn ) Turn++;

            PlayerTwo.CurrentTurn = PlayerOne.CurrentTurn;
            PlayerOne.CurrentTurn = !PlayerTwo.CurrentTurn;
        }
        else
        {
            PlayerOne.CurrentTurn = true;
            Turn++;
        }  
    }
}
