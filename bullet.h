//BULLET
typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int active;
    int direction;
} BULLET;
//Values 
extern BULLET bullet[1];
extern int kills;
//Prototypes
void initBullet();
void updateBullet();
void drawBullet();