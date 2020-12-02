//enemy
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int aniCounter;
    int curFrame;
    int numFrames;
    int aniState;
    int prevAniState;
    int value;
} ENEMY;
//Values 
extern ENEMY enemy[4];
extern int hit;
//Prototypes
void initEnemy();
void updateEnemy(ENEMY *e);
void drawEnemy(ENEMY *e);
void beCollision();