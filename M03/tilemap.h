
//{{BLOCK(tilemap)

//======================================================================
//
//	tilemap, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 288 + 2048 = 2848
//
//	Time-stamp: 2022-11-08, 18:28:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TILEMAP_H
#define GRIT_TILEMAP_H

#define tilemapTilesLen 288
extern const unsigned short tilemapTiles[144];

#define tilemapMapLen 2048
extern const unsigned short tilemapMap[1024];

#define tilemapPalLen 512
extern const unsigned short tilemapPal[256];

#endif // GRIT_TILEMAP_H

//}}BLOCK(tilemap)
