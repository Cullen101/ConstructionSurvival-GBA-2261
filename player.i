# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1

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

void initPlayer();
void updatePlayer();
void drawPlayer();
# 2 "player.c" 2
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "myLib.h"
void hideSprites();






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 293 "myLib.h"
typedef void (*ihp)(void);
# 3 "player.c" 2
# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[65536];
# 4 "player.c" 2
# 1 "enemy.h" 1

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

extern ENEMY enemy[4];
extern int hit;

void initEnemy();
void updateEnemy(ENEMY *e);
void drawEnemy(ENEMY *e);
void beCollision();
# 5 "player.c" 2
# 1 "bullet.h" 1

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

extern BULLET bullet[1];
extern int kills;

void initBullet();
void updateBullet();
void drawBullet();
# 6 "player.c" 2
# 1 "powerUp.h" 1

typedef struct {
    int row;
    int col;
    int spawn;
    int width;
    int height;
    int active;

    int power;
} POWERUP;

extern POWERUP powerUp[1];
extern int time;

void initPowerUp();
void updatePowerUp();
void drawPowerUp();
# 7 "player.c" 2
PLAYER player;
int hit;
int temp;
int temp2;
int vel = 1;
int vOff;
int hOff;
int cheat;
int temp3;
int tem1;
int tem2;
int tem3;
int tem4;

enum {SPRITERIGHT, SPRITELEFT, SPRITEJUMPR, SPRITEJUMPL, SPRITEIDLE};



void initPlayer() {
    player.height = 15;
    player.width = 16;
    player.rdel = 4;
    player.cdel = 2;
    player.jump = 0;
    player.row = 160 - player.height - 8;
    player.col = 240 / 2 - player.width * 2;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
 player.aniState = SPRITERIGHT;
    player.direction = 1;
    player.updir = 1;
}



