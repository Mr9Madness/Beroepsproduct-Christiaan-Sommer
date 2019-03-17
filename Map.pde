public class Map
{
    private String[][] cards;
    private CardPair[] cardSets;

    public void Init()
    {
        //InitMap();
        InitCards();
    }

    private void InitCards()
    {
        // TODO MAKE THIS LESS OF A MESS
        cards = new String[width / 100][height / 150];

        // TODO Calculate the amount of card that fix on the screen
        cardSets = new CardPair[5];
        Icons icons = new Icons("assets/icons.png").LoadIcons(cardSets.length);
        for (int i = 0; i < cardSets.length; i++)
        {
            PImage icon = icons.GetLoaded()[i];
            cardSets[i] = new CardPair( InitCard(icon), InitCard(icon) );
        }
    }

    public Card InitCard(PImage icon)
    {
        int randomX = (int)random(0, width / 100);
        int randomY = (int)random(0, height / 150);

        // TODO Implement a better way to see if its already taken
        while( cards[randomX][randomY] != null )
        {
            randomX = (int)random(0, width / 100);
            randomY = (int)random(0, height / 150);
        }
        Card card = new Card( new int2( randomX, randomY ), icon );
        cards[randomX][randomY] = card.GetId();
        return card;
    }

    public void Update()
    {
        DrawMap();
        UpdateCards();
    }

    private void DrawMap()
    {
        fill( 255 );
        text( playerManager.PlayerOne.Score, 5, 10);

        if( playerManager.PlayerTwo != null )
            text( playerManager.PlayerTwo.Score, width - 20, 10);
    }

    private void UpdateCards()
    {
        int chosenCount = 0;
        for (CardPair pair : cardSets) {
            pair.Update();

            if( pair.FirstCard.IsChosen() || pair.SecondCard.IsChosen() )
                chosenCount++;

            if( chosenCount >= 2 )
            {
                FreezeCards();
                chosenCount = 0;
            }
        }
    }

    private void FreezeCards()
    {
        // Temp variable to make sure the turn doesn't switch for every pair
        boolean changedTurn = false;
        for (CardPair pair : cardSets) {

            pair.FirstCard.Frozen = true;
            pair.SecondCard.Frozen = true;

            println("millis: " + millis() % 2000 );
            if( millis() % 2500 > 2000 )
            {
                pair.FirstCard.SetChosen(false);
                pair.SecondCard.SetChosen(false);

                pair.FirstCard.Frozen = false;
                pair.SecondCard.Frozen = false;
                if( !changedTurn )
                {
                   playerManager.ToggleTurn();
                   changedTurn = true;
                }
            }
        }
    }
}
