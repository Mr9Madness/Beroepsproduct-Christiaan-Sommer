MainMenu menu = null;
Map currentMap = null;
PlayerManager playerManager = null;

void setup()
{
    size(1920, 1080, P3D);
    frameRate(144);
    //fullScreen(P3D);

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
    private static String GetString(String defaultValue, String... c)
    {
        // A method for getting the first object of a vararg because java doesn't have optional parameters in contructors
        if( c.length == 1 ) return c[0];
        else return defaultValue;
    }
}
class IO
{
    public boolean SaveObject(int index, String player, int value)
    {
        try
        {
            JSONArray array = loadJSONArray("data.json"); //<>//
            JSONObject object = new JSONObject();
            object.setInt( "index", index );
            object.setInt( "score", value );
            object.setString( "player", player );
            array.setJSONObject(index - 2, object);
            saveJSONArray( array, "data.json" );
            return true;
        } catch( Exception e )
        {
            e.printStackTrace();
            return false;
        }
    }

    public JSONArray LoadArray()
    {
        return loadJSONArray("data.json");
    }
    public JSONObject LoadObject(int index)
    {
        try{ return loadJSONArray("data.json").getJSONObject( index - 2 ); }
        catch( Exception e ){
            e.printStackTrace();
            JSONObject object = new JSONObject();
            object.setInt( "index", 0 );
            object.setInt( "score", 0 );
            object.setString( "player", "" );
            return object;
        }
    }
}
