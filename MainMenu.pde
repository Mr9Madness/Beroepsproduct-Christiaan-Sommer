class MainMenu
{
    private boolean isGameOptionsShowing;
    private boolean isGameSinglePlayer;

    private Sliderbar bar = null;
    private TextInput firstPlayerInput = null;
    private TextInput secondPlayerInput = null;
    private JSONArray array = null;
    MainMenu()
    {
        DrawGameGUI();
        bar = new Sliderbar(new int2(width / 2 + 100, 50), new int2(width / 2 - 250, 25), 2, 32);
        firstPlayerInput = new TextInput(new int2(width / 2 + 100, 75), new int2(150, 35), "Speler 1");
        secondPlayerInput = new TextInput(new int2(width / 2 + 100, 130), new int2(150, 35), "Speler 2");

        array = new IO().LoadArray();
    }

    public void DrawGameGUI()
    {
        fill(150);
        rect( width - (width - 25), height - (height - 25), width / 2 - 50, height - 50);

        fill( 255 );
        if( mouseX >= 50 && mouseX <= 50 + 150 && mouseY >= 75 && mouseY <= 75 + 45)
            fill(200);
        rect( 50, 75, 150, 45 );

        fill( 255 );
        if( mouseX >= 50 && mouseX <= 50 + 150 && mouseY >= 150 && mouseY <= 150 + 45)
            fill(200);
        rect( 50, 150, 150, 45 );

        fill( 0 );
        text( "Single player", 50 + 75 - 35, 75 + 25 - 10, 50 + 75 + 35, 75 + 25 + 10 );
        text( "Multi player", 50 + 75 - 30, 150 + 25 - 10, 50 + 75 + 35, 150 + 25 + 10 );
    }

    private void DrawOptionsGUI()
    {
        fill(150);
        rect( width / 2, height - (height - 25), width / 2 - 50, height / 2 - 50);

        if( mouseX >= width / 2 + 150 - 35 && mouseX <= width / 2 + 150 - 35 + 150 && mouseY >= (height / 2 - 150) + 25 - 10 && mouseY <= (height / 2 - 150) + 25 - 10 + 45)
            fill(200);
        else
            fill( 255 );
        rect( width / 2 + 150 - 35, (height / 2 - 150) + 25 - 10, 150, 45 );

        fill( 0 );
        text( "PLAY!", width / 2 + 170, (height / 2 - 150) + 30, 50 + 75 + 35, 75 + 25 + 10 );


        bar.Update();
        firstPlayerInput.Update();
        if( !isGameSinglePlayer ) secondPlayerInput.Update();
    }

    private void DrawHighScoreGUI()
    {
        fill(150);
        rect( width / 2, height / 2, width / 2 - 50, height / 2 - 50);

        for( int i = 0; i < array.size(); i++ ){
            if(array.getJSONObject(i).getInt("score") != -1)
            {
                int x = i >= 10 ? i - (i / 10) * 10 : i;
                fill( 200 );
                rect( width / 2 + 5 + x * 80, height / 2 + (i / 10) * 50 + 5, 75, 50);
                
                fill( 255 );
                text( array.getJSONObject(i).getInt("index") + " sets", width / 2 + 15 + x * 80, height / 2 + (i / 10) * 50 + 25);
                text( array.getJSONObject(i).getString("player") + ": " + array.getJSONObject(i).getInt("score"), width / 2 + 15 + x * 80, height / 2 + (i / 10) * 50 + 40 );
            }
        }
    }

    public void InitSinglePlayerGame()
    {
        currentMap = new Map(bar.GetValue());
        playerManager = new PlayerManager(false, firstPlayerInput.GetValue());

        currentMap.Init();
    }

    public void InitMultiPlayerGame()
    {
        currentMap = new Map(bar.GetValue());
        playerManager = new PlayerManager(true, firstPlayerInput.GetValue(), secondPlayerInput.GetValue());

        currentMap.Init();
    }

    public void Update()
    {
        array = new IO().LoadArray();

        DrawGameGUI();
        DrawHighScoreGUI();
        if( isGameOptionsShowing ) DrawOptionsGUI();

        if( mousePressed && mouseX >= 50 && mouseX <= 50 + 150 && mouseY >= 75 && mouseY <= 75 + 50){
            this.isGameOptionsShowing = true;
            this.isGameSinglePlayer = true;
        }
        if( mousePressed && mouseX >= 50 && mouseX <= 50 + 150 && mouseY >= 150 && mouseY <= 150 + 45){
            this.isGameOptionsShowing = true;
            this.isGameSinglePlayer = false;
        }
        if( mousePressed && mouseX >= width / 2 + 150 - 35 && mouseX <= width / 2 + 150 - 35 + 150 && mouseY >= (height / 2 - 150) + 25 - 10 && mouseY <= (height / 2 - 150) + 25 - 10 + 45)
        {
            if(isGameSinglePlayer) InitSinglePlayerGame();
            else InitMultiPlayerGame();
        }

    }
}
