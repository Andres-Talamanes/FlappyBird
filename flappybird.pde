PImage backpic, birdpic, wallpic, welcomescreen;
int game, score, highscore, x, y, vertical, wallx[] = new int[2], wally[] =new int[2];
void setup() {
   backpic =loadImage("img/back.png");
   birdpic =loadImage("img/bird.png");
   wallpic =loadImage("img/wall.png");
   welcomescreen=loadImage("img/start.jpg");
   game = 1; score = 0; highscore = 0; x = -200; vertical = 0; 
  size(600,800);
  fill(250,0,0);
  textSize(20);  
}
/*Estructura del videojuego */
void draw() { 
  if(game == 0) {
    imageMode(CORNER);
    image(backpic, x, 0);
    image(backpic, x+backpic.width, 0);
    x -= 5;
    vertical += 1;
    y += vertical;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(wallpic, wallx[i], wally[i] - (wallpic.height/2+100));
      image(wallpic, wallx[i], wally[i] + (wallpic.height/2+100));
      if(wallx[i] < 0) {
        wally[i] = (int)random(200,height-200);
        wallx[i] = width;
      }  
      if(wallx[i] == width/2) highscore = max(++score, highscore);
      if(y>height||y<0||(abs(width/2-wallx[i])<25 && abs(y-wally[i])>100)) game=1;
      wallx[i] -= 6;
    }
    image(birdpic, width/2, y);
    text("Puntuacion: "+score, 10, 20);
  }
  else {
    /*Pantalla de inicio*/
    imageMode(CENTER);
    image(welcomescreen, width/2,height/2);
    fill(5,5,5);
    text("Mejor Puntuacion: "+highscore, 50, 20);
    text("Elaborado por Andrés Manuel Hernández Talamantes", 50, 50);
    text("Para hacer brincar el pajaro hacer click izquierdo", 50, 80);
    text("Y para volver a empezar dar click izquierdo",50,100);
  }
}
/*Accion del mouse para pode interactuar dentro del juego*/
void mousePressed() {
  vertical = -10;
  if(game==1) {
    wallx[0] = 600;
    wally[0] = y = height/2;
    wallx[1] = 900;
    wally[1] = 600;
    x = game = score = 0;
  }
}
