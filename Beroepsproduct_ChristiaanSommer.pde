// TODO Maybe move this (its ugly)
MainMenu menu = null;
Map currentMap = null;
PlayerManager playerManager = null;

void setup()
{
    size(800, 400, P3D);
    frameRate(144);

    menu = new MainMenu();
}
void draw() {
    background(0);

    if( currentMap == null )
        menu.Update();
    else
        currentMap.Update();
}


static class Util
{
    private static boolean GetBoolean(boolean defaultValue, boolean... c)
    {
        // A method for getting the first object of a vararg because java doesn't have optional parameters in contructors
        if( c.length == 1 ) return c[0];
        else return defaultValue;
    }
    public boolean SaveArray()
    {
        return false;
    }
    public boolean SaveObject()
    {
        return false;
    }
    
    public JSONArray LoadArray()
    {
        return new JSONArray();
    }
    public JSONObject LoadObject()
    {
        return new JSONObject();
    }
}
