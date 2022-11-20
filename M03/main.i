# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2
# 1 "tilemap.h" 1
# 22 "tilemap.h"
extern const unsigned short tilemapTiles[144];


extern const unsigned short tilemapMap[1024];


extern const unsigned short tilemapPal[256];
# 4 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "main.c" 2
# 1 "XL_Map.h" 1
# 22 "XL_Map.h"
extern const unsigned short XL_MapTiles[2288];


extern const unsigned short XL_MapMap[3072];


extern const unsigned short XL_MapPal[256];
# 6 "main.c" 2
# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[98304];


extern const unsigned short collisionmapPal[256];
# 7 "main.c" 2
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
# 8 "main.c" 2
# 74 "main.c"
void initialize();
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToFightBeginner();
void fight_Beginner();
void goToFightIntermediate();
void fight_Intermediate();
void goToIntermediateStage();
void intermediate_Stage();
void goToXL_Stage();
void XL_Stage();


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



unsigned short buttons;
unsigned short oldButtons;


OBJ_ATTR shadowOAM[128];


int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

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
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);



    DMANow(3, tilemapTiles, &((charblock *)0x6000000)[0], 288 / 2);
    DMANow(3, tilemapPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, tilemapMap, &((screenblock *)0x6000000)[15], 1024);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((15)<<8) | (0<<7) | (0<<14);
# 176 "main.c"
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    oldButtons = buttons;
    buttons = (*(volatile unsigned short *)0x04000130);

    hideSprites();
    goToStart();
}

void goToStart() {
    hideSprites();

    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 2;
        }
    }

    shadowOAM[0].attr0 = ((160/2) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[0].attr1 = (((240/2) - 35) & 0x1FF) | (3 << 14);
    shadowOAM[0].attr2 = ((0)<<12) | ((9)*32+(8));
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    waitForVBlank();
    state = START;
}

void start() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        shadowOAM[0].attr0 = (2 << 8);
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        shadowOAM[0].attr0 = (2 << 8);
        init_Game();
        goToGame();
    }
}

void goToInstructions() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    fillScreen3(((0) | (0) << 5 | (0) << 10));
    drawString((240 - (21 * 6)) / 2, 0, "press START to play", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 10, "Instruction Page", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 20, "Blue = Beginner Enemy Level", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 30, "Red = Intermediate Enemy Level", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 40, "ARROW KEYS for Movement", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 50, "A/B for traversing Battle UI", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 60, "Collision for Battle!", ((31) | (31) << 5 | (31) << 10));
    drawString((240 - (21 * 6)) / 2, 70, "Black Square WIP", ((31) | (31) << 5 | (31) << 10));
    state = INSTRUCTIONS;
}

void instructions() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
        DMANow(3, tilemapTiles, &((charblock *)0x6000000)[0], 288 / 2);
        DMANow(3, tilemapPal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, tilemapMap, &((screenblock *)0x6000000)[15], 1024);
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((15)<<8) | (0<<7) | (0<<14);


        DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
        DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
        hideSprites();

        init_Game();
        goToGame();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
        DMANow(3, tilemapTiles, &((charblock *)0x6000000)[0], 288 / 2);
        DMANow(3, tilemapPal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, tilemapMap, &((screenblock *)0x6000000)[15], 1024);
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((15)<<8) | (0<<7) | (0<<14);


        DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
        DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
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
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
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
    fighting = 1;
    state = FIGHTBEGINNER;
}

void fight_Beginner() {
    update_Fight();
    waitForVBlank();

    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
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
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
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
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
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
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);
    DMANow(3, XL_MapPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, XL_MapTiles, &((charblock *)0x6000000)[1], 4576 / 2);
    DMANow(3, XL_MapMap, &((screenblock *)0x6000000)[16], 6144 / 2);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((16)<<8) | (2<<14) | 1;

    init_XL_Characters();
    waitForVBlank();
    state = XLSTAGE;
}

void XL_Stage() {
    update_Game();
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToWin();
    }
}

void goToPause() {

    shadowOAM[1].attr0 = ((160/2) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[1].attr1 = (((240/2) - 35) & 0x1FF) | (1 << 14);
    shadowOAM[1].attr2 = ((0)<<12) | ((8)*32+(0));
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    waitForVBlank();
    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3)))) && game_Stage == 0) {
        shadowOAM[1].attr0 = (2 << 8);
        goToGame();
    } else if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3)))) && game_Stage == 1) {
        shadowOAM[1].attr0 = (2 << 8);
        goToFightBeginner();
    } else if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3)))) && game_Stage == 2) {
        goToFightIntermediate();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
}

void goToLose() {
    hideSprites();
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 4;
        }
    }
    shadowOAM[2].attr0 = ((160/2) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[2].attr1 = (((240/2) - 35) & 0x1FF) | (1 << 14);
    shadowOAM[2].attr2 = ((0)<<12) | ((6)*32+(0));
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    waitForVBlank();
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        shadowOAM[2].attr0 = (2 << 8);
        goToStart();
    }
}

void goToWin() {
    hideSprites();
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            ((screenblock *)0x6000000)[15].tilemap[((j) * (32) + (i))] = 5;
        }
    }
    shadowOAM[3].attr0 = ((160/2) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[3].attr1 = (((240/2) - 35) & 0x1FF) | (1 << 14);
    shadowOAM[3].attr2 = ((0)<<12) | ((5)*32+(0));
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    waitForVBlank();
    state = WIN;
}

void win() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        shadowOAM[3].attr0 = (2 << 8);
        goToStart();
    }
}
