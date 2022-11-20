# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
# 9 "game.h"
extern int hOff;
extern int vOff;

int game_Stage;
int player_Health;
int beginner_Enemy_Health;
int intermediate_Enemy_Health;
int enemies_Left;
int fighting;
int battle_UI;
int time;
int battle_Sprite_Swap;
int player_Hundred;
int player_Ten;
int player_One;
int enemy_Hundred;
int enemy_Ten;
int enemy_One;
int door_State;


void init_Game();
void init_BG();
void init_Characters();
void init_Beginner_Enemy();
void init_Intermediate_Enemy();
void init_Beginner_Fight();
void init_BG_Beginner_Fight();
void init_BG_Intermediate_Fight();

void update_Game();

void update_Fight();
void update_Player();
void update_Battle_Controls();
void update_Player_Health();
void return_To_Game();
void drawString();


typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
} CHARACTER;

typedef struct {
    int row;
    int col;
    int width;
    int height;
} DOOR;
# 2 "game.c" 2
# 1 "gba.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 41 "gba.h"
extern volatile unsigned short *videoBuffer;
# 66 "gba.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);
void waitForVBlank();





void flipPage();
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 118 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;
# 147 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 158 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 198 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 255 "gba.h"
void hideSprites();






typedef struct {
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
# 311 "gba.h"
typedef void (*ihp)(void);
# 3 "game.c" 2

OBJ_ATTR shadowOAM[128];
CHARACTER player;
CHARACTER beginner_Enemy;
CHARACTER intermediate_Enemy;
DOOR next_Level_Door;

void update_Game() {
    update_Player();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
}

void update_Fight() {
    update_Battle_Controls();
    update_Player_Health();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
}

void init_Game() {
    init_BG();
    init_Characters();
# 36 "game.c"
    game_Stage = 0;
    door_State = 0;
    player_Health = 100;
    beginner_Enemy_Health = 50;
    intermediate_Enemy_Health = 100;
    enemies_Left = 2;




    battle_UI = -1;


    fighting = 0;
}


void init_BG() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 3;
        }
    }
}

void init_BG_Intermediate_Stage() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 2;
        }
    }
}


