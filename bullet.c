#include <stdlib.h>
#include <stdio.h>
#include "bullet.h"
#include "myLib.h"
#include "collisionmap.h"
#include "game.h"
#include "enemy.h"
#include "player.h"
BULLET bullet[1];
int kills;
int cheat;
int hOff;
int vOff;
//initializes bullet
void initBullet() {
    for (int i = 0; i < 1; i++) {
        bullet[i].height = 7;
        bullet[i].width = 7;
        bullet[i].cdel = 2;
        bullet[i].rdel = 0;
        bullet[i].row = 0;
        bullet[i].col = 0;
        bullet[i].active = 0;
    }

}

//Updates bullet to keep moving in direction we want
void updateBullet(BULLET *b) {
    if (b->active) {
        b->col += b->cdel;
        b->row += b->rdel;
        //Left boundary
        if (b->col <= 0) {
            shadowOAM[4].attr0 = ATTR0_HIDE;
            b->active = 0;
        }
        //right boundary
        if (b->col + b->width >= 256) {
            shadowOAM[4].attr0 = ATTR0_HIDE;
            b->active = 0;
        }
        //Top Boundary
        if (b->row <= 0) {
            shadowOAM[4].attr0 = ATTR0_HIDE;
            b->active = 0;
        }
        //Bottom Boundary
        if (b->row >= 250) {
            shadowOAM[4].attr0 = ATTR0_HIDE;
            b->active = 0;
        }
    }
}

//Draws Bullet
void drawBullet(BULLET *b) {
    if (b->active) {
        shadowOAM[4].attr0 = (ROWMASK & (b->row - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = (COLMASK & (b->col - hOff)) | ATTR1_TINY;
        //Bullet can go four directions and we check to make sure we are drawing the bullet in the correct direction
        //Down
        if (b->rdel > 0) {
            shadowOAM[4].attr2 = ATTR2_TILEID(12, 6) | ATTR2_PALROW(0);
        //Up
        } else if (b->rdel < 0) {
            shadowOAM[4].attr2 = ATTR2_TILEID(12, 4) | ATTR2_PALROW(0);

        //Right    
        //When time freezes I needed a way to store the direction of the bullet when it was fired, so I made-
        //this variable (direction) to help me keep track of the correct direction i need to draw it in
        } else if (b->cdel >= 0) {
            if (b->direction == 2) {
                shadowOAM[4].attr2 = ATTR2_TILEID(12, 6) | ATTR2_PALROW(0);
            } else if (b->direction == -2) {
                shadowOAM[4].attr2 = ATTR2_TILEID(12, 4) | ATTR2_PALROW(0);
            } else if (b-> direction == -1) {
                shadowOAM[4].attr2 = ATTR2_TILEID(14, 2) | ATTR2_PALROW(0);


            } else {
                shadowOAM[4].attr2 = ATTR2_TILEID(12, 2) | ATTR2_PALROW(0);
               
            }
        //Left
        } else if (b->cdel < 0) {
            shadowOAM[4].attr2 = ATTR2_TILEID(14, 2) | ATTR2_PALROW(0);
        }
    }
}