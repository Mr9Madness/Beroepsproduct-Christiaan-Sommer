public class Map
{
    private String[][] cards;
    private CardPair[] cardSets;

    public void InitCards()
    {
        // TODO MAKE THIS LESS OF A MESS
        cards = new String[width / 100][height / 150];

        // TODO Calculate the amount of card that fix on the screen
        cardSets = new CardPair[5];
        Icons icons = new Icons("assets/icons.png", 288, 480).LoadShapes(14);
        for (int i = 0; i < cardSets.length; i++)
        {
            PImage icon = icons.GetRandom();
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

    public void UpdateCards()
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
    
            }
        }
    }
}
