class MainMenu
{
    private boolean isGameOptionsShowing;
    private boolean isGameSinglePlayer;

    private Sliderbar bar = null;
    MainMenu()
    {
      DrawGameGUI();
      bar = new Sliderbar(new int2(width / 2 + 100, 25), new int2(width / 2 - 250, 25), 2, 32);
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

        if( mouseX >= width / 2 + 150 - 35 && mouseX <= width / 2 + 150 - 35 + 150 && mouseY >= (height / 2 - 150) + 25 - 10 && mouseY <= (height - 150) + 25 - 10 + 45)
            fill(200);
        else
            fill( 255 );
        rect( width / 2 + 150 - 35, (height / 2 - 150) + 25 - 10, 150, 45 );

        fill( 0 );
        text( "PLAY!", width / 2 + 150 - 35, (height / 2 - 150) + 25 - 10, 50 + 75 + 35, 75 + 25 + 10 );


        bar.Update();
    }

    public void InitSinglePlayerGame()
    {
        currentMap = new Map(bar.GetValue());
        playerManager = new PlayerManager(false);

        currentMap.Init();
    }

    public void InitMultiPlayerGame()
    {
        currentMap = new Map(bar.GetValue());
        playerManager = new PlayerManager(true);

        currentMap.Init();
    }

    public void Update()
    {
        DrawGameGUI();
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
