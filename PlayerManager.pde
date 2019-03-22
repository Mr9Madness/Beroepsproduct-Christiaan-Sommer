class PlayerManager
{
    public Player PlayerOne;
    public Player PlayerTwo;
    
    public int Turn;

    PlayerManager( boolean isMultiplayer, String PlayerOneName, String... PlayerTwoName )
    {
        String _playerTwoName = Util.GetString( "Speler 2", PlayerTwoName );

        if( isMultiplayer ) {
            PlayerOne = new Player(PlayerOneName);
            PlayerTwo = new Player(_playerTwoName);
        } else {
            PlayerOne = new Player(PlayerOneName);
        }
        PlayerOne.CurrentTurn = true;
        Turn = 1;

    }

    public void GiveScore( int amount )
    {
        if( PlayerOne.CurrentTurn ){
            if( PlayerOne.Score + amount <= 0 )
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
