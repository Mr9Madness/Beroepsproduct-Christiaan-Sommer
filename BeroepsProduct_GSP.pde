// TODO Maybe move this (its ugly)
Map currentMap = null;
Player currentPlayer = null;

PImage bigimage;
PImage image;

void setup() {
    size(800, 400);

    // TODO move to menu class once it exists
    currentMap = new Map();
    currentPlayer = new Player();

    currentMap.InitCards();

    // bigimage = loadImage("assets/icons.png");
    // bigimage.loadPixels();
    // image = createImage(32,32, ARGB);
    // image.loadPixels();
    // // for (int i = 0; i < image.pixels.length; i++) {
    // //     image.pixels[i] = bigimage.pixels[ (( i / 32 ) * bigimage.width) + (i - ( i / 32 ) * image.width) ];
    // //     //(( i / 32 ) * 480) + (i - ( i / 32 ) * 32)
    // // }
    // for (int x = 0; x < 32; x++) {
    //     for (int y = 0; y < 32; y++) {
    //         image.pixels[ y * image.width + x] = bigimage.pixels[ y * bigimage.width + x ];
    //     }
    // }

    // image.updatePixels();

}
void draw() {
    image(image, 0, 0, 128, 128);
}

//0   ... 32
//480 ... 512
