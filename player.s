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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #15
	mov	r6, #16
	mov	r5, #4
	mov	r4, #2
	mov	lr, #137
	mov	r1, #1
	mov	ip, #88
	mov	r0, #3
	ldr	r3, .L4
	str	r7, [r3, #20]
	str	r6, [r3, #16]
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #52]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #48]
	str	r2, [r3, #40]
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #4
	ldr	r3, .L144
	ldr	r1, [r3, #36]
	add	r2, r1, r1, lsl ip
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r0, .L144+4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r0, r0, r2
	ldr	r2, .L144+8
	ldr	r8, [r3, #40]
	cmp	r0, r2
	str	r8, [r3, #44]
	str	ip, [r3, #40]
	sub	sp, sp, #44
	bcs	.L7
	add	r0, r3, #48
	ldm	r0, {r0, r2}
	sub	r2, r2, #1
	cmp	r0, r2
	movge	r2, #0
	addlt	r0, r0, #1
	strlt	r0, [r3, #48]
	strge	r2, [r3, #48]
.L7:
	ldr	r2, .L144+12
	ldrh	r2, [r2, #48]
	tst	r2, #32
	ldr	r2, .L144+16
	ldr	lr, [r2]
	ldr	r2, [r3, #4]
	beq	.L125
	ldr	r0, .L144+20
.L9:
	ldr	ip, .L144+12
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L13
	ldr	ip, [r3, #16]
	add	ip, r2, ip
	cmp	ip, #255
	ble	.L130
.L13:
	ldr	ip, .L144+12
	ldrh	ip, [ip, #48]
	tst	ip, #64
	beq	.L17
.L138:
	ldr	r9, [r3, #40]
.L18:
	ldr	ip, .L144+24
	ldrh	ip, [ip]
	tst	ip, #1
	beq	.L27
	ldr	r4, .L144+28
	ldrh	r4, [r4]
	tst	r4, #1
	beq	.L28
.L27:
	tst	ip, #2
	beq	.L31
	ldr	r4, .L144+28
	ldrh	r5, [r4]
	ands	r5, r5, #2
	beq	.L131
.L31:
	cmp	lr, #1
	beq	.L132
.L47:
	tst	ip, #256
	beq	.L52
	ldr	ip, .L144+28
	ldrh	ip, [ip]
	ands	ip, ip, #256
	beq	.L133
.L52:
	cmp	r9, #4
	moveq	r1, #0
	ldr	lr, [r3]
	ldr	r6, [r3, #8]
	addne	r1, r1, #1
	sub	ip, lr, r6
	streq	r1, [r3, #48]
	strne	r1, [r3, #36]
	add	r1, r2, ip, lsl #8
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	streq	r8, [r3, #40]
	cmp	r1, #0
	lsl	ip, ip, #8
	beq	.L56
	ldr	r1, [r3, #16]
	add	ip, ip, r1
	add	ip, ip, r2
	add	ip, r0, ip, lsl #1
	ldrh	r1, [ip, #-2]
	cmp	r1, #0
	beq	.L56
.L57:
	ldr	r4, [r3, #20]
	add	r5, lr, r4
	sub	r1, r5, #1
	add	r1, r1, r6
	add	ip, r2, r1, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	lsl	r1, r1, #8
	beq	.L58
	ldr	ip, [r3, #16]
	add	r1, r1, ip
	add	r2, r1, r2
	add	r0, r0, r2, lsl #1
	ldrh	r2, [r0, #-2]
	cmp	r2, #0
	bne	.L59
	ldr	r1, [r3, #28]
	cmn	r1, #1
	movne	r1, #0
	moveq	r1, #1
	cmp	r5, #250
	str	r2, [r3, #24]
	str	r1, [r3, #40]
	ble	.L6
.L64:
	mov	r0, #0
	ldr	ip, .L144+32
	ldr	r1, [ip]
	ldr	r2, [r3, #16]
	add	r1, r1, #1
	ldr	lr, .L144+36
	str	r1, [ip]
	rsb	r2, r2, #60
	ldr	r1, .L144+40
	sub	r4, r4, #17
	lsl	r2, r2, #1
	str	r4, [r3]
	str	r2, [r3, #4]
	str	r0, [lr]
	str	r0, [r1]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L56:
	mov	r1, #65
	str	r1, [r3, #24]
	b	.L57
.L58:
	ldr	r2, [r3, #28]
	cmn	r2, #1
	movne	r2, #0
	moveq	r2, #1
	str	ip, [r3, #24]
	str	r2, [r3, #40]
.L60:
	cmp	r5, #250
	bgt	.L64
.L6:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L59:
	cmp	r5, #255
	bgt	.L64
	ldr	r2, .L144+16
	ldr	r1, .L144+36
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	r2, [r1]
	addeq	lr, lr, #2
	streq	lr, [r3]
	addeq	r5, r4, lr
	cmp	r2, #95
	bgt	.L60
	sub	lr, lr, r2
	cmp	lr, #80
	addgt	r2, r2, #1
	strgt	r2, [r1]
	b	.L60
.L133:
	cmp	lr, #0
	moveq	ip, #1
	ldr	lr, .L144+16
	str	ip, [lr]
	b	.L52
.L131:
	ldr	r7, .L144+44
	ldr	r6, [r7]
	cmp	r6, #0
	beq	.L134
	ble	.L31
	ldr	r7, .L144+48
	ldr	r7, [r7]
	str	r7, [sp, #24]
	ldr	r7, .L144+52
	ldr	r7, [r7]
	str	r7, [sp, #12]
	ldr	r7, .L144+56
	ldr	r7, [r7]
	str	r7, [sp, #36]
	ldr	r7, .L144+60
	ldr	r7, [r7]
	str	r7, [sp, #32]
	ldr	r7, .L144+64
	ldr	r4, [r7, #8]
	str	r4, [sp]
	ldr	r4, [r7, #12]
	str	r4, [sp, #16]
	ldr	r4, [r7, #28]
	mov	fp, r5
	str	r4, [sp, #4]
	mov	r10, r5
	mov	r4, r5
	str	r5, [sp, #28]
	str	r5, [sp, #20]
	str	r5, [sp, #8]
	ldr	r6, .L144+68
.L40:
	cmp	r4, #0
	beq	.L135
	cmp	r4, #1
	beq	.L136
	cmp	r4, #2
	bne	.L37
	ldr	r7, .L144+68
	ldr	r7, [r7, #116]
	str	r7, [sp, #32]
	mov	r7, #1
	str	r7, [sp, #28]
.L36:
	ldr	r7, [sp]
	cmp	r7, #0
	movgt	fp, #1
	strgt	fp, [sp, #4]
	ble	.L137
.L39:
	add	r4, r4, #1
	cmp	r4, #4
	str	r10, [r6, #8]
	str	r10, [r6, #12]
	add	r6, r6, #52
	bne	.L40
	ldr	r6, .L144+72
	ldr	r4, [sp, #8]
	ldr	r7, [sp]
	cmp	r4, #0
	str	r7, [r6]
	ldr	r4, .L144+76
	ldr	r6, [sp, #16]
	str	r6, [r4]
	ldrne	r6, [sp, #12]
	ldrne	r4, .L144+52
	strne	r6, [r4]
	ldr	r4, [sp, #20]
	cmp	r4, #0
	ldrne	r6, [sp, #24]
	ldrne	r4, .L144+48
	strne	r6, [r4]
	ldr	r4, [sp, #28]
	cmp	r4, #0
	ldrne	r4, .L144+60
	ldrne	r6, [sp, #32]
	strne	r6, [r4]
	cmp	fp, #0
	ldrne	r4, .L144+64
	ldrne	r6, [sp, #4]
	strne	r6, [r4, #28]
	cmp	r5, #0
	ldrne	r4, .L144+56
	ldrne	r5, [sp, #36]
	strne	r5, [r4]
	mov	r4, #0
	ldr	r5, .L144+64
	str	r4, [r5, #8]
	str	r4, [r5, #12]
	ldr	r5, .L144+44
	cmp	lr, #1
	str	r4, [r5]
	bne	.L47
.L132:
	ldr	r4, .L144+12
	ldrh	r4, [r4, #48]
	tst	r4, #128
	ldreq	r4, [r3]
	addeq	r4, r4, #1
	streq	lr, [r3, #32]
	streq	r4, [r3]
	tst	ip, #512
	beq	.L47
	ldr	r4, .L144+28
	ldrh	r4, [r4]
	tst	r4, #512
	bne	.L47
	ldr	r4, .L144+64
	ldr	r5, [r4, #24]
	cmp	r5, #0
	bne	.L47
	ldr	r6, .L144+68
	ldr	r10, [r6, #12]
	ldr	r6, [r3]
	cmp	r10, #0
	str	r2, [r4, #4]
	str	r6, [r4]
	beq	.L47
	mov	r10, #1
	ldr	r6, [r3, #32]
	lsl	r6, r6, r10
	str	r5, [r4, #8]
	str	r6, [r4, #12]
	str	r10, [r4, #24]
	b	.L47
.L28:
	ldr	r4, .L144+64
	ldr	r6, [r4, #24]
	cmp	r6, #0
	bne	.L27
	ldr	r10, .L144+68
	ldr	fp, [r10, #12]
	ldr	r5, [r3, #16]
	ldr	r10, [r3]
	cmp	fp, #0
	ldr	fp, [r4, #20]
	add	r5, r2, r5
	sub	r5, r5, #7
	add	r10, r10, fp
	str	r5, [r4, #4]
	str	r10, [r4]
	beq	.L27
	mov	r10, #1
	ldr	r5, [r3, #28]
	lsl	r5, r5, r10
	str	r6, [r4, #12]
	str	r5, [r4, #8]
	str	r10, [r4, #24]
	b	.L27
.L130:
	ldr	r5, [r3, #12]
	cmp	lr, #1
	addeq	r2, r2, r5
	streq	r2, [r3, #4]
	streq	lr, [r3, #28]
	beq	.L15
	ldr	r4, [r3]
	sub	ip, ip, #1
	add	ip, ip, r5
	add	r6, ip, r4, lsl #8
	lsl	r6, r6, #1
	ldrh	r6, [r0, r6]
	cmp	r6, #0
	beq	.L15
	ldr	r6, [r3, #20]
	add	r4, r4, r6
	sub	r4, r4, #1
	add	ip, ip, r4, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	movne	ip, #1
	addne	r2, r2, r5
	strne	r2, [r3, #4]
	strne	ip, [r3, #28]
.L15:
	ldr	r4, .L144+40
	ldr	ip, [r4]
	cmp	ip, #15
	bgt	.L16
	sub	r5, r2, ip
	cmp	r5, #120
	addgt	ip, ip, #1
	strgt	ip, [r4]
.L16:
	mov	ip, #0
	str	ip, [r3, #40]
	ldr	ip, .L144+12
	ldrh	ip, [ip, #48]
	tst	ip, #64
	bne	.L138
.L17:
	cmp	lr, #1
	beq	.L139
	ldr	ip, [r3, #24]
	cmp	ip, #64
	bgt	.L20
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L20
	ldr	r5, [r3, #8]
	sub	r4, r4, r5
	add	r5, r2, r4, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r0, r5]
	cmp	r5, #0
	lsl	r5, r4, #8
	beq	.L20
	ldr	r6, [r3, #16]
	add	r5, r5, r6
	add	r5, r5, r2
	add	r5, r0, r5, lsl #1
	ldrh	r5, [r5, #-2]
	cmp	r5, #0
	bne	.L140
.L20:
	ldr	r9, [r3, #40]
.L22:
	ldr	r5, .L144+36
	ldr	ip, [r5]
	cmp	ip, #0
	ble	.L18
	ldr	r4, [r3]
	sub	r4, r4, ip
	cmp	r4, #79
	suble	ip, ip, #1
	strle	ip, [r5]
	b	.L18
.L125:
	cmp	lr, #1
	beq	.L141
	cmp	r2, #0
	ble	.L129
	ldr	r4, [r3, #12]
	ldr	ip, [r3]
	sub	r4, r2, r4
	ldr	r0, .L144+20
	add	r5, r4, ip, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r0, r5]
	cmp	r5, #0
	bne	.L142
.L11:
	ldr	r4, .L144+40
	ldr	ip, [r4]
	cmp	ip, #0
	ble	.L12
	sub	r5, r2, ip
	cmp	r5, #119
	suble	ip, ip, #1
	strle	ip, [r4]
.L12:
	mov	ip, #1
	str	ip, [r3, #40]
	b	.L9
.L141:
	cmp	r2, #0
	mvngt	r0, #0
	ldrgt	ip, [r3, #12]
	subgt	r2, r2, ip
	strgt	r2, [r3, #4]
	strgt	r0, [r3, #28]
.L129:
	ldr	r0, .L144+20
	b	.L11
.L134:
	mov	r5, #1
	ldr	r4, .L144+48
	ldr	r10, .L144+52
	ldr	fp, [r4]
	ldr	r10, [r10]
	ldr	r4, .L144+68
	str	fp, [r4, #64]
	str	r10, [r4, #12]
	ldr	fp, .L144+60
	ldr	r10, .L144+56
	ldr	fp, [fp]
	ldr	r10, [r10]
	str	fp, [r4, #116]
	str	r10, [r4, #168]
	str	r5, [r4, #8]
	str	r5, [r4, #60]
	str	r5, [r4, #112]
	str	r5, [r4, #164]
	mvn	r4, #0
	ldr	fp, .L144+72
	ldr	r10, .L144+64
	ldr	fp, [fp]
	str	fp, [r10, #8]
	ldr	fp, .L144+76
	ldr	fp, [fp]
	str	r6, [r10, #28]
	str	fp, [r10, #12]
	str	r4, [r7]
	b	.L31
.L142:
	ldr	r5, [r3, #20]
	add	ip, ip, r5
	sub	ip, ip, #1
	add	ip, r4, ip, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	mvnne	ip, #0
	movne	r2, r4
	strne	r4, [r3, #4]
	strne	ip, [r3, #28]
	b	.L11
.L137:
	bne	.L67
	ldr	r7, [sp, #16]
	cmp	r7, #0
	ble	.L143
	mov	r7, #2
	mov	fp, #1
	str	r7, [sp, #4]
	b	.L39
.L135:
	ldr	r7, .L144+68
	ldr	r7, [r7, #12]
	str	r7, [sp, #12]
	mov	r7, #1
	str	r7, [sp, #8]
	b	.L36
.L139:
	ldr	ip, [r3]
	cmp	ip, #0
	ble	.L20
	mvn	r4, #0
	ldr	r5, [r3, #28]
	cmp	r5, r4
	moveq	r9, #3
	movne	r9, #2
	add	ip, ip, r4
	str	ip, [r3]
	str	r4, [r3, #32]
	str	r9, [r3, #40]
	b	.L22
.L37:
	cmp	r4, #3
	ldreq	r7, .L144+68
	ldreq	r7, [r7, #168]
	moveq	r5, #1
	streq	r7, [sp, #36]
	b	.L36
.L136:
	ldr	r7, .L144+68
	ldr	r7, [r7, #64]
	str	r4, [sp, #20]
	str	r7, [sp, #24]
	b	.L36
.L67:
	mvn	r7, #0
	mov	fp, #1
	str	r7, [sp, #4]
	b	.L39
.L140:
	ldr	r5, [r3, #28]
	cmn	r5, #1
	moveq	r9, #3
	movne	r9, #2
	add	ip, ip, #1
	str	ip, [r3, #24]
	str	r4, [r3]
	str	r9, [r3, #40]
	b	.L22
.L143:
	mvnne	r7, #1
	movne	fp, #1
	strne	r7, [sp, #4]
	b	.L39
.L145:
	.align	2
.L144:
	.word	player
	.word	143165576
	.word	286331153
	.word	67109120
	.word	cheat
	.word	collisionmapBitmap
	.word	oldButtons
	.word	buttons
	.word	hit
	.word	vOff
	.word	hOff
	.word	time
	.word	tem2
	.word	tem1
	.word	tem4
	.word	tem3
	.word	bullet
	.word	enemy
	.word	temp2
	.word	temp3
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L148
	ldr	r2, .L148+4
	ldr	r3, [r0, #4]
	ldr	r1, [r2]
	ldr	r2, .L148+8
	str	lr, [sp, #-4]!
	ldr	ip, [r0, #48]
	ldr	lr, [r2]
	sub	r3, r3, r1
	ldr	r2, [r0, #40]
	ldr	r1, [r0]
	lsl	r3, r3, #23
	ldr	r0, .L148+12
	sub	r1, r1, lr
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	and	r1, r1, #255
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L149:
	.align	2
.L148:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	tem4,4,4
	.comm	tem3,4,4
	.comm	tem2,4,4
	.comm	tem1,4,4
	.comm	temp3,4,4
	.comm	cheat,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.global	vel
	.comm	temp2,4,4
	.comm	temp,4,4
	.comm	hit,4,4
	.comm	player,56,4
	.data
	.align	2
	.type	vel, %object
	.size	vel, 4
vel:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
