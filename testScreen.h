
//{{BLOCK(testScreen)

//======================================================================
//
//	testScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 163 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5216 + 2048 = 7776
//
//	Time-stamp: 2020-12-01, 10:41:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TESTSCREEN_H
#define GRIT_TESTSCREEN_H

#define testScreenTilesLen 5216
extern const unsigned short testScreenTiles[2608];

#define testScreenMapLen 2048
extern const unsigned short testScreenMap[1024];

#define testScreenPalLen 512
extern const unsigned short testScreenPal[256];

#endif // GRIT_TESTSCREEN_H

//}}BLOCK(testScreen)
