
//{{BLOCK(XL_Map)

//======================================================================
//
//	XL_Map, 256x768@4, 
//	+ palette 256 entries, not compressed
//	+ 143 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x96 
//	Total size: 512 + 4576 + 6144 = 11232
//
//	Time-stamp: 2022-11-19, 20:16:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_XL_MAP_H
#define GRIT_XL_MAP_H

#define XL_MapTilesLen 4576
extern const unsigned short XL_MapTiles[2288];

#define XL_MapMapLen 6144
extern const unsigned short XL_MapMap[3072];

#define XL_MapPalLen 512
extern const unsigned short XL_MapPal[256];

#endif // GRIT_XL_MAP_H

//}}BLOCK(XL_Map)
