#include "game.h"
#include "gba.h"

OBJ_ATTR shadowOAM[128];
CHARACTER player;
CHARACTER beginner_Enemy;
CHARACTER intermediate_Enemy;
DOOR next_Level_Door;

void update_Game() {
    update_Player();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
}

void update_Fight() {
    update_Battle_Controls();
    update_Player_Health();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
}

void init_Game() {
    init_BG();
    init_Characters();

    /*
        0 = beginner stage
        1 = fighting beginner enemy
        2 = fighting intermediate enemy
        3 = intermediate stage
        4 = intermediate stage after fight
    */
    game_Stage = 0;
    door_State = 0;
    player_Health = 100;
    beginner_Enemy_Health = 50;
    intermediate_Enemy_Health = 100;
    enemies_Left = 2;
    /*
    0 = Front "ATTACK" Page
    1 = Options to attack
    */
    battle_UI = -1;

    // 0 = False, 1 = True
    fighting = 0;
}

// i = wide/column, j = tall/row
void init_BG() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 3;
        }
    }
}

void init_BG_Intermediate_Stage() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 2;
        }
    }    
}

// i = wide/column, j = tall/row
void init_BG_Beginner_Fight() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            if (j <= 12) {
                SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 1;
            } else {
                SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 7;
            }
        }
    }

    player.row = 6*8;
    player.col = 7*8;

    // PLAYER GREEN
    shadowOAM[5].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[5].attr1 = (player.col & COLMASK) | ATTR1_TINY;
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);

    // BEGINNER ENEMY
    shadowOAM[6].attr0 = (intermediate_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[6].attr1 = (intermediate_Enemy.col & COLMASK) | ATTR1_TINY;
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 1);

    // ATTACK OPTION
    shadowOAM[8].attr0 = ((SCREENHEIGHT/2 + 35) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[8].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_LARGE;
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 9);

    // ARROW OPTION
    shadowOAM[9].attr0 = (126 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[9].attr1 = (73 & COLMASK) | ATTR1_TINY;
    shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 13);
}

void init_BG_Intermediate_Fight() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            if (j <= 12) {
                SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 2;
            } else {
                SCREENBLOCK[15].tilemap[OFFSET(i, j, 32)] = 7;
            }
        }
    }

    player.row = 6*8;
    player.col = 7*8;

    intermediate_Enemy.row = 6*8;
    intermediate_Enemy.col = 24*8;

    // PLAYER GREEN
    shadowOAM[5].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[5].attr1 = (player.col & COLMASK) | ATTR1_TINY;
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);

    // Intermediate ENEMY
    shadowOAM[6].attr0 = (intermediate_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[6].attr1 = (intermediate_Enemy.col & COLMASK) | ATTR1_TINY;
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 2);

    // ATTACK OPTION
    shadowOAM[8].attr0 = ((SCREENHEIGHT/2 + 35) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[8].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_LARGE;
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 9);

    // ARROW OPTION
    shadowOAM[9].attr0 = (126 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[9].attr1 = (73 & COLMASK) | ATTR1_TINY;
    shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 13);
}



void init_Characters() {
    /*
    ROW Coordinates:
        19 gives us last row available in-game
        
    COLUMN Coordinates
    */
    player.row = 18; // 19 gives us the last row
    player.col = 14; // 14 gives us the middle
    player.rdel = 1;
    player.cdel = 1;

    // Sizing and animation
    player.width = 8;
    player.height = 8;
    player.aniCounter = 0;
    player.aniState = 0;
    player.curFrame = 0;
    player.numFrames = 3;

    beginner_Enemy.row = 6*8; // 48/8 = 6
    beginner_Enemy.col = 14*8;
    beginner_Enemy.rdel = 1;
    beginner_Enemy.cdel = 1;
    beginner_Enemy.width = 8;
    beginner_Enemy.height = 8;
    beginner_Enemy.aniCounter = 0;
    beginner_Enemy.aniState = 0;
    beginner_Enemy.curFrame = 0;
    beginner_Enemy.numFrames = 3;
    
    intermediate_Enemy.row = 6*8;
    intermediate_Enemy.col = 24*8; // 192/8 = 24
    intermediate_Enemy.rdel = 1;
    intermediate_Enemy.cdel = 1;
    intermediate_Enemy.width = 8;
    intermediate_Enemy.height = 8;
    intermediate_Enemy.aniCounter = 0;
    intermediate_Enemy.aniState = 0;
    intermediate_Enemy.curFrame = 0;
    intermediate_Enemy.numFrames = 3;

    next_Level_Door.row = 2*8;
    next_Level_Door.col = 14*8;
    next_Level_Door.width = 8;
    next_Level_Door.height = 8;

    shadowOAM[5].attr0 = (beginner_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[5].attr1 = (beginner_Enemy.col & COLMASK) | ATTR1_TINY;
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 1);

    // shadowOAM[6].attr0 = (intermediate_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    // shadowOAM[6].attr1 = (intermediate_Enemy.col & COLMASK) | ATTR1_TINY;
    // shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 2);

    shadowOAM[7].attr0 = (next_Level_Door.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[7].attr1 = (next_Level_Door.col & COLMASK) | ATTR1_TINY;
    shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 3);
}

