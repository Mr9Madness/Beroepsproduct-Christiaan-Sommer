// TODO Maybe move this (its ugly)
Map currentMap = null;
Player currentPlayer = null;

void setup()
{
    size(800, 400);

    // TODO move to menu class once it exists
    currentMap = new Map();
    currentPlayer = new Player();

    currentMap.InitCards();
}
void draw() {
    background(0);

    currentMap.UpdateCards();
}
