public class Map
{
    private String[][] cards;
    private CardPair[] cardSets;

    public void InitCards()
    {
        // TODO MAKE THIS LESS OF A MESS
        cards = new String[width / 100][height / 150];
        PImage[] icons = new Icons("assets/icons.png", 288, 480).LoadShapes(14);
        for (int x = 0; x < width / 100; x++)
        {
            for (int y = 0; y < height / 150; y++)
            {
                PImage icon = icons.GetRandom();

                int firstRandomX = random(0, x / 100);
                int firstRandomY = random(0, y * 150);
                Card firstCard = new Card( new int2( firstRandomX, firstRandomY ), icon );
                cards[firstRandomX][firstRandomY] = firstCard.GetId();

                int secondRandomX = random(0, x / 100);
                int secondRandomY = random(0, y * 150);
                Card seconCard = new Card( new int2( secondRandomX, secondRandomY ), icon );
                cards[secondRandomX][secondRandomY] = seconCard.GetId();

                append(cardSets, new CardPair( firstCard, secondCard ));
            }
        }
    }
}
