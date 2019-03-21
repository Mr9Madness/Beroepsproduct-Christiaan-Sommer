class PlayerManager
{
    public Player PlayerOne;
    public Player PlayerTwo;

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

    }

    public void GiveScore( int amount )
    {
        if( PlayerOne.CurrentTurn )
            PlayerOne.Score += amount;
        else if( PlayerTwo != null && PlayerTwo.CurrentTurn )
            PlayerTwo.Score += amount;
    }
    public void ToggleTurn()
    {
        if( PlayerTwo != null )
        {
            PlayerTwo.CurrentTurn = PlayerOne.CurrentTurn;
            PlayerOne.CurrentTurn = !PlayerTwo.CurrentTurn;
        }
        else
            PlayerOne.CurrentTurn = true;
    }
}
