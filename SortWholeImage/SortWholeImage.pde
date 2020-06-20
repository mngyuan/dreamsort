/*

SORT WHOLE IMAGE LIKE IT WAS A LINEAR ARRAY

Test program

 */
 
String filename = "../InputImages/141539010021.jpg";
boolean saveIt = true;
PImage img;

void setup() {
  img = loadImage(filename);
  size(img.width, img.height);
  image(img, 0,0);
}

void draw() {
  String filenameStripped = stripFileExtension(filename);
  sortImageCustom();
  image(img, 0, 0);
  if (saveIt) {
    save("results/" + filenameStripped + "_SortWholeImage.tiff");
  }
//  setup();
//  sortByColumn();
//  image(img, 0, 0); 
//  if (saveIt) {
//    save("results/" + filenameStripped + "_SortByColumn.tiff");
//  }
//  setup();
//  sortByRow();
//  image(img, 0, 0);
//  if (saveIt) {
//    save("results/" + filenameStripped + "_SortByRow.tiff");
//  }
//  setup();
//  sortByRow();
//  sortByColumn();
//  image(img, 0, 0);
//  if (saveIt) {
//    save("results/" + filenameStripped + "_SortByRowThenColumn.tiff");
//  }
//  setup();
//  sortByColumn();
//  sortByRow();
//  image(img, 0, 0);
//  if (saveIt) {
//    save("results/" + filenameStripped + "_SortByColumnThenRow.tiff");
//  }
}

// strip file extension for saving and renaming
String stripFileExtension(String s) {
  s = s.substring(s.lastIndexOf('/')+1, s.length());
  s = s.substring(s.lastIndexOf('\\')+1, s.length());
  s = s.substring(0, s.lastIndexOf('.'));
  return s;
}

void quicksort(color[] px, int low, int high) {
  img.loadPixels();
  px = pixels;
  if (low < high) {
    int i = partition(px, low, high);
    quicksort(px, low, i-1);
    quicksort(px, i+1, high);
  }
  img.updatePixels();
}

int partition(color[] px, int low, int high) {
    img.loadPixels();
  px = pixels;
  color pivot = px[high];
  int i = low;
  for (int j = low; j < high; j++) {
    if (red(px[j]) < red(pivot)) {
      int tmp = px[i];
      px[i] = px[j];
      px[j] = tmp;
    }
  }
  int tmp = px[i];
  px[i] = pivot;
  px[high] = tmp; 
  img.updatePixels();
  return i;
}

void psortRed(color[] px) {
  //px
}

void sortImage() {
  int numPx = img.width * img.height;
  img.loadPixels();
  color[] c = new color[numPx];
  for (int j=0; j<numPx; j++) {
    c[j] += img.pixels[j];
  }
  c = sort(c);

  for (int j=0; j<numPx; j++) {
    img.pixels[j] = c[j];
  }
  img.updatePixels();
}

void sortImage2() {
  img.loadPixels();
  sort(pixels);
  img.updatePixels();
}

void sortImageCustom() {
  img.loadPixels();
  quicksort(pixels, 0, img.height*img.width - 1);
  img.updatePixels();
}

void sortByRow() {
  img.loadPixels();
  for (int i = 0; i < img.height; i++) {
    color[] c = new color[img.width];
    for (int j=0; j<img.width; j++) {
      c[j] += img.pixels[i*img.width + j];
    }
    c = sort(c);
  
    for (int j=0; j<img.width; j++) {
      img.pixels[i*img.width + j] = c[j];
    }
  }
  img.updatePixels();
}

void sortByColumn() {
  img.loadPixels();
  for (int i = 0; i < img.width; i++) {
    color[] c = new color[img.height];
    for (int j=0; j<img.height; j++) {
      c[j] += img.pixels[i + j*img.width];
    }
    c = sort(c);
  
    for (int j=0; j<img.height; j++) {
      img.pixels[i + j*img.width] = c[j];
    }
  }
  img.updatePixels();
}

void sortByLeastResistanceSeam() {
  img.loadPixels();
  
  img.updatePixels();
}