void updatePlayer() {
    player.prevAniState = player.aniState;
    player.aniState = SPRITEIDLE;
    if(player.aniCounter % 15 == 0) {
        if (player.curFrame < player.numFrames - 1) {
            player.curFrame++;
        } else {
            player.curFrame = 0;
        }
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (cheat == 1 && player.col > 0) {
            player.direction = -1;
            player.col -= player.cdel;
        } else if (player.col > 0 && collisionmapBitmap[((player.row) * (256) + (player.col - player.cdel))] && collisionmapBitmap[((player.row + player.height - 1) * (256) + (player.col - player.cdel))]) {
            player.col -= player.cdel;
            player.direction = -1;
        }
        if (hOff > 0 && (player.col - hOff) < 240 / 2) {
                hOff--;
            }
            player.aniState = SPRITELEFT;
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))) && player.col + player.width < 256) {
        if (cheat == 1 ) {
            player.direction = 1;
            player.col += player.cdel;
        } else if (collisionmapBitmap[((player.row) * (256) + (player.col + player.width - 1 + player.cdel))] && collisionmapBitmap[((player.row + player.height - 1) * (256) + (player.col + player.width - 1 + player.cdel))]) {
            player.col += player.cdel;
            player.direction = 1;
        }
        if (hOff < 256 - 240 && (player.col - hOff) > 240 / 2) {
                hOff++;
            }
            player.aniState = SPRITERIGHT;
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {

        if (cheat == 1 && player.row > 0 ) {
            player.row -= 1;
            player.updir = -1;
            if (player.direction == -1) {
                player.aniState = SPRITEJUMPL;
            } else {
                player.aniState = SPRITEJUMPR;
            }

        } else if (player.jump <= 64) {
            if (player.row > 0 && collisionmapBitmap[((player.row - player.rdel) * (256) + (player.col))] && collisionmapBitmap[((player.row - player.rdel) * (256) + (player.col + player.width - 1))]) {
                if (player.direction == -1) {
                    player.aniState = SPRITEJUMPL;
                } else {
                    player.aniState = SPRITEJUMPR;
                }
                player.row -= player.rdel;
                player.jump += 1;
            }

        }
        if (vOff > 0 && (player.row - vOff) < 160 / 2) {
                vOff--;
            }
    }


    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {

        for (int i = 0; i < 1; i++) {
            if (!bullet[i].active) {
                bullet[i].row = player.row + bullet[i].height;
                bullet[i].col = player.col + player.width - 7;


                if (enemy[i].cdel == 0) {
                    break;

                } else {

                    bullet[i].rdel = 0;
                    bullet[i].cdel = player.direction * 2;
                }
                bullet[i].active = 1;
                break;
            }
        }
    }

    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1))))) {

        if (time == 0) {
            for (int i = 0; i < 4; i++) {
                if (i == 0) {
                    enemy[0].cdel = tem1;
                }
                if (i == 1) {
                    enemy[1].cdel = tem2;
                }
                if (i == 2) {
                    enemy[2].cdel = tem3;
                }
                if (i == 3) {
                    enemy[3].cdel = tem4;
                }
                bullet[0].cdel = temp2;
                bullet[0].rdel = temp3;
                enemy[i].rdel = 1;
                bullet[0].direction = 0;
                time = -1;
            }
        }

        if (time >= 1) {
            for (int i = 0; i < 4; i++) {
                if (i == 0) {
                    tem1 = enemy[0].cdel;
                }
                if (i == 1) {
                    tem2 = enemy[1].cdel;
                }
                if (i == 2) {
                    tem3 = enemy[2].cdel;
                }
                if (i == 3) {
                    tem4 = enemy[3].cdel;
                }

                temp2 = bullet[0].cdel;
                temp3 = bullet[0].rdel;


                if (temp2 > 0) {
                    bullet[0].direction = 1;
                } else if (temp2 < 0) {
                    bullet[0].direction = -1;

                } else if (temp3 > 0) {
                    bullet[0].direction = 2;
                } else if (temp3 < 0) {
                    bullet[0].direction = -2;
                }

                enemy[i].rdel = 0;
                enemy[i].cdel = 0;
            }
            bullet[0].cdel = 0;
            bullet[0].rdel = 0;
            time = 0;

        }
    }
    if (cheat == 1) {


            if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))){
                player.row += 1;
                player.updir = 1;
            }

            if ((!(~(oldButtons) & ((1 << 9))) && (~buttons & ((1 << 9))))) {
                for (int i = 0; i < 1; i++) {
                    if (!bullet[i].active) {
                        bullet[i].row = player.row;
                        bullet[i].col = player.col;
                        if (enemy[i].cdel == 0) {
                            break;

                        } else {
                            bullet[i].cdel = 0;
                            bullet[i].rdel = player.updir * 2;
                        }
                        bullet[i].active = 1;
                        break;
                    }
                }
            }
        }

    if ((!(~(oldButtons) & ((1 << 8))) && (~buttons & ((1 << 8))))) {
        if (cheat == 0) {
            cheat = 1;
        } else {
            cheat = 0;
        }
    }

    if (player.aniState == SPRITEIDLE) {
   player.curFrame = 0;
   player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }



    if (!(collisionmapBitmap[((player.row - player.rdel) * (256) + (player.col))] && collisionmapBitmap[((player.row - player.rdel) * (256) + (player.col + player.width - 1))])) {
        player.jump = 65;
    }

    if (!(collisionmapBitmap[((player.row + player.height - 1 + player.rdel) * (256) + (player.col))] && collisionmapBitmap[((player.row + player.height - 1 + player.rdel) * (256) + (player.col + player.width - 1))])) {
        player.jump = 0;
        if (player.direction == -1) {
        player.aniState = SPRITELEFT;
        } else {
            player.aniState = SPRITERIGHT;
        }
    }

    if (player.row + player.height < 256 && collisionmapBitmap[((player.row + player.height - 1 + player.rdel) * (256) + (player.col))] && collisionmapBitmap[((player.row + player.height - 1 + player.rdel) * (256) + (player.col + player.width - 1))]) {
        if (cheat == 0) {
            if (player. jump >= 64) {
                player.row += 2;
            } else {
                player.row += 2;
            }
        }
        if (vOff < 256 - 160 && (player.row - vOff) > 160 / 2) {
                vOff++;
            }

    }

    if (player.row + player.height > 250) {
        player.row = 0 + player.height - 17;
        player.col = 240 / 2 - player.width * 2;
        hit++;
        vOff = 0;
        hOff = 0;
    }

}


void drawPlayer() {

    shadowOAM[0].attr0 = (0xFF & (player.row - vOff)) | (0 << 13) | (0 << 14);
    shadowOAM[0].attr1 = (0x1FF & (player.col - hOff)) | (1 << 14);
    shadowOAM[0].attr2 = ((player.curFrame * 2)*32 + (player.aniState * 2)) | ((0) << 12) ;
}
