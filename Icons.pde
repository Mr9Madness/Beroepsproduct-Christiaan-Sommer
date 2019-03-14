public class Icons
{
    private int2 size;
    private String fileName;
    private PImage[] loadedShapes;
    public Icons (String fileName, int sizeX, int sizeY)
    {
        this.size = new int2(sizeX, sizeY);
        this.fileName = fileName;
    }

    public Icons LoadShapes( int count )
    {
        this.loadedShapes = new PImage[count];

        PImage bigimage = loadImage(this.fileName);
        bigimage.loadPixels();
        for (int i = 0; i < count; i++) {
            PImage image = createImage(32,32, ARGB);
            int2 randomIcon = new int2( (int)random(0,9), (int)random(0,15));
            image.loadPixels();
            for (int x = 0; x < 32; x++) {
                for (int y = 0; y < 32; y++) {
                    image.pixels[ y * image.width + x] = bigimage.pixels[ (y + randomIcon.Y * 32 ) * bigimage.width + (x + randomIcon.X * 32 ) ];
                }
            }

            image.updatePixels();
            loadedShapes[i] = image;
        }
        return this;
    }
    public PImage GetRandom() { return loadedShapes[ (int)random( 0, loadedShapes.length ) ]; }
    public PImage[] GetLoaded(){ return loadedShapes; }
}
