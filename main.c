/*
* I have all of my info in my readme, I feel like a huge block here would be a lot to read.
* Cullen Bertram
* Submitted 12/2/2020
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "menuScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "gamescreen.h"
#include "pauseScreen.h"
#include "instructionScreen.h"
#include "game.h"
#include "player.h"
#include "collisionmap.h"
#include "spritesheet.h"
#include "gameSong.h"
#include "sound.h"
#include "jumpSound.h"
#include "testScreen.h"
#include "fixScreen.h"
// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void inst();
void goToInstructions();

//Hit Counter
int hit;
int kills;
int time;
// States
enum
{
    START,
    GAME,
    INST,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

//Sound

SOUND soundA;
SOUND soundB;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case INST:
            inst();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(24);

    buttons = BUTTONS;
    oldButtons = 0;
    hit = 0;
    kills = 0;
    time = -1;
    setupSounds();
	setupInterrupts();
    goToStart();
}

// Sets up the start state
//DMA the start palette as well
void goToStart() {
    REG_BG0VOFF = 0;
    DMANow(3, menuScreenPal, PALETTE, menuScreenPalLen/2);
    DMANow(3, menuScreenTiles, &CHARBLOCK[0], menuScreenTilesLen / 2);
    DMANow(3, menuScreenMap, &SCREENBLOCK[28], menuScreenMapLen / 2);
    DMANow(3, fixScreenTiles, &CHARBLOCK[1], fixScreenTilesLen / 2);
    DMANow(3, fixScreenMap, &SCREENBLOCK[24], fixScreenMapLen / 2);
    stopSound();
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        stopSound();
		playSoundA(gameSong_data, gameSong_length, 1);

        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
}

//Sets up the instructions state
void goToInstructions() {
    REG_BG0VOFF = 0;
    DMANow(3, instructionScreenPal, PALETTE, instructionScreenPalLen/2);
    DMANow(3, instructionScreenTiles, &CHARBLOCK[0], instructionScreenTilesLen / 2);
    DMANow(3, instructionScreenMap, &SCREENBLOCK[28], instructionScreenMapLen / 2);
    state = INST;
}

void inst() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
		playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        initialize();
    }
}
// Sets up the game state
//DMA the palette bg we need for the game
void goToGame() {
    DMANow(3, testScreenPal, PALETTE, testScreenPalLen / 2);
    DMANow(3, testScreenTiles, &CHARBLOCK[1], testScreenTilesLen / 2);
    DMANow(3, testScreenMap, &SCREENBLOCK[24], testScreenMapLen / 2);
    DMANow(3, gamescreenTiles, &CHARBLOCK[0], gamescreenTilesLen / 2);
    DMANow(3, gamescreenMap, &SCREENBLOCK[28], gamescreenMapLen / 2);
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
    if (hit == 3) {
        goToLose();
    }
    if (kills == 5) {
        goToWin();
    }
}

// Sets up the pause state
void goToPause() {
    REG_BG0VOFF = 0;
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, pauseScreenPal, PALETTE, pauseScreenPalLen/2);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/2);
    DMANow(3, fixScreenTiles, &CHARBLOCK[1], fixScreenTilesLen / 2);
    DMANow(3, fixScreenMap, &SCREENBLOCK[24], fixScreenMapLen / 2);
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        unpauseSound();
        goToGame();
    } 
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}

// Sets up the win state
//We need to reset the offset so we stay center screen
//Hide sprites and call shadowOAM to store them
void goToWin() {
    REG_BG0VOFF = 0;
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, winScreenPal, PALETTE, winScreenPalLen/2);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/2);
    DMANow(3, fixScreenTiles, &CHARBLOCK[1], fixScreenTilesLen / 2);
    DMANow(3, fixScreenMap, &SCREENBLOCK[24], fixScreenMapLen / 2);
    stopSound();
    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    } 
}

// Sets up the lose state
//We need to reset the offset so we stay center screen
//Hide sprites and call shadowOAM to store them
void goToLose() {
    REG_BG0VOFF = 0;
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, loseScreenPal, PALETTE, loseScreenPalLen/2);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen/2);
    DMANow(3, fixScreenTiles, &CHARBLOCK[1], fixScreenTilesLen / 2);
    DMANow(3, fixScreenMap, &SCREENBLOCK[24], fixScreenMapLen / 2);
    stopSound();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    } 
}