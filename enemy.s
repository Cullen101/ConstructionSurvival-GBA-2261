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
	.file	"enemy.c"
	.text
	.align	2
	.global	initEnemy
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	mov	r2, #0
	push	{r4, r5, r6, r7, lr}
	mov	r6, #10
	mov	r5, #11
	mov	lr, r1
	mov	r4, r1
	mov	ip, r2
	mov	r7, #98
	mov	r0, #4
	ldr	r3, .L9
	str	r1, [r3, #8]
	str	r6, [r3, #20]
	str	r5, [r3, #16]
.L2:
	mvn	r1, r2
	str	r2, [r3, #48]
	add	r2, r2, #1
	and	r1, r1, #1
	cmp	r2, #4
	stm	r3, {r4, r7}
	str	lr, [r3, #12]
	str	ip, [r3, #28]
	str	ip, [r3, #32]
	str	r0, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #24]
	beq	.L8
	cmp	r2, #1
	str	r6, [r3, #72]
	str	r5, [r3, #68]
	str	r4, [r3, #60]
	mvnne	lr, #1
	moveq	lr, #2
	add	r3, r3, #52
	b	.L2
.L8:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	enemy
	.size	initEnemy, .-initEnemy
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #1
	bxne	lr
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r1, #6
	ldr	r3, [r0, #28]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L66
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	r0, .L66+4
	sub	r2, r2, r3
	ldr	r3, [r4, #40]
	cmp	r2, r0
	str	r1, [r4, #40]
	str	r3, [r4, #44]
	sub	sp, sp, #16
	bcs	.L14
	add	r2, r4, #32
	ldm	r2, {r2, r3}
	sub	r3, r3, #1
	cmp	r2, r3
	movge	r3, #0
	addlt	r2, r2, #1
	strlt	r2, [r4, #32]
	strge	r3, [r4, #32]
.L14:
	ldr	r0, [r4, #4]
	ldr	ip, [r4, #12]
	ldr	r1, [r4]
	sub	r2, r0, ip
	ldr	lr, .L66+8
	add	r3, r2, r1, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	lsl	r6, r1, #8
	ldr	r3, [r4, #20]
	bne	.L57
	ldr	r2, [r4, #16]
.L16:
	cmp	r0, #0
	ble	.L18
	add	r0, r0, r2
	cmp	r0, #255
	ble	.L19
.L18:
	rsb	ip, ip, #0
	str	ip, [r4, #12]
.L19:
	cmp	r1, #90
	beq	.L63
.L20:
	add	r6, r1, r3
	cmp	r6, #255
	bgt	.L23
	ldr	r0, [r4, #4]
	add	ip, r6, #1
	add	r5, r0, ip, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [lr, r5]
	cmp	r5, #0
	lsl	ip, ip, #8
	beq	.L24
	add	ip, ip, r2
	add	ip, ip, r0
	add	lr, lr, ip, lsl #1
	ldrh	ip, [lr, #-2]
	cmp	ip, #0
	ldrne	ip, [r4, #8]
	addne	r1, r1, ip
	strne	r1, [r4]
	addne	r6, r3, r1
.L24:
	cmp	r6, #250
	bgt	.L23
.L25:
	ldr	r5, .L66+12
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	ldr	r6, .L66+16
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L26
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L27:
	ldr	r5, .L66+20
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L31
	mov	r0, #0
	mov	r7, #512
	ldr	lr, .L66+24
	ldr	r3, [r4, #16]
	ldr	r2, [lr]
	ldr	r1, [r4, #20]
	ldr	ip, [r4, #48]
	ldr	r6, .L66+28
	rsb	r3, r3, #60
	add	ip, r6, ip, lsl #3
	add	r2, r2, #1
	sub	r1, r1, #8
	lsl	r3, r3, #1
	strh	r7, [ip, #40]	@ movhi
	str	r0, [r5, #24]
	strh	r7, [r6, #32]	@ movhi
	str	r0, [r5, #4]
	str	r0, [r5]
	stm	r4, {r1, r3}
	str	r2, [lr]
.L31:
	ldr	r3, [r4, #40]
	cmp	r3, #6
	moveq	r2, #0
	ldrne	r3, [r4, #28]
	ldreq	r3, [r4, #44]
	addne	r3, r3, #1
	streq	r3, [r4, #40]
	strne	r3, [r4, #28]
	ldr	r3, .L66+32
	ldr	r3, [r3]
	streq	r2, [r4, #32]
	cmp	r3, #0
	ldreq	r2, [r4, #44]
	streq	r3, [r4, #32]
	streq	r2, [r4, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	add	r5, r1, r3
	sub	r5, r5, #1
	add	r2, r2, r5, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	lsl	r5, r5, #8
	ldr	r2, [r4, #16]
	beq	.L16
	add	r7, r0, r2
	sub	r7, r7, #1
	add	r7, r7, ip
	add	r6, r6, r7
	lsl	r6, r6, #1
	ldrh	r6, [lr, r6]
	cmp	r6, #0
	beq	.L16
	add	r5, r5, r7
	lsl	r5, r5, #1
	ldrh	r5, [lr, r5]
	cmp	r5, #0
	beq	.L16
	cmn	ip, #1
	movne	r5, #4
	moveq	r5, #5
	add	r0, r0, ip
	str	r0, [r4, #4]
	str	r5, [r4, #40]
	b	.L16
.L26:
	mov	r0, #0
	mov	r8, #512
	ldr	r7, .L66+36
	mov	lr, r7
	ldr	r3, [r5, #16]
	rsb	r3, r3, #60
	lsl	r3, r3, #1
	str	r3, [r5, #4]
	ldr	r1, .L66+28
	ldr	r3, [r4, #48]
	ldr	r2, [r4, #16]
	add	r3, r1, r3, lsl #3
	ldr	r1, [r5, #20]
	str	r0, [r4, #24]
	strh	r8, [r3, #40]	@ movhi
	ldr	r8, [r4, #12]
	ldr	r3, [r4, #20]
	rsb	r1, r1, #152
	mov	ip, r0
	rsb	r0, r2, #60
	str	r1, [r5]
	lsl	r0, r0, #1
	rsb	r8, r8, #0
	sub	r1, r3, #8
	str	r0, [r4, #4]
	str	r8, [r4, #12]
	str	r1, [r4]
.L30:
	ldr	r5, [lr, #24]
	cmp	r5, #0
	beq	.L64
	add	ip, ip, #1
	cmp	ip, #4
	add	lr, lr, #52
	bne	.L30
.L29:
	ldr	lr, .L66+40
	ldr	ip, [lr]
	add	ip, ip, #1
	str	ip, [lr]
	b	.L27
.L23:
	rsb	r0, r2, #60
	lsl	r0, r0, #1
	sub	r1, r3, #8
	str	r0, [r4, #4]
	str	r1, [r4]
	b	.L25
.L63:
	ldr	r7, .L66+36
	mov	r0, #0
	mov	ip, r7
.L22:
	ldr	r5, [ip, #24]
	cmp	r5, #0
	beq	.L65
	add	r0, r0, #1
	cmp	r0, #4
	add	ip, ip, #52
	bne	.L22
	b	.L20
.L64:
	mov	r5, #1
	add	lr, ip, ip, lsl r5
	add	ip, ip, lr, lsl #2
	add	lr, r7, ip, lsl #2
	str	r1, [r7, ip, lsl #2]
	str	r0, [lr, #4]
	str	r5, [lr, #24]
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	b	.L29
.L65:
	mov	ip, #1
	add	r1, r0, r0, lsl ip
	add	r1, r0, r1, lsl #2
	sub	r0, r3, #8
	str	r0, [r7, r1, lsl #2]
	rsb	r0, r2, #60
	add	r1, r7, r1, lsl #2
	lsl	r0, r0, ip
	str	r0, [r1, #4]
	str	ip, [r1, #24]
	ldr	r1, [r4]
	b	.L20
.L67:
	.align	2
.L66:
	.word	143165576
	.word	286331153
	.word	collisionmapBitmap
	.word	player
	.word	collision
	.word	bullet
	.word	kills
	.word	shadowOAM
	.word	time
	.word	enemy
	.word	hit
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, .L77
	ldr	r3, [r0, #4]
	ldr	r1, [r2]
	ldr	r2, .L77+4
	push	{r4, r5, lr}
	ldr	ip, [r0]
	ldr	r4, [r0, #32]
	ldr	r5, [r2]
	sub	r3, r3, r1
	ldr	r2, [r0, #48]
	ldr	r1, [r0, #40]
	ldr	lr, .L77+8
	lsl	r3, r3, #23
	sub	r0, ip, r5
	add	r2, r2, #5
	add	r1, r1, r4, lsl #5
	lsr	r3, r3, #23
	lsl	ip, r2, #3
	orr	r3, r3, #16384
	add	r2, lr, r2, lsl #3
	and	r0, r0, #255
	lsl	r1, r1, #1
	strh	r0, [lr, ip]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.comm	save,4,4
	.comm	time,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	kills,4,4
	.comm	hit,4,4
	.comm	enemy,208,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
