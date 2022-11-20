// Constants
#define MAPHEIGHT 160
#define MAPWIDTH 240

#define XLMAPHEIGHT 768
#define XLMAPWIDTH 256

// Variables
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

// Prototypes
void init_Game();
void init_BG();
void init_Characters();
void init_Beginner_Enemy();
void init_Intermediate_Enemy();
void init_Beginner_Fight();
void init_BG_Beginner_Fight();
void init_BG_Intermediate_Fight();

void update_Game();
// void update_Beginner_Fight();
void update_Fight();
void update_Player();
void update_Battle_Controls();
void update_Player_Health();
void return_To_Game();
void drawString();

// All structs below
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
