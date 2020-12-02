#include <stdlib.h>
#include <stdio.h>
#include "enemy.h"
#include "myLib.h"
#include "collisionmap.h"
#include "game.h"
#include "player.h"
#include "bullet.h"

//Enemy Pool
ENEMY enemy[4];

//Variables
int hit;
int kills;
int hOff;
int vOff;
int time;
int save;

enum {S, P, R, i, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

//initializes enemy
void initEnemy() {
    for (int i = 0; i < 4; i++) {
        enemy[i].height = 10;
        enemy[i].width = 11;
        enemy[i].rdel = 2;
        if (i == 0 || i == 1) {
            enemy[i].cdel = 2;
        } else {
            enemy[i].cdel = -2;
        }
        enemy[i].row = 0 + enemy[i].height - 8;
        enemy[i].col = SCREENWIDTH / 2 - enemy[i].width * 2;
        if (i % 2 == 0) {
            enemy[i].active = 1;
        } else {
            enemy[i].active = 0;
        }
        enemy[i].aniCounter = 0;
        enemy[i].curFrame = 0;
        enemy[i].numFrames = 4;
	    enemy[i].aniState = SPRITERIGHT; 
        enemy[i].value = i;
    }

}
//updates our enemy 
void updateEnemy(ENEMY *e) {
    if (e->active == 1) {
        e->prevAniState = e->aniState;
        e->aniState = SPRITEIDLE;
        if(e->aniCounter % 15 == 0) {
            if (e->curFrame < e->numFrames - 1) {
                e->curFrame++;
            } else {
                e->curFrame = 0;
            }
        }
        //Checks if it is ok to move on collision map both ways, if it is, then move that direction.
            if (collisionmapBitmap[OFFSET(e->col - e->cdel, e->row, 256)] && collisionmapBitmap[OFFSET(e->col - e->cdel, e->row + e->height - 1, 256)] &&
            collisionmapBitmap[OFFSET(e->col + e->width - 1 + e->cdel, e->row, 256)] && collisionmapBitmap[OFFSET(e->col + e->width - 1 + e->cdel, e->row + e->height - 1, 256)]) {
                if (e->cdel == -1) {
                    e->aniState = SPRITELEFT;
                } else {
                    e->aniState = SPRITERIGHT;
                }
                e->col += e->cdel;   
            }
        //If we hit a border, reverse our direction and bounce
        if (e->col <= 0 || e->col + e->width >= 256) {
            e->cdel = -(e->cdel);
        }

        if (e->row == 90) {
            for (int i = 0; i < 4; i++) {
                if (!enemy[i].active) {
                    enemy[i].row = 0 + e->height - 8;
                    enemy[i].col = SCREENWIDTH / 2 - e->width * 2;
                    enemy[i].active = 1;
                    break;
                }
            }
        }
        //Always push down 1 (GRAVITY)
        if (e->row + e->height < 256 && collisionmapBitmap[OFFSET(e->col, e->row + e->height - 1 + 2, 256)] && collisionmapBitmap[OFFSET(e->col + e->width - 1, e->row + e->height - 1 + 2, 256)]) {
            e->row += e->rdel;
        }
        //If fall through center bottom, reset position at the top
        if (e->row + e->height > 250) {
            e->row = 0 + e->height - 8;
            e->col = SCREENWIDTH / 2 - e->width * 2;
        }
        //Collision with Player
        if (collision(e->col, e->row, e->width, e->height,
            player.col, player.row, player.width, player.height)) {
                    e->active = 0;
                    shadowOAM[5 + e->value].attr0 = ATTR0_HIDE;
                    e->cdel = -(e->cdel);
                    player.row = SCREENHEIGHT - player.height - 8;
                    player.col = SCREENWIDTH / 2 - player.width * 2;
                    e->row = 0 + e->height - 8;
                    e->col = SCREENWIDTH / 2 - e->width * 2;
                    for (int i = 0; i < 4; i++) {
                        if (!enemy[i].active) {
                            enemy[i].row = 0 + e->height - 8;
                            enemy[i].col = SCREENWIDTH / 2 - e->width * 2;
                            enemy[i].active = 1;
                            break;
                        }
                    }
                    hit += 1;
        }
        for (int i = 0; i < 1; i++) {
            if (collision(e->col, e->row, e->width, e->height,
                bullet[i].col, bullet[i].row, bullet[i].width, bullet[i].height)) {
                shadowOAM[5 + e->value].attr0 = ATTR0_HIDE;
                shadowOAM[4].attr0 = ATTR0_HIDE;
                bullet[i].active = 0;
                bullet[i].col = 0;
                bullet[i].row = 0;
                e->row = 0 + e->height - 8;
                e->col = SCREENWIDTH / 2 - e->width * 2;
                kills += 1;
            }
        }
        if (e->aniState == SPRITEIDLE) {
			e->curFrame = 0;
			e->aniState = e->prevAniState;
        } else {
            e->aniCounter++;
        }
        //IF Time is frozen make the bomb stop in place and start upright again.
        if (time == 0) {
            e->curFrame = 0;
			e->aniState = e->prevAniState;
        }

    }
}

//draws enemy
void drawEnemy(ENEMY *e) {
    //Right now we just need a square
    if (e->active) {
        shadowOAM[5 + e->value].attr0 = (ROWMASK & (e->row - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5 + e->value].attr1 = (COLMASK & (e->col - hOff)) | ATTR1_SMALL;
        shadowOAM[5 + e->value].attr2 = ATTR2_TILEID(e->aniState * 2, e->curFrame * 2) | ATTR2_PALROW(0);
    }
}