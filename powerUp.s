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
	.file	"powerUp.c"
	.text
	.align	2
	.global	initPowerUp
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPowerUp, %function
initPowerUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #7
	mov	lr, #83
	mov	r2, #1
	mov	ip, #120
	mov	r0, #0
	ldr	r3, .L4
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #12]
	str	ip, [r3, #4]
	str	r0, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	powerUp
	.size	initPowerUp, .-initPowerUp
	.align	2
	.global	updatePowerUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePowerUp, %function
updatePowerUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r3, .L19
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldm	r3, {r2, r3}
	sub	sp, sp, #20
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r5, .L19+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L6
	ldr	r5, .L19+8
	ldr	r3, [r5]
	cmp	r3, #0
	bge	.L6
	ldr	r2, [r4, #8]
	ldr	r3, .L19+12
	cmp	r2, #1
	moveq	r0, #140
	movne	r0, #83
	movne	r2, #120
	ldr	r1, [r3]
	moveq	r2, #0
	moveq	r3, #120
	movne	r3, #1
	stmeq	r4, {r0, r3}
	stmne	r4, {r0, r2, r3}
	streq	r2, [r4, #8]
	movne	r2, #0
	ldr	r3, .L19+16
	ldr	r0, .L19+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r5]
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	player
	.word	collision
	.word	.LANCHOR0
	.word	jumpSound_length
	.word	playSoundB
	.word	jumpSound_data
	.size	updatePowerUp, .-updatePowerUp
	.align	2
	.global	drawPowerUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPowerUp, %function
drawPowerUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	mov	ip, #12
	ldr	r3, .L30
	str	lr, [sp, #-4]!
	ldr	lr, .L30+4
	ldr	r1, [r3]
	ldm	r0, {r2, r3}
	ldr	r0, [lr]
	sub	r3, r3, r1
	lsl	r3, r3, #23
	ldr	r1, .L30+8
	sub	r2, r2, r0
	lsr	r3, r3, #23
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawPowerUp, .-drawPowerUp
	.comm	vOff,4,4
	.comm	hOff,4,4
	.global	time
	.comm	powerUp,28,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	time, %object
	.size	time, 4
time:
	.word	-1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
