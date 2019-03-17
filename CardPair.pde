public class CardPair {
    public Card FirstCard = null;
    public Card SecondCard = null;
    public boolean IsFull()
    {
        if( FirstCard == null ) return false;
        if( SecondCard == null ) return false;
        return true;
    }
    public CardPair() { }
    public CardPair( Card firstCard )
    {
        FirstCard = firstCard;
    }
    public CardPair( Card firstCard, Card secondCard )
    {
        FirstCard = firstCard;
        SecondCard = secondCard;
    }
    public void Update()
    {
        FirstCard.Update();
        SecondCard.Update();

        if( FirstCard.IsChosen() && SecondCard.IsChosen() )
        {
            FirstCard.Revealed = true;
            SecondCard.Revealed = true;

            FirstCard.SetChosen(false);
            SecondCard.SetChosen(false);

            playerManager.GiveScore( 50 );
        }
    }
}
