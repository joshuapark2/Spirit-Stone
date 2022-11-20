#include "gba.h"
#include "print.h"
#include "tilemap.h"
#include "spritesheet.h"
#include "XL_Map.h"
#include "collisionmap.h"
#include "game.h"

/*
! NOTES FOR PROGRESSION OF GAME DEVELOPMENT (FOR MYSELF)
 - HOW TO PLAY GAME:
    - SCREEN STATES and how to play:
        - MENU
            - START = Instruction Screen, SELECT = Game
        - INSTRUCTIONS
            - START = Game
        - GAME
            - START = Pause Screen, SELECT = WIN SCREEN
            - Collision with Blue pixel is easy level and meant to be won <------------------
            - Collision wiht Red pixel is hard and meant to be LOSS <------- (to show that I have both won/loss screens)
        - WIN/LOSS
            - START = go back to Menu
        - BATTLE SCREEN
            - A to go forward/action
            - B to go backwards
            - START = Pause Screen
            - SELECT = Win Screen
        - PAUSE
            - START = Go back to game
            - SELECT = Go to Start

 - FINISHED:
    - MILESTONE 1:
        - Create tilemap and sprites needed
        - Create states to hop between which are the size of the screen to make collision and tilemapping easier
        - Make movement go by tiles instead of individual pixels - careful of how this may work with collisions
        - In-Game State with 2 levels -> Beginner Green and Intermediate Red
        - Created Battle UI with health display and simple option for clicking attack menu and option
        - Fixed a bug where Battle UI wouldn't go to moves screen but was fixed with a timer for a delay between clicks.

 - PRIORITY
    - Finished for this milestone ^^

 - FUTURE PLANNING/Implementations
    - Most Importants:
        - Implement additional options such as 4 different types of moves to use which deal different amount of damage
        - Be able to go back to game after defeating an enemy instead of win screen
        - Implement different rooms for different enemies
    - Others Implementation for future:
        - Later create a town which is XL background (refer to lab09 for implementation)
        - Animation for attacks

 - BUGS
    - Sometimes MODE3 screen changes to green color after going back to menu
    - Going back into game creates a lot of flickering so I decided to allow the player to go back to Win state and main menu for this milestone

Needed Tilemap - FINISHED
 - Green Grass Tile -> Dark Green
 - Snow Tile        -> Icy Blue
 - Town Tile        -> Stone Grey
 - Lava Tile        -> Hot Red
 - Trees Tile       -> Dark Brown
 - Mountain Tiles   -> Dark Brown
Needed Sprites - FINISHED
 - Player                 -> Leaf Green
 - Supporting Characters  -> Plat Blue
 - Enemy 1                -> Light Red
 - Enemy 2                -> Light Purple
 - Later:
    - Attack Animation Sprites
*/

// Starting Method and State Prototypes
void initialize();
void goToStart();
void start(); // Should be able to either go to game or instruction
void goToInstructions();
void instructions(); // Should be able to go to Start or Game
void goToGame();
void game(); // Should be able to go to Pause and Win/Lose
void goToPause();
void pause(); // Should be able to go to Game or Start
void goToWin();
void win(); // Go back to Start
void goToLose();
void lose(); // Go back to Start
void goToFightBeginner();
void fight_Beginner();
void goToFightIntermediate();
void fight_Intermediate();
void goToIntermediateStage();
void intermediate_Stage();
void goToXL_Stage();
void XL_Stage();

// States
enum {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE,
    FIGHTBEGINNER,
    FIGHTINTERMEDIATE,
    INTERMEDIATESTAGE,
    XLSTAGE
};
int state;
// int sbb = 16;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

// Setting up State Machines and Running Game
int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
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
            case FIGHTBEGINNER:
                fight_Beginner();
                break;
            case FIGHTINTERMEDIATE:
                fight_Intermediate();
                break;
            case INTERMEDIATESTAGE:
                intermediate_Stage();
            case XLSTAGE:
                XL_Stage();
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    // XL_BG -> Background 1 with Charblock 1 and Screenblock 16

    // Initialize Tilemap -> Background 0 
    DMANow(3, tilemapTiles, &CHARBLOCK[0], tilemapTilesLen / 2);
    DMANow(3, tilemapPal, PALETTE, tilemapPalLen / 2);
    DMANow(3, tilemapMap, &SCREENBLOCK[15], 1024);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(15) | BG_4BPP | BG_SIZE_SMALL;

    // initialize Tilemap XL Map - Put this in goToGame
    // DMANow(3, XL_MapPal, PALETTE, 256);
    // DMANow(3, XL_MapTiles, &CHARBLOCK[1], XL_MapTilesLen / 2);
    // DMANow(3, XL_MapMap, &SCREENBLOCK[16], XL_MapMapLen / 2);
    // REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(16) | BG_SIZE_TALL | 1;

    // Initialize Sprite Sheet
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    oldButtons = buttons;
    buttons = BUTTONS;

    hideSprites();
    goToStart();
}

void goToStart() {
    hideSprites();
    // 30 tiles wide (240/8) and 20 tiles high (160/8)
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 2;
        }
    }
    // Spirit Stone Text
    shadowOAM[0].attr0 = ((SCREENHEIGHT/2) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[0].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,9);
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    waitForVBlank();
    state = START;
}

