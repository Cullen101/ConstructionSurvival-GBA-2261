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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #0
	ldr	r4, .L4
	strh	r5, [r2, #18]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	menuScreenPal
	.word	6944
	.word	menuScreenTiles
	.word	100720640
	.word	menuScreenMap
	.word	100679680
	.word	fixScreenTiles
	.word	100712448
	.word	fixScreenMap
	.word	stopSound
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	lr, #4864
	mov	ip, #7168
	mov	r3, #0
	mvn	r0, #0
	ldr	r1, .L8
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	ldr	ip, .L8+4
	ldr	r1, .L8+8
	ldrh	ip, [ip, #48]
	ldr	r2, .L8+12
	ldr	lr, .L8+16
	strh	ip, [r1]	@ movhi
	ldr	ip, .L8+20
	ldr	r1, .L8+24
	strh	r3, [r2]	@ movhi
	ldr	r2, .L8+28
	str	r3, [lr]
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	6148
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	hit
	.word	kills
	.word	time
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	strh	r1, [r2, #18]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+16
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L12+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionScreenPal
	.word	6624
	.word	instructionScreenTiles
	.word	100720640
	.word	instructionScreenMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #2608
	mov	r0, #3
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #304
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+28
	mov	r0, #3
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	testScreenPal
	.word	100679680
	.word	testScreenTiles
	.word	100712448
	.word	testScreenMap
	.word	gamescreenTiles
	.word	100720640
	.word	gamescreenMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L30
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L19
	ldr	r2, .L30+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L28
.L19:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToInstructions
.L28:
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L30+16
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L30+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.size	start, .-start
	.align	2
	.global	inst
	.syntax unified
	.arm
	.fpu softvfp
	.type	inst, %function
inst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L44
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L44+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L42
.L33:
	tst	r3, #2
	beq	.L32
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	initialize
.L42:
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L44+16
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L44+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.size	inst, .-inst
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L48
	strh	r1, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldr	r4, .L48+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, #2624
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L48+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L48+24
	ldr	r1, .L48+28
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L48+32
	ldr	r1, .L48+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L48+40
	mov	r0, #3
	ldr	r1, .L48+44
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L48+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	100679680
	.word	fixScreenTiles
	.word	100712448
	.word	fixScreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L62
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L51
	ldr	r2, .L62+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L60
.L51:
	tst	r3, #8
	beq	.L50
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
.L50:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	initialize
.L60:
	ldr	r3, .L62+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L51
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L66
	strh	r1, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	ldr	r4, .L66+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+16
	mov	lr, pc
	bx	r4
	mov	r3, #7872
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+24
	ldr	r1, .L66+28
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L66+32
	ldr	r1, .L66+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L66+40
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L66+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+48
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L66+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winScreenPal
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
	.word	100679680
	.word	fixScreenTiles
	.word	100712448
	.word	fixScreenMap
	.word	stopSound
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L75
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L75+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
.L68:
	pop	{r4, lr}
	bx	lr
.L74:
	pop	{r4, lr}
	b	initialize
.L76:
	.align	2
.L75:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L79
	strh	r1, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	ldr	r4, .L79+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L79+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L79+20
	ldr	r1, .L79+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L79+28
	ldr	r1, .L79+32
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L79+36
	ldr	r1, .L79+40
	mov	lr, pc
	bx	r4
	ldr	r2, .L79+44
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L79+48
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+52
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L79+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L80:
	.align	2
.L79:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	loseScreenPal
	.word	5360
	.word	loseScreenTiles
	.word	100720640
	.word	loseScreenMap
	.word	100679680
	.word	fixScreenTiles
	.word	100712448
	.word	fixScreenMap
	.word	stopSound
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L92+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
.L82:
	ldr	r3, .L92+20
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L90
.L83:
	ldr	r3, .L92+24
	ldr	r3, [r3]
	cmp	r3, #5
	beq	.L91
	pop	{r4, lr}
	bx	lr
.L91:
	pop	{r4, lr}
	b	goToWin
.L90:
	bl	goToLose
	b	.L83
.L89:
	ldr	r3, .L92+28
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L82
.L93:
	.align	2
.L92:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	hit
	.word	kills
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L106
	mov	lr, pc
	bx	r3
	ldr	r6, .L106+4
	ldr	r8, .L106+8
	ldr	r5, .L106+12
	ldr	fp, .L106+16
	ldr	r10, .L106+20
	ldr	r9, .L106+24
	ldr	r7, .L106+28
	ldr	r4, .L106+32
.L95:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L96:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L96
.L98:
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L97
	.word	.L97
.L97:
	mov	lr, pc
	bx	r7
	b	.L95
.L99:
	ldr	r3, .L106+36
	mov	lr, pc
	bx	r3
	b	.L95
.L100:
	mov	lr, pc
	bx	r9
	b	.L95
.L101:
	mov	lr, pc
	bx	r10
	b	.L95
.L102:
	mov	lr, pc
	bx	fp
	b	.L95
.L107:
	.align	2
.L106:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	inst
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	time,4,4
	.comm	kills,4,4
	.comm	hit,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
