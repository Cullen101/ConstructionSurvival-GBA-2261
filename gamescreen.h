
//{{BLOCK(gamescreen)

//======================================================================
//
//	gamescreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 19 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 608 + 2048 = 3168
//
//	Time-stamp: 2020-12-01, 10:44:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define gamescreenTilesLen 608
extern const unsigned short gamescreenTiles[304];

#define gamescreenMapLen 2048
extern const unsigned short gamescreenMap[1024];

#define gamescreenPalLen 512
extern const unsigned short gamescreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(gamescreen)
