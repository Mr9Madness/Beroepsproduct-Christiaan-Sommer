public class Icons
{
    private String fileName;
    private PImage[] loadedIcons;
    private boolean[][] usedIcons;
    public Icons (String fileName)
    {
        this.fileName = fileName;
    }

    public Icons LoadIcons( int count )
    {
        this.loadedIcons = new PImage[count];
        this.usedIcons = new boolean[9][15];

        PImage bigimage = loadImage(this.fileName);
        bigimage.loadPixels();
        for (int i = 0; i < count; i++) 
        {
            PImage image = createImage(32,32, ARGB);
            int2 randomIcon = new int2( (int)random(0,9), (int)random(0,15));
            while( usedIcons[randomIcon.X][randomIcon.Y] )
                randomIcon = new int2( (int)random(0,9), (int)random(0,15));
            usedIcons[randomIcon.X][randomIcon.Y] = true;
            
            image.loadPixels();
            for (int x = 0; x < 32; x++) {
                for (int y = 0; y < 32; y++) {
                    image.pixels[ y * image.width + x] = bigimage.pixels[ (y + randomIcon.Y * 32 ) * bigimage.width + (x + randomIcon.X * 32 ) ];
                }
            }

            image.updatePixels();
            loadedIcons[i] = image;
        }
        return this;
    }
    public PImage[] GetLoaded(){ return loadedIcons; }
}
