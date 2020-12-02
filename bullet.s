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
	.file	"bullet.c"
	.text
	.align	2
	.global	initBullet
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #7
	mov	r0, #2
	ldr	r3, .L3
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	bx	lr
.L4:
	.align	2
.L3:
	.word	bullet
	.size	initBullet, .-initBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldmib	r0, {r2, ip}
	add	r2, r2, ip
	ldr	r1, [r0, #12]
	ldr	r3, [r0]
	cmp	r2, #0
	str	lr, [sp, #-4]!
	add	r3, r3, r1
	movle	lr, #512
	movle	r1, #0
	ldrle	ip, .L15
	str	r3, [r0]
	str	r2, [r0, #4]
	strhle	lr, [ip, #32]	@ movhi
	strle	r1, [r0, #24]
	ldr	r1, [r0, #16]
	add	r2, r2, r1
	cmp	r2, #255
	movgt	r2, #0
	movgt	ip, #512
	ldrgt	r1, .L15
	sub	r3, r3, #1
	strhgt	ip, [r1, #32]	@ movhi
	strgt	r2, [r0, #24]
	cmp	r3, #248
	movhi	r1, #512
	movhi	r3, #0
	ldrhi	r2, .L15
	ldr	lr, [sp], #4
	strhhi	r1, [r2, #32]	@ movhi
	strhi	r3, [r0, #24]
	bx	lr
.L16:
	.align	2
.L15:
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L38
	ldr	ip, .L38+4
	ldr	r1, [r3]
	ldm	r0, {r2, r3}
	str	lr, [sp, #-4]!
	ldr	lr, [ip]
	sub	r3, r3, r1
	ldr	ip, [r0, #12]
	ldr	r1, .L38+8
	lsl	r3, r3, #23
	sub	r2, r2, lr
	lsr	r3, r3, #23
	and	r2, r2, #255
	cmp	ip, #0
	strh	r3, [r1, #34]	@ movhi
	strh	r2, [r1, #32]	@ movhi
	ble	.L19
.L22:
	mov	r3, #204
	strh	r3, [r1, #36]	@ movhi
.L17:
	ldr	lr, [sp], #4
	bx	lr
.L19:
	bne	.L23
	ldr	r3, [r0, #8]
	cmp	r3, #0
	blt	.L21
	ldr	r3, [r0, #28]
	cmp	r3, #2
	beq	.L22
	cmn	r3, #2
	beq	.L23
	cmn	r3, #1
	movne	r3, #76
	strhne	r3, [r1, #36]	@ movhi
	bne	.L17
.L21:
	mov	r3, #78
	strh	r3, [r1, #36]	@ movhi
	b	.L17
.L23:
	mov	r3, #140
	ldr	lr, [sp], #4
	strh	r3, [r1, #36]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	cheat,4,4
	.comm	kills,4,4
	.comm	bullet,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
