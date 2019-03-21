class MainMenu
{
    private boolean isGameOptionsShowing = false;
    private boolean isGameSinglePlayer = false;
    MainMenu(){ DrawMainGUI(); }

    public void DrawMainGUI()
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
        rect( width / 2, height - (height - 25), width / 2 - 50, height - 50);

    }

    public void InitSinglePlayerGame()
    {
        currentMap = new Map();
        playerManager = new PlayerManager(false);

        currentMap.Init();
    }

    public void InitMultiPlayerGame()
    {
        currentMap = new Map();
        playerManager = new PlayerManager(true);

        currentMap.Init();
    }

    public void Update()
    {
        DrawMainGUI();
        if( isGameOptionsShowing ) DrawOptionsGUI();

        if( mousePressed && mouseX >= 50 && mouseX <= 50 + 150 && mouseY >= 75 && mouseY <= 75 + 50) {
            isGameOptionsShowing = true;
            isGameSinglePlayer = true;
        }
        if( mousePressed && mouseX >= 50 && mouseX <= 50 + 150 && mouseY >= 150 && mouseY <= 150 + 45){
            isGameOptionsShowing = true;
            isGameSinglePlayer = false;
        }
    }
}
