#include <stdlib.h>
#include <stdio.h>
#include "powerUp.h"
#include "myLib.h"
#include "collisionmap.h"
#include "game.h"
#include "player.h"
#include "sound.h"
#include "jumpSound.h"
//Sounds
SOUND soundA;
SOUND soundB;

//Power Up Pool
POWERUP powerUp[1];
//Variables
int time = -1;
int hOff;
int vOff;
//initializes powerUp
void initPowerUp() {
    for (int i = 0; i < 1; i++) {
        powerUp[i].height = 7;
        powerUp[i].width = 7;
        powerUp[i].spawn = 1;
        powerUp[i].row = SCREENHEIGHT / 2 + 3;
        powerUp[i].col = SCREENWIDTH / 2;
        powerUp[i].active = 1;
        powerUp[i].power = 0;
    }

}
//Updates Powerup
void updatePowerUp(POWERUP *p) {
    if (p->active) {
        //If collides with player
        if (collision(p->col, p->row, p->width, p->height,
            player.col, player.row, player.width, player.height)) {
                //STUFF ONLY HAPPENS IF YOU HAVE NO PICKED UP A POWER UP!
                if (time < 0) {
                    //Starts in first spawn spot
                    if (p->spawn == 1) {
                        p->spawn = 0;
                        p->row = 140;
                        p->col = SCREENWIDTH / 2;
                        playSoundB(jumpSound_data, jumpSound_length, 0);

                    } else {
                    //Second Spawn spot it moves to when picked up.
                        p->spawn = 1;
                        p->row = SCREENHEIGHT / 2 + 3;
                        p->col = SCREENWIDTH / 2;
                        playSoundB(jumpSound_data, jumpSound_length, 0);
                    }
                    if (p->power == 0) {
                        time = 1;
                }
                }
        }
    }
}

//Draws PowerUp
//its a hat :D
void drawPowerUp(POWERUP *p) {
    if (p->active) {
        shadowOAM[2].attr0 = (ROWMASK & (p->row - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & (p->col - hOff)) | ATTR1_TINY;
        shadowOAM[2].attr2 = ATTR2_TILEID(12, 0) | ATTR2_PALROW(0);
    }
}