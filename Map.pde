public class Map
{
    private String[][] cards;
    private CardPair[] cardSets;
    private int setAmount;
    private JSONObject highscore;

    public Map(int amountSets)
    {
        this.setAmount = amountSets;
        this.highscore = new IO().LoadObject( setAmount );
    }

    public void Init()
    {
        //InitMap();
        InitCards();
    }
    
    public void Update()
    {
        DrawMapGUI();
        UpdateCards();
        
        if( isCardSetsFull() )
            DrawVictoryGUI();
    }

    private void InitCards()
    {
        cards = new String[width / 100][height / 150];

        cardSets = new CardPair[setAmount];
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

        while( cards[randomX][randomY] != null )
        {
            randomX = (int)random(0, width / 100);
            randomY = (int)random(0, height / 150);
        }
        Card card = new Card( new int2( randomX, randomY ), icon );
        cards[randomX][randomY] = card.GetId();
        return card;
    }

    private void DrawMapGUI()
    {
        fill( 255 );
        text("Score " + playerManager.PlayerOne.Name + ": " + playerManager.PlayerOne.Score, 5, 10);

        text( "Turn: " + playerManager.Turn, width / 2 - 10, 10 ); 

        if( playerManager.PlayerTwo != null )
            text( "Score " + playerManager.PlayerTwo.Name + ": " + playerManager.PlayerTwo.Score, width - 125, 10);
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

    public boolean isCardSetsFull()
    {
        for( CardPair pair: cardSets ){
            if(pair.IsFound()) continue;
            return false;
        }
        return true;
    }
    
    private void DrawVictoryGUI()
    {
        fill(150);
        rect( width / 2 - ((width / 4) / 2), height / 2 - ((height / 4) / 2), width / 4, height / 4 );
                
        if( highscore.getInt( "score" ) < playerManager.PlayerOne.Score ) new IO().SaveObject(setAmount, playerManager.PlayerOne.Name, playerManager.PlayerOne.Score ); 
        if( playerManager.PlayerTwo != null && highscore.getInt( "score") < playerManager.PlayerTwo.Score ) new IO().SaveObject(setAmount, playerManager.PlayerTwo.Name, playerManager.PlayerTwo.Score ); 
        fill(255);
        text( "Vorige high score van: " + highscore.getString("player") + " is " + highscore.getInt("score"), width / 2 - ((width / 4) / 2) + 10, height / 2 - ((height / 4) / 2) + 20 );

        text( "Score " + playerManager.PlayerOne.Name + ": " + playerManager.PlayerOne.Score, width / 2 - ((width / 4) / 2) + 10, height / 2 - ((height / 4) / 2) + 50 );
        if( playerManager.PlayerTwo != null )
            text( "Score " + playerManager.PlayerTwo.Name + ": " + playerManager.PlayerTwo.Score, width / 2 - ((width / 4) / 2) + 350, height / 2 - ((height / 4) / 2) + 50 );
            
        text( "Turn: " + playerManager.Turn, width / 2, height / 2 - ((height / 4) / 2) + 50 );
        
        if( mouseX >= width / 2 - 75 && mouseX <= width / 2 - 75 + 150 && mouseY >= height / 2 + ((height / 4) / 2) - 50 && mouseY <= height / 2 + ((height / 4) / 2) - 50 + 50)
            fill( 200 );
        else
            fill( 225 );
        rect( width / 2 - 75, height / 2 + ((height / 4) / 2) - 50, 150, 50 );
        if( mousePressed && mouseX >= width / 2 - 75 && mouseX <= width / 2 - 75 + 150 && mouseY >= height / 2 + ((height / 4) / 2) - 50 && mouseY <= height / 2 + ((height / 4) / 2) - 50 + 50)
            currentMap = null;
        
        fill( 255 );
        text( "Terug naar main menu", width / 2 - 70, height / 2 + ((height / 4) / 2) - 25 );

    }
    private void FreezeCards()
    {
        // Temp variable to make sure the turn doesn't switch for every pair
        boolean changedTurn = false;
        for (CardPair pair : cardSets) {

            pair.FirstCard.Frozen = true;
            pair.SecondCard.Frozen = true;

            if( millis() % 2500 > 2000 )
            {
                pair.FirstCard.SetChosen(false);
                pair.SecondCard.SetChosen(false);

                pair.FirstCard.Frozen = false;
                pair.SecondCard.Frozen = false;
                if( !changedTurn )
                {
                    playerManager.GiveScore( -10 );
                    playerManager.ToggleTurn();
                    changedTurn = true;
                }
            }
        }
    }
}
