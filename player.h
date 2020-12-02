//Player
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int jump;
    int direction;
    int updir;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} PLAYER ;

extern PLAYER player;
extern int cheat;
//Prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();