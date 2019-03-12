public class Icons {
    private int2 size;
    private String fileName;
    private PImage[] loadedShapes;
    public Icons (String fileName, int sizeX, int sizeY)
    {
        this.size = new int2(sizeX, sizeY);
        this.fileName = fileName;
        this.loadedShapes = [];
    }

    public Icons LoadShapes( int count )
    {
        bigimage = loadImage(this.fileName);
        bigimage.loadPixels();
        for (int i = 0; i < count; i++) {
            image = createImage(32,32, ARGB);
            image.loadPixels();
            for (int i = 0; i < image.pixels.length; i++) {
                    image.pixels[i] = bigimage.pixels[
                        (( i / 32 ) * bigimage.width + (random(0, 15) * image.height)) + (i - ( i / 32 ) * image.width + (random(0, 9) * image.width))
                    ];
                }
            }

            image.updatePixels();
            append(loadedShapes, image);
        }
        return this;
    }
    public PImage GetRandom() { return loadedShapes[ random( 0, loadedShapes.length ) ]; }
    public PImage[] GetLoaded(){ return loadedShapes; }
}
