
//{{BLOCK(gameBackG)

//======================================================================
//
//	gameBackG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 477 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15264 + 2048 = 17824
//
//	Time-stamp: 2020-12-02, 09:35:26
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACKG_H
#define GRIT_GAMEBACKG_H

#define gameBackGTilesLen 15264
extern const unsigned short gameBackGTiles[7632];

#define gameBackGMapLen 2048
extern const unsigned short gameBackGMap[1024];

#define gameBackGPalLen 512
extern const unsigned short gameBackGPal[256];

#endif // GRIT_GAMEBACKG_H

//}}BLOCK(gameBackG)
