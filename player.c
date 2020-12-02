#include "player.h"
#include "myLib.h"
#include "collisionmap.h"
#include "enemy.h"
#include "bullet.h"
#include "powerUp.h"
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


//initializes player
void initPlayer() {
    player.height = 15;
    player.width = 16;
    player.rdel = 4;
    player.cdel = 2;
    player.jump = 0;
    player.row =  SCREENHEIGHT - player.height - 8;
    player.col = SCREENWIDTH / 2 - player.width * 2;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
	player.aniState = SPRITERIGHT; 
    player.direction = 1;
    player.updir = 1;
}

//All of our player updates
//Theres alot here haha
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

    //MOVE LEFT CHECKS COLLISION MAP
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (cheat == 1 && player.col > 0) {
            player.direction = -1;
            player.col -= player.cdel;
        } else if (player.col > 0 && collisionmapBitmap[OFFSET(player.col - player.cdel, player.row, 256)] && collisionmapBitmap[OFFSET(player.col - player.cdel, player.row + player.height - 1, 256)]) {
            player.col -= player.cdel;
            player.direction = -1;
        }
        if (hOff > 0 && (player.col - hOff) < SCREENWIDTH / 2) {
                hOff--;
            }
            player.aniState = SPRITELEFT;
    }

    //MOVE RIGHT CHECKS COLLISION MAP
    if (BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width < 256) {
        if (cheat == 1 ) {
            player.direction = 1;
            player.col += player.cdel;
        } else  if (collisionmapBitmap[OFFSET(player.col + player.width - 1 + player.cdel, player.row, 256)] && collisionmapBitmap[OFFSET(player.col + player.width - 1 + player.cdel, player.row + player.height - 1, 256)]) {
            player.col += player.cdel;
            player.direction = 1;
        }
        if (hOff < 256 - SCREENWIDTH && (player.col - hOff) > SCREENWIDTH / 2) {
                hOff++;
            }
            player.aniState = SPRITERIGHT;
    }

    //JUMP
    if (BUTTON_HELD(BUTTON_UP)) {
        //Fly infinitely with Cheat
        if (cheat == 1 && player.row > 0 ) {
            player.row -= 1;
            player.updir = -1;
            if (player.direction == -1) {
                player.aniState = SPRITEJUMPL;
            } else {
                player.aniState = SPRITEJUMPR;
            }
            //Limited Jump
        } else if (player.jump <= 64) {
            if (player.row > 0 && collisionmapBitmap[OFFSET(player.col, player.row - player.rdel, 256)] && collisionmapBitmap[OFFSET(player.col + player.width - 1, player.row - player.rdel, 256)]) {
                if (player.direction == -1) {
                    player.aniState = SPRITEJUMPL;
                } else {
                    player.aniState = SPRITEJUMPR;
                }
                player.row -= player.rdel;
                player.jump += 1;
            }
            
        }
        if (vOff > 0 && (player.row - vOff) < SCREENHEIGHT / 2) {
                vOff--;
            }
    }
    //SUPRESSIVE FIRE
    //(Shoot function)
    if (BUTTON_PRESSED(BUTTON_A)) {
	    // Find the first inactive bullet
        for (int i = 0; i < 1; i++) {
            if (!bullet[i].active) {
                bullet[i].row = player.row + bullet[i].height;
                bullet[i].col = player.col + player.width - 7;

                //We cant shoot if time is frozen.
                if (enemy[i].cdel == 0) {
                    break;

                } else {
                    //Sideways only bullet
                    bullet[i].rdel = 0;
                    bullet[i].cdel = player.direction * 2;
                }
                bullet[i].active = 1;
                break;
            }
        }
    }
    //Power up move
    if (BUTTON_PRESSED(BUTTON_B)) {
        //Time moves
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
        //Jikan tomare!
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
                //ALSO MAKE BULLETS FREEZE
                temp2 = bullet[0].cdel;
                temp3 = bullet[0].rdel;
                //I am saving the direction of the bullets so that when I draw them-
                //-they keep the correct direction
                if (temp2 > 0) {
                    bullet[0].direction = 1;
                } else if (temp2 < 0) {
                    bullet[0].direction = -1;

                } else if (temp3 > 0) {
                    bullet[0].direction = 2;
                } else if (temp3 < 0) {
                    bullet[0].direction = -2;
                }
                //Freeze everything
                enemy[i].rdel = 0;
                enemy[i].cdel = 0;
            }
            bullet[0].cdel = 0;
            bullet[0].rdel = 0;
            time = 0;

        }
    }
    if (cheat == 1) {
        //Cheating moves!
        //Downward movement!
            if (BUTTON_HELD(BUTTON_DOWN)){
                player.row += 1;
                player.updir = 1;
            }
            //We can use this to shoot up or down
            if (BUTTON_PRESSED(BUTTON_L)) {
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
    //Activate the Cheat!!!!!!!
    if (BUTTON_PRESSED(BUTTON_R)) {
        if (cheat == 0) {
            cheat = 1; 
        } else {
            cheat = 0;
        }
    }
    //Spriteidle actually isnt a frame, just having it repeat the last action
    if (player.aniState == SPRITEIDLE) {
			player.curFrame = 0;
			player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }


    //If we hit a roof, (i.e. not a white block) max our jump to make us fall
    if (!(collisionmapBitmap[OFFSET(player.col, player.row - player.rdel, 256)] && collisionmapBitmap[OFFSET(player.col + player.width - 1, player.row - player.rdel, 256)])) {
        player.jump = 65;
    }
    //If we are back on the floor, reset our jump meter so we can jump again
    if (!(collisionmapBitmap[OFFSET(player.col, player.row + player.height - 1 + player.rdel, 256)] && collisionmapBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1 + player.rdel, 256)])) {
        player.jump = 0;
        if (player.direction == -1) {
        player.aniState = SPRITELEFT;
        } else {
            player.aniState = SPRITERIGHT;
        }
    }
    //Always push down 1 (GRAVITY)
    if (player.row + player.height < 256 && collisionmapBitmap[OFFSET(player.col, player.row + player.height - 1 + player.rdel, 256)] && collisionmapBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1 + player.rdel, 256)]) {
        if (cheat == 0) {
            if (player. jump >= 64) {
                player.row += 2;
            } else {
                player.row += 2;
            }
        } 
        if (vOff < 256 - SCREENHEIGHT && (player.row - vOff) > SCREENHEIGHT / 2) {
                vOff++;
            }
        
    }
    //If we fall through the floor, reset position at the top
    if (player.row + player.height > 250) {
        player.row = 0 + player.height - 17;
        player.col = SCREENWIDTH / 2 - player.width * 2;
        hit++;
        vOff = 0;
        hOff = 0;
    }

}

//draws player
void drawPlayer() {
    //My construction person
    shadowOAM[0].attr0 = (ROWMASK & (player.row - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & (player.col - hOff)) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 2, player.curFrame * 2)  | ATTR2_PALROW(0) ;
}