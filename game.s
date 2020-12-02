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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	r0, #60
	mov	r2, #0
	ldr	r3, .L4+40
	ldr	ip, .L4+44
	ldrh	lr, [r3, #48]
	ldr	r1, .L4+48
	ldr	r3, .L4+52
	strh	lr, [ip]	@ movhi
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	initPlayer
	.word	initEnemy
	.word	initPowerUp
	.word	initBullet
	.word	67109120
	.word	buttons
	.word	vOff
	.word	hOff
	.size	initGame, .-initGame
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L8
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+8
	mov	r0, r5
	mov	lr, pc
	bx	r4
	add	r0, r5, #52
	mov	lr, pc
	bx	r4
	add	r0, r5, #104
	mov	lr, pc
	bx	r4
	add	r0, r5, #156
	mov	lr, pc
	bx	r4
	ldr	r0, .L8+12
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	ldr	r0, .L8+24
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L8+28
	ldrh	r1, [r2]
	ldr	r2, .L8+32
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	enemy
	.word	updatePlayer
	.word	updateEnemy
	.word	powerUp
	.word	updatePowerUp
	.word	updateBullet
	.word	bullet
	.word	vOff
	.word	hOff
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+4
	ldr	r0, .L13+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L13+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L13+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L13+20
	mov	lr, pc
	bx	r4
	ldr	r0, .L13+24
	ldr	r3, .L13+28
	mov	lr, pc
	bx	r3
	ldr	r0, .L13+32
	ldr	r3, .L13+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+40
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r3, .L13+44
	ldrh	r2, [r3]
	ldr	r3, .L13+48
	ldr	r3, [r3]
	tst	r3, #1
	strh	r2, [r1, #16]	@ movhi
	lsl	r2, r3, #16
	addeq	r3, r3, r3, lsr #31
	asreq	r3, r3, #1
	lsleq	r3, r3, #16
	lsreq	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #18]	@ movhi
	ldr	r4, .L13+52
	strheq	r3, [r1, #22]	@ movhi
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L13+56
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	drawPlayer
	.word	drawEnemy
	.word	enemy
	.word	enemy+52
	.word	enemy+104
	.word	enemy+156
	.word	powerUp
	.word	drawPowerUp
	.word	bullet
	.word	drawBullet
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
