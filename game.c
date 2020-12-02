#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "player.h"
#include "collisionmap.h"
#include "spritesheet.h"
#include "enemy.h"
#include "powerUp.h"
#include "bullet.h"
//Variables
int vOff;
int hOff;
//initializes the game
void initGame() {
    //Set up palattes of sprites and hide all of them
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
   	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
   	hideSprites();
	initPlayer();
    initEnemy();
    initPowerUp();
    initBullet();
	buttons = BUTTONS;
    vOff = 60;
    hOff = 0;
}

//Updates game
void updateGame() {
    updatePlayer();
    for (int i = 0; i < 4; i++) {
        updateEnemy(&enemy[i]);
    }
    for (int i = 0; i < 1; i++) {
        updatePowerUp(&powerUp[i]);
    }
    for (int i = 0; i < 1; i++) {
        updateBullet(&bullet[i]);
    }
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
}

//draws game
void drawGame() {
    drawPlayer();
    for (int i = 0; i < 4; i++) {
        drawEnemy(&enemy[i]);
    }
    for (int i = 0; i < 1; i++) {
        drawPowerUp(&powerUp[i]);
    }
    for (int i = 0; i < 1; i++) {
        drawBullet(&bullet[i]);
    }
    waitForVBlank();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    if (vOff % 2 == 0) {
        REG_BG1VOFF = vOff / 2;
    }  
    //empty DMA
    DMANow(3, shadowOAM, OAM, 128 * 4);
}