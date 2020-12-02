	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"fixScreen.c"
	.text
	.global	fixScreenPal
	.global	fixScreenMap
	.global	fixScreenTiles
	.section	.rodata
	.align	2
	.type	fixScreenPal, %object
	.size	fixScreenPal, 512
fixScreenPal:
	.space	512
	.type	fixScreenMap, %object
	.size	fixScreenMap, 2048
fixScreenMap:
	.space	2048
	.type	fixScreenTiles, %object
	.size	fixScreenTiles, 32
fixScreenTiles:
	.space	32
	.ident	"GCC: (devkitARM release 53) 9.1.0"