void init_BG_Beginner_Fight() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            if (j <= 12) {
                ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 1;
            } else {
                ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 7;
            }
        }
    }

    player.row = 6*8;
    player.col = 7*8;


    shadowOAM[5].attr0 = (player.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[5].attr1 = (player.col & 0x1FF) | (0 << 14);
    shadowOAM[5].attr2 = ((0)<<12) | ((0)*32+(0));


    shadowOAM[6].attr0 = (intermediate_Enemy.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[6].attr1 = (intermediate_Enemy.col & 0x1FF) | (0 << 14);
    shadowOAM[6].attr2 = ((0)<<12) | ((1)*32+(0));


    shadowOAM[8].attr0 = ((160/2 + 35) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[8].attr1 = (((240/2) - 35) & 0x1FF) | (3 << 14);
    shadowOAM[8].attr2 = ((0)<<12) | ((9)*32+(0));


    shadowOAM[9].attr0 = (126 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[9].attr1 = (73 & 0x1FF) | (0 << 14);
    shadowOAM[9].attr2 = ((0)<<12) | ((13)*32+(0));
}

void init_BG_Intermediate_Fight() {
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            if (j <= 12) {
                ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 2;
            } else {
                ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 7;
            }
        }
    }

    player.row = 6*8;
    player.col = 7*8;

    intermediate_Enemy.row = 6*8;
    intermediate_Enemy.col = 24*8;


    shadowOAM[5].attr0 = (player.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[5].attr1 = (player.col & 0x1FF) | (0 << 14);
    shadowOAM[5].attr2 = ((0)<<12) | ((0)*32+(0));


    shadowOAM[6].attr0 = (intermediate_Enemy.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[6].attr1 = (intermediate_Enemy.col & 0x1FF) | (0 << 14);
    shadowOAM[6].attr2 = ((0)<<12) | ((2)*32+(0));


    shadowOAM[8].attr0 = ((160/2 + 35) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[8].attr1 = (((240/2) - 35) & 0x1FF) | (3 << 14);
    shadowOAM[8].attr2 = ((0)<<12) | ((9)*32+(0));


    shadowOAM[9].attr0 = (126 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[9].attr1 = (73 & 0x1FF) | (0 << 14);
    shadowOAM[9].attr2 = ((0)<<12) | ((13)*32+(0));
}



void init_Characters() {






    player.row = 18;
    player.col = 14;
    player.rdel = 1;
    player.cdel = 1;


    player.width = 8;
    player.height = 8;
    player.aniCounter = 0;
    player.aniState = 0;
    player.curFrame = 0;
    player.numFrames = 3;

    beginner_Enemy.row = 6*8;
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
    intermediate_Enemy.col = 24*8;
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

    shadowOAM[5].attr0 = (beginner_Enemy.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[5].attr1 = (beginner_Enemy.col & 0x1FF) | (0 << 14);
    shadowOAM[5].attr2 = ((0)<<12) | ((1)*32+(0));





    shadowOAM[7].attr0 = (next_Level_Door.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[7].attr1 = (next_Level_Door.col & 0x1FF) | (0 << 14);
    shadowOAM[7].attr2 = ((0)<<12) | ((3)*32+(0));
}

void init_Intermediate_Characters() {
    player.row = 18;
    player.col = 14;

    intermediate_Enemy.row = 6*8;
    intermediate_Enemy.col = 14*8;



    shadowOAM[6].attr0 = (intermediate_Enemy.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[6].attr1 = (intermediate_Enemy.col & 0x1FF) | (0 << 14);
    shadowOAM[6].attr2 = ((0)<<12) | ((2)*32+(0));

    shadowOAM[7].attr0 = (next_Level_Door.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[7].attr1 = (next_Level_Door.col & 0x1FF) | (0 << 14);
    shadowOAM[7].attr2 = ((0)<<12) | ((3)*32+(0));
}

void init_XL_Characters() {
    player.row = 18;
    player.col = 14;
}

void update_Player() {

    if ((!(~(oldButtons) & ((1<<6))) && (~buttons & ((1<<6)))) && player.row > 1) {
        player.row -= 1;
    } else if ((!(~(oldButtons) & ((1<<7))) && (~buttons & ((1<<7)))) && player.row + 1 < 20) {
        player.row += 1;
    } else if ((!(~(oldButtons) & ((1<<5))) && (~buttons & ((1<<5)))) && player.col > 0) {
        player.col -= 1;
    } else if ((!(~(oldButtons) & ((1<<4))) && (~buttons & ((1<<4)))) && player.col + 1 < 30) {
        player.col += 1;
    }

    if (game_Stage == 0) {

        if (collision(player.col*8, player.row*8, player.width, player.height, beginner_Enemy.col, beginner_Enemy.row, beginner_Enemy.width, beginner_Enemy.height)) {
            hideSprites();
            battle_UI = 0;
            game_Stage = 1;
        }
    } else if (game_Stage == 3) {

        if (collision(player.col*8, player.row*8, player.width, player.height, intermediate_Enemy.col, intermediate_Enemy.row, intermediate_Enemy.width, intermediate_Enemy.height)) {
            battle_UI = 0;
            game_Stage = 2;
        }
    }

    if (door_State == 1) {

        if (collision(player.col*8, player.row*8, player.width, player.height, next_Level_Door.col, next_Level_Door.row, next_Level_Door.width, next_Level_Door.height)) {
            game_Stage = 3;
        }
    } else if (door_State == 1 && game_Stage == 4) {
        if (collision(player.col*8, player.row*8, player.width, player.height, next_Level_Door.col, next_Level_Door.row, next_Level_Door.width, next_Level_Door.height)) {
            game_Stage = 5;
        }
    }



    shadowOAM[4].attr0 = (player.row*8 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[4].attr1 = (player.col*8 & 0x1FF) | (0 << 14);
    shadowOAM[4].attr2 = ((0)<<12) | ((0)*32+(0));
}

void update_Battle_Controls() {
    if (battle_UI == 0) {

        if (time >= 5) {
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                battle_UI = 1;
                time = 0;
            }
        }

        shadowOAM[8].attr0 = ((160/2 + 35) & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[8].attr1 = (((240/2) - 35) & 0x1FF) | (3 << 14);
        shadowOAM[8].attr2 = ((0)<<12) | ((9)*32+(0));


        shadowOAM[9].attr0 = (126 & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[9].attr1 = (73 & 0x1FF) | (0 << 14);
        shadowOAM[9].attr2 = ((0)<<12) | ((13)*32+(0));
    }
    if (battle_UI == 1) {

        if (time >= 5) {
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
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
            } else if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
                battle_UI = 0;
                time = 0;
            }
        }


        shadowOAM[9].attr0 = (126 & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[9].attr1 = (73 & 0x1FF) | (0 << 14);
        shadowOAM[9].attr2 = ((0)<<12) | ((13)*32+(0));


        shadowOAM[8].attr0 = (126 & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[8].attr1 = (100 & 0x1FF) | (1 << 14);
        shadowOAM[8].attr2 = ((0)<<12) | ((14)*32+(0));
    }
    time++;
}

void update_Player_Health() {

    player_Hundred = player_Health/100;
    player_Ten = (player_Health % 100)/10;
    player_One = ((player_Health % 100) % 10);

    if (game_Stage == 1) {
        enemy_Hundred = beginner_Enemy_Health/100;
        enemy_Ten = (beginner_Enemy_Health % 100)/10;
        enemy_One = ((beginner_Enemy_Health % 100) % 10);
    } else if (game_Stage == 2) {
        enemy_Hundred = intermediate_Enemy_Health/100;
        enemy_Ten = (intermediate_Enemy_Health % 100)/10;
        enemy_One = ((intermediate_Enemy_Health % 100) % 10);
    }


    shadowOAM[10].attr0 = (0 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[10].attr1 = (0*8 & 0x1FF) | (0 << 14);
    shadowOAM[10].attr2 = ((0)<<12) | ((29)*32+(player_Hundred));
    shadowOAM[11].attr0 = (0 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[11].attr1 = (1*8 & 0x1FF) | (0 << 14);
    shadowOAM[11].attr2 = ((0)<<12) | ((29)*32+(player_Ten));
    shadowOAM[13].attr0 = (0 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[13].attr1 = (2*8 & 0x1FF) | (0 << 14);
    shadowOAM[13].attr2 = ((0)<<12) | ((29)*32+(player_One));


    shadowOAM[14].attr0 = (0 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[14].attr1 = (26*8 & 0x1FF) | (0 << 14);
    shadowOAM[14].attr2 = ((0)<<12) | ((29)*32+(enemy_Hundred));
    shadowOAM[15].attr0 = (0 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[15].attr1 = (27*8 & 0x1FF) | (0 << 14);
    shadowOAM[15].attr2 = ((0)<<12) | ((29)*32+(enemy_Ten));
    shadowOAM[16].attr0 = (0 & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[16].attr1 = (28*8 & 0x1FF) | (0 << 14);
    shadowOAM[16].attr2 = ((0)<<12) | ((29)*32+(enemy_One));
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

        shadowOAM[6].attr0 = (2 << 8);
        for (int i = 8; i <= 16; i++) {
            shadowOAM[i].attr0 = (2 << 8);
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

        shadowOAM[6].attr0 = (2 << 8);
        for (int i = 8; i <= 16; i++) {
            shadowOAM[i].attr0 = (2 << 8);
        }
    }
# 423 "game.c"
    shadowOAM[7].attr0 = (next_Level_Door.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[7].attr1 = (next_Level_Door.col & 0x1FF) | (0 << 14);
    shadowOAM[7].attr2 = ((0)<<12) | ((3)*32+(0));
}
