
//{{BLOCK(fixScreen)

//======================================================================
//
//	fixScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32 + 2048 = 2592
//
//	Time-stamp: 2020-12-01, 12:47:38
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FIXSCREEN_H
#define GRIT_FIXSCREEN_H

#define fixScreenTilesLen 32
extern const unsigned short fixScreenTiles[16];

#define fixScreenMapLen 2048
extern const unsigned short fixScreenMap[1024];

#define fixScreenPalLen 512
extern const unsigned short fixScreenPal[256];

#endif // GRIT_FIXSCREEN_H

//}}BLOCK(fixScreen)