void init_Intermediate_Characters() {
    player.row = 18; // 19 gives us the last row
    player.col = 14; // 14 gives us the middle    
    
    intermediate_Enemy.row = 6*8;
    intermediate_Enemy.col = 14*8;   



    shadowOAM[6].attr0 = (intermediate_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[6].attr1 = (intermediate_Enemy.col & COLMASK) | ATTR1_TINY;
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 2);

    shadowOAM[7].attr0 = (next_Level_Door.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[7].attr1 = (next_Level_Door.col & COLMASK) | ATTR1_TINY;
    shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 3);
}

void init_XL_Characters() {
    player.row = 18; // 19 gives us the last row
    player.col = 14; // 14 gives us the middle    
}

void update_Player() {
    // Movement
    if (BUTTON_PRESSED(BUTTON_UP) && player.row > 1) {
        player.row -= 1;
    } else if (BUTTON_PRESSED(BUTTON_DOWN) && player.row + 1 < 20) {
        player.row += 1;
    } else if (BUTTON_PRESSED(BUTTON_LEFT)  && player.col > 0) {
        player.col -= 1;
    } else if (BUTTON_PRESSED(BUTTON_RIGHT) && player.col + 1 < 30) {
        player.col += 1;
    }

    if (game_Stage == 0) {
     // Player x Beginner Enemy Collision
        if (collision(player.col*8, player.row*8, player.width, player.height, beginner_Enemy.col, beginner_Enemy.row, beginner_Enemy.width, beginner_Enemy.height)) {
            hideSprites();
            battle_UI = 0;
            game_Stage = 1;
        }       
    } else if (game_Stage == 3) {
        // Player x Intermediate Enemy Collision
        if (collision(player.col*8, player.row*8, player.width, player.height, intermediate_Enemy.col, intermediate_Enemy.row, intermediate_Enemy.width, intermediate_Enemy.height)) {
            battle_UI = 0;
            game_Stage = 2;
        }    
    }

    if (door_State == 1) {
        // Player x Door Collision
        if (collision(player.col*8, player.row*8, player.width, player.height, next_Level_Door.col, next_Level_Door.row, next_Level_Door.width, next_Level_Door.height)) {
            game_Stage = 3;
        }
    } else if (door_State == 1 && game_Stage == 4) {
        if (collision(player.col*8, player.row*8, player.width, player.height, next_Level_Door.col, next_Level_Door.row, next_Level_Door.width, next_Level_Door.height)) {
            game_Stage = 5;
        }   
    } else if (door_State == 1 && game_Stage == 5) {
        if (collision(player.col*8, player.row*8, player.width, player.height, next_Level_Door.col, next_Level_Door.row, next_Level_Door.width, next_Level_Door.height)) {
            game_Stage = 6;
        }          
    }


    // Player Sprite
    shadowOAM[4].attr0 = (player.row*8 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[4].attr1 = (player.col*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
}

void update_Battle_Controls() {
    if (battle_UI == 0) {
        // Pointer Movement x Pressing A and B
        if (time >= 5) {
            if (BUTTON_PRESSED(BUTTON_A)) {
                battle_UI = 1;
                time = 0;
            }
        }
        // ATTACK OPTION
        shadowOAM[8].attr0 = ((SCREENHEIGHT/2 + 35) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[8].attr1 = (((SCREENWIDTH/2) - 35) & COLMASK) | ATTR1_LARGE;
        shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 9);

        // ARROW OPTION
        shadowOAM[9].attr0 = (126 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[9].attr1 = (73 & COLMASK) | ATTR1_TINY;
        shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 13);
    }
    if (battle_UI == 1) {
        // Pointer Movement x Pressing A and B
        if (time >= 5) {
            if (BUTTON_PRESSED(BUTTON_A)) {
                if (game_Stage == 1) {
                    player_Health -= 5;
                    beginner_Enemy_Health -= 30;
                    battle_UI = 0;
                    time = 0;
                } else if (game_Stage == 2) {
                    player_Health -= 10;
                    intermediate_Enemy_Health -= 50;
                    battle_UI = 0;
                    time = 0;
                }
            } else if (BUTTON_PRESSED(BUTTON_B)) {
                battle_UI = 0;
                time = 0;
            }
        }

        // ARROW OPTION
        shadowOAM[9].attr0 = (126 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[9].attr1 = (73 & COLMASK) | ATTR1_TINY;
        shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 13);

        // PUNCH OPTION
        shadowOAM[8].attr0 = (126 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[8].attr1 = (100 & COLMASK) | ATTR1_SMALL;
        shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);   
    }
    time++;
}

void update_Player_Health() {
    // Player Health
    player_Hundred = player_Health/100;
    player_Ten = (player_Health % 100)/10;
    player_One = ((player_Health % 100) % 10); 
    // Enemy Health
    if (game_Stage == 1) {
        enemy_Hundred = beginner_Enemy_Health/100;
        enemy_Ten = (beginner_Enemy_Health % 100)/10;
        enemy_One = ((beginner_Enemy_Health % 100) % 10); 
    } else if (game_Stage == 2) {
        enemy_Hundred = intermediate_Enemy_Health/100;
        enemy_Ten = (intermediate_Enemy_Health % 100)/10;
        enemy_One = ((intermediate_Enemy_Health % 100) % 10); 
    }

    // Score Sprites
    shadowOAM[10].attr0 = (0 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[10].attr1 = (0*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player_Hundred, 29);
    shadowOAM[11].attr0 = (0 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[11].attr1 = (1*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player_Ten, 29);
    shadowOAM[13].attr0 = (0 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[13].attr1 = (2*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player_One, 29);

    // Score Spritesx
    shadowOAM[14].attr0 = (0 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[14].attr1 = (26*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy_Hundred, 29);
    shadowOAM[15].attr0 = (0 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[15].attr1 = (27*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy_Ten, 29);
    shadowOAM[16].attr0 = (0 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[16].attr1 = (28*8 & COLMASK) | ATTR1_TINY;
    shadowOAM[16].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy_One, 29);
}

void return_To_Game() {
    if (game_Stage == 1) {
        fighting = 0;
        battle_UI = -1;
        game_Stage = 0;
        door_State = 1;

        player.row = 6;
        player.col = 14;
        player.rdel = 1;
        player.cdel = 1;

        beginner_Enemy.row = 0;
        beginner_Enemy.col = 0;

        next_Level_Door.row = 2*8;
        next_Level_Door.col = 14*8;

        shadowOAM[6].attr0 = ATTR0_HIDE;
        for (int i = 8; i <= 16; i++) {
            shadowOAM[i].attr0 = ATTR0_HIDE;
        }
    }

    if (game_Stage == 2) {
        fighting = 0;
        battle_UI = -1;
        game_Stage = 4;
        door_State = 1;    

        player.row = 6;
        player.col = 14;
        player.rdel = 1;
        player.cdel = 1; 

        intermediate_Enemy.row = 0;
        intermediate_Enemy.col = 0;

        next_Level_Door.row = 2*8;
        next_Level_Door.col = 14*8;

        shadowOAM[6].attr0 = ATTR0_HIDE;
        for (int i = 8; i <= 16; i++) {
            shadowOAM[i].attr0 = ATTR0_HIDE;
        }   
    }
    
    // intermediate_Enemy.row = 48;
    // intermediate_Enemy.col = 192;

    // shadowOAM[5].attr0 = (beginner_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    // shadowOAM[5].attr1 = (beginner_Enemy.col & COLMASK) | ATTR1_TINY;
    // shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 1);

    // shadowOAM[6].attr0 = (intermediate_Enemy.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    // shadowOAM[6].attr1 = (intermediate_Enemy.col & COLMASK) | ATTR1_TINY;
    // shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 2);

    shadowOAM[7].attr0 = (next_Level_Door.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[7].attr1 = (next_Level_Door.col & COLMASK) | ATTR1_TINY;
    shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 3);
}