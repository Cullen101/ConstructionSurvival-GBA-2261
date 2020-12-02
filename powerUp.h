//powerUp
typedef struct {
    int row;
    int col;
    int spawn;
    int width;
    int height;
    int active;
    //0 = time, 1 = hit;
    int power;
} POWERUP;
//Values 
extern POWERUP powerUp[1];
extern int time;
//Prototypes
void initPowerUp();
void updatePowerUp();
void drawPowerUp();