void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[0].attr0 = ATTR0_HIDE;
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        shadowOAM[0].attr0 = ATTR0_HIDE;
        init_Game();
        goToGame();        
    }
}

void goToInstructions() {
    hideSprites();
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    fillScreen3(BLACK);
    drawString((240 - (21 * 6)) / 2, 0, "press START to play", WHITE);
    drawString((240 - (21 * 6)) / 2, 10, "Instruction Page", WHITE);
    drawString((240 - (21 * 6)) / 2, 20, "Blue = Beginner Enemy Level", WHITE);
    drawString((240 - (21 * 6)) / 2, 30, "Red = Intermediate Enemy Level", WHITE);
    drawString((240 - (21 * 6)) / 2, 40, "ARROW KEYS for Movement", WHITE);
    drawString((240 - (21 * 6)) / 2, 50, "A/B for traversing Battle UI", WHITE);
    drawString((240 - (21 * 6)) / 2, 60, "Collision for Battle!", WHITE);
    drawString((240 - (21 * 6)) / 2, 70, "Black Square WIP", WHITE);
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        DMANow(3, tilemapTiles, &CHARBLOCK[0], tilemapTilesLen / 2);
        DMANow(3, tilemapPal, PALETTE, tilemapPalLen / 2);
        DMANow(3, tilemapMap, &SCREENBLOCK[15], 1024);
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(15) | BG_4BPP | BG_SIZE_SMALL;

        // Initialize Sprite Sheet
        DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
        DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
        hideSprites();

        init_Game();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        DMANow(3, tilemapTiles, &CHARBLOCK[0], tilemapTilesLen / 2);
        DMANow(3, tilemapPal, PALETTE, tilemapPalLen / 2);
        DMANow(3, tilemapMap, &SCREENBLOCK[15], 1024);
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(15) | BG_4BPP | BG_SIZE_SMALL;

        // Initialize Sprite Sheet
        DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
        DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
        hideSprites();
        goToStart();
    }
}

void goToGame() {
    waitForVBlank();
    state = GAME;
}

void game() {
    update_Game();
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }
    if (game_Stage == 1) {
        goToFightBeginner();
    } else if (game_Stage == 2) {
        goToFightIntermediate();
    } 
    else if (game_Stage == 3) {
        goToIntermediateStage();
    } else if (game_Stage == 5) {
        goToXL_Stage();
    }
}

void goToFightBeginner() {
    hideSprites();
    init_BG_Beginner_Fight();
    waitForVBlank();
    fighting = 1; // fighting = True
    state = FIGHTBEGINNER;
}

void fight_Beginner() {
    update_Fight();
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }
    if (player_Health <= 0) {
        goToLose();
    }
    if (beginner_Enemy_Health <= 0) {
        enemies_Left -= 1;
        hideSprites();
        return_To_Game();
        init_BG();
        goToGame();
    }
}

void goToIntermediateStage() {
    hideSprites();
    init_BG_Intermediate_Stage();
    init_Intermediate_Characters();
    waitForVBlank();    
    state = INTERMEDIATESTAGE;
}

void intermediate_Stage() {
    update_Game();
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }
    if (game_Stage == 2) {
        goToFightIntermediate();
    }
}

void goToFightIntermediate() {
    hideSprites();
    init_BG_Intermediate_Fight();
    waitForVBlank();
    fighting = 1;
    state = FIGHTINTERMEDIATE;
}

void fight_Intermediate() {
    update_Fight();
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }
    if (player_Health <= 0) {
        goToLose();
    }
    if (intermediate_Enemy_Health <= 0) {
        enemies_Left -= 1;
        hideSprites();
        return_To_Game();
        init_BG_Intermediate_Stage();
        goToGame();
    }
}

void goToXL_Stage() {
    hideSprites();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, XL_MapPal, PALETTE, 256);
    DMANow(3, XL_MapTiles, &CHARBLOCK[1], XL_MapTilesLen / 2);
    DMANow(3, XL_MapMap, &SCREENBLOCK[16], XL_MapMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(16) | BG_SIZE_TALL | 1;

    init_XL_Characters();
    waitForVBlank();
    state = XLSTAGE;
}

void XL_Stage() {
    update_Game();
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }
}

void goToPause() {
    // Pause Text
    shadowOAM[1].attr0 = ((SCREENHEIGHT/2) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,8);
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    waitForVBlank();
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START) && game_Stage == 0) {
        shadowOAM[1].attr0 = ATTR0_HIDE;
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_START) && game_Stage == 1) {
        shadowOAM[1].attr0 = ATTR0_HIDE;
        goToFightBeginner();
    } else if (BUTTON_PRESSED(BUTTON_START) && game_Stage == 2) {
        goToFightIntermediate();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    hideSprites();
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 4;
        }
    }
    shadowOAM[2].attr0 = ((SCREENHEIGHT/2) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[2].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_SMALL;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,6);
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    waitForVBlank();
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[2].attr0 = ATTR0_HIDE;
        goToStart();
    }
}

void goToWin() {
    hideSprites();
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 5;
        }
    }
    shadowOAM[3].attr0 = ((SCREENHEIGHT/2) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[3].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_SMALL;
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,5);
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    waitForVBlank();
    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[3].attr0 = ATTR0_HIDE;
        goToStart();
    }
}