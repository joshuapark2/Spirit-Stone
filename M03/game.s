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
	.global	init_BG
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_BG, %function
init_BG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #640
	mov	r0, #3
	str	lr, [sp, #-4]!
	ldr	ip, .L8
	ldr	lr, .L8+4
.L2:
	sub	r3, r1, #640
.L3:
	lsl	r2, r3, #1
	add	r3, r3, #32
	cmp	r3, r1
	strh	r0, [ip, r2]	@ movhi
	bne	.L3
	add	r1, r3, #1
	cmp	r1, lr
	bne	.L2
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	100694016
	.word	670
	.size	init_BG, .-init_BG
	.align	2
	.global	init_BG_Intermediate_Stage
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_BG_Intermediate_Stage, %function
init_BG_Intermediate_Stage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #640
	mov	r0, #2
	str	lr, [sp, #-4]!
	ldr	ip, .L16
	ldr	lr, .L16+4
.L11:
	sub	r3, r1, #640
.L12:
	lsl	r2, r3, #1
	add	r3, r3, #32
	cmp	r3, r1
	strh	r0, [ip, r2]	@ movhi
	bne	.L12
	add	r1, r3, #1
	cmp	r1, lr
	bne	.L11
	ldr	lr, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	100694016
	.word	670
	.size	init_BG_Intermediate_Stage, .-init_BG_Intermediate_Stage
	.align	2
	.global	init_BG_Beginner_Fight
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_BG_Beginner_Fight, %function
init_BG_Beginner_Fight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #1
	mov	r4, #0
	mov	lr, #7
	ldr	r0, .L25
.L19:
	mov	r2, r4
	mov	r3, #0
	b	.L23
.L21:
	add	r3, r3, #1
	add	r2, r2, #32
.L23:
	cmp	r3, #12
	lsl	r1, r2, #1
	strhls	ip, [r0, r1]	@ movhi
	bls	.L21
	lsl	r1, r2, #1
	cmp	r3, #19
	strh	lr, [r0, r1]	@ movhi
	bne	.L21
	add	r4, r4, #1
	cmp	r4, #30
	bne	.L19
	mov	r7, #0
	mov	r6, #32
	mov	r5, #288
	mov	r4, #126
	mov	lr, #73
	mov	r0, #48
	mov	r1, #56
	mov	ip, #416
	ldr	r3, .L25+4
	ldr	r2, [r3, #4]
	ldrb	r8, [r3]	@ zero_extendqisi2
	lsl	r2, r2, #23
	ldr	r3, .L25+8
	lsr	r2, r2, #23
	strh	r2, [r3, #50]	@ movhi
	ldr	r2, .L25+12
	strh	r2, [r3, #64]	@ movhi
	ldr	r2, .L25+16
	strh	r2, [r3, #66]	@ movhi
	ldr	r2, .L25+20
	strh	r8, [r3, #48]	@ movhi
	strh	r7, [r3, #44]	@ movhi
	strh	r6, [r3, #52]	@ movhi
	strh	r5, [r3, #68]	@ movhi
	strh	r4, [r3, #72]	@ movhi
	strh	lr, [r3, #74]	@ movhi
	stm	r2, {r0, r1}
	strh	ip, [r3, #76]	@ movhi
	strh	r0, [r3, #40]	@ movhi
	strh	r1, [r3, #42]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	100694016
	.word	intermediate_Enemy
	.word	shadowOAM
	.word	16499
	.word	-16299
	.word	player
	.size	init_BG_Beginner_Fight, .-init_BG_Beginner_Fight
	.align	2
	.global	init_BG_Intermediate_Fight
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_BG_Intermediate_Fight, %function
init_BG_Intermediate_Fight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	ip, #2
	mov	r4, #0
	mov	lr, #7
	ldr	r0, .L34
.L28:
	mov	r2, r4
	mov	r3, #0
	b	.L32
.L30:
	add	r3, r3, #1
	add	r2, r2, #32
.L32:
	cmp	r3, #12
	lsl	r1, r2, #1
	strhls	ip, [r0, r1]	@ movhi
	bls	.L30
	lsl	r1, r2, #1
	cmp	r3, #19
	strh	lr, [r0, r1]	@ movhi
	bne	.L30
	add	r4, r4, #1
	cmp	r4, #30
	bne	.L28
	mov	r2, #48
	mov	r0, #56
	mov	r1, #192
	mov	r7, #0
	mov	r6, #64
	mov	r5, #288
	mov	r4, #126
	mov	lr, #73
	mov	ip, #416
	ldr	r3, .L34+4
	str	r2, [r3]
	str	r0, [r3, #4]
	ldr	r3, .L34+8
	strh	r0, [r3, #42]	@ movhi
	ldr	r0, .L34+12
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	str	r2, [r0]
	str	r1, [r0, #4]
	strh	r1, [r3, #50]	@ movhi
	ldr	r2, .L34+16
	ldr	r1, .L34+20
	strh	r7, [r3, #44]	@ movhi
	strh	r6, [r3, #52]	@ movhi
	strh	r5, [r3, #68]	@ movhi
	strh	r4, [r3, #72]	@ movhi
	strh	lr, [r3, #74]	@ movhi
	strh	r1, [r3, #64]	@ movhi
	strh	r2, [r3, #66]	@ movhi
	strh	ip, [r3, #76]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	100694016
	.word	player
	.word	shadowOAM
	.word	intermediate_Enemy
	.word	-16299
	.word	16499
	.size	init_BG_Intermediate_Fight, .-init_BG_Intermediate_Fight
	.align	2
	.global	init_Characters
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_Characters, %function
init_Characters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r1, #0
	mov	r0, #8
	mov	ip, #1
	mov	r5, #3
	mov	r10, #18
	mov	r3, #14
	mov	lr, #112
	mov	r4, #48
	mov	r9, #192
	mov	r6, #16
	mov	r8, #32
	mov	r7, #96
	ldr	r2, .L38
	str	r10, [r2]
	str	r3, [r2, #4]
	str	r5, [r2, #36]
	ldr	r3, .L38+4
	str	ip, [r2, #8]
	str	ip, [r2, #12]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	str	r1, [r2, #32]
	ldr	r2, .L38+8
	stm	r3, {r4, lr}
	stm	r2, {r4, r9}
	str	r5, [r3, #36]
	str	r5, [r2, #36]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	str	ip, [r2, #8]
	ldr	r3, .L38+12
	str	ip, [r2, #12]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	str	r1, [r2, #32]
	ldr	r2, .L38+16
	stm	r2, {r6, lr}
	strh	r4, [r3, #40]	@ movhi
	strh	lr, [r3, #42]	@ movhi
	strh	r6, [r3, #56]	@ movhi
	strh	lr, [r3, #58]	@ movhi
	strh	r8, [r3, #44]	@ movhi
	strh	r7, [r3, #60]	@ movhi
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	player
	.word	beginner_Enemy
	.word	intermediate_Enemy
	.word	shadowOAM
	.word	next_Level_Door
	.size	init_Characters, .-init_Characters
	.align	2
	.global	init_Game
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_Game, %function
init_Game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #640
	mov	r0, #3
	push	{r4, lr}
	ldr	ip, .L46
	ldr	lr, .L46+4
.L41:
	sub	r3, r1, #640
.L42:
	lsl	r2, r3, #1
	add	r3, r3, #32
	cmp	r3, r1
	strh	r0, [ip, r2]	@ movhi
	bne	.L42
	add	r1, r3, #1
	cmp	r1, lr
	bne	.L41
	bl	init_Characters
	mov	r3, #0
	mov	r2, #100
	mov	lr, #50
	mov	r0, #2
	mvn	r1, #0
	ldr	ip, .L46+8
	str	r3, [ip]
	ldr	ip, .L46+12
	str	r3, [ip]
	ldr	ip, .L46+16
	str	r3, [ip]
	ldr	ip, .L46+20
	ldr	r3, .L46+24
	str	r2, [ip]
	str	r2, [r3]
	ldr	ip, .L46+28
	ldr	r2, .L46+32
	ldr	r3, .L46+36
	str	lr, [ip]
	str	r0, [r2]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	100694016
	.word	670
	.word	game_Stage
	.word	door_State
	.word	fighting
	.word	player_Health
	.word	intermediate_Enemy_Health
	.word	beginner_Enemy_Health
	.word	enemies_Left
	.word	battle_UI
	.size	init_Game, .-init_Game
	.align	2
	.global	init_Intermediate_Characters
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_Intermediate_Characters, %function
init_Intermediate_Characters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #96
	push	{r4, r5, r6, lr}
	mov	ip, #48
	mov	r5, #64
	mov	r1, #112
	mov	r4, #18
	mov	lr, #14
	ldr	r3, .L50
	ldr	r2, [r3, #4]
	ldrb	r6, [r3]	@ zero_extendqisi2
	lsl	r2, r2, #23
	ldr	r3, .L50+4
	lsr	r2, r2, #23
	strh	r2, [r3, #58]	@ movhi
	strh	r0, [r3, #60]	@ movhi
	ldr	r2, .L50+8
	ldr	r0, .L50+12
	stm	r2, {r4, lr}
	strh	r6, [r3, #56]	@ movhi
	strh	r5, [r3, #52]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	str	ip, [r0]
	str	r1, [r0, #4]
	strh	r1, [r3, #50]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	next_Level_Door
	.word	shadowOAM
	.word	player
	.word	intermediate_Enemy
	.size	init_Intermediate_Characters, .-init_Intermediate_Characters
	.align	2
	.global	init_XL_Characters
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_XL_Characters, %function
init_XL_Characters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #18
	mov	r2, #14
	ldr	r3, .L53
	stm	r3, {r1, r2}
	bx	lr
.L54:
	.align	2
.L53:
	.word	player
	.size	init_XL_Characters, .-init_XL_Characters
	.align	2
	.global	update_Player
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_Player, %function
update_Player:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L83
	ldrh	r3, [r3]
	ldr	r4, .L83+4
	tst	r3, #64
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	sub	sp, sp, #20
	beq	.L56
	ldr	r2, .L83+8
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L56
	cmp	r1, #1
	subgt	r1, r1, #1
	strgt	r1, [r4]
	ble	.L56
.L57:
	ldr	r6, .L83+12
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L80
.L60:
	cmp	r5, #3
	beq	.L81
.L62:
	ldr	r3, .L83+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L82
.L64:
	mov	r2, #0
	ldr	r3, .L83+20
	lsl	r1, r1, #3
	lsl	r0, r0, #3
	and	r1, r1, #255
	and	r0, r0, #504
	strh	r1, [r3, #32]	@ movhi
	strh	r0, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L56:
	tst	r3, #128
	beq	.L58
	ldr	r2, .L83+8
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L58
	cmp	r1, #18
	addle	r1, r1, #1
	strle	r1, [r4]
	ble	.L57
.L58:
	tst	r3, #32
	beq	.L59
	ldr	r2, .L83+8
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L59
	cmp	r0, #0
	subgt	r0, r0, #1
	strgt	r0, [r4, #4]
	bgt	.L57
.L59:
	tst	r3, #16
	beq	.L57
	ldr	r3, .L83+8
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L57
	ldr	r6, .L83+12
	cmp	r0, #28
	ldr	r5, [r6]
	addle	r0, r0, #1
	strle	r0, [r4, #4]
	cmp	r5, #0
	bne	.L60
.L80:
	ldr	r3, .L83+24
	add	ip, r3, #16
	ldm	ip, {ip, lr}
	ldm	r3, {r2, r3}
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r7, .L83+28
	lsl	r1, r1, #3
	lsl	r0, r0, #3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L61
.L79:
	ldr	r3, .L83+16
	ldr	r3, [r3]
	cmp	r3, #1
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	bne	.L64
.L82:
	ldr	r3, .L83+32
	ldm	r3, {r2, r3, ip, lr}
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	lsl	r1, r1, #3
	ldr	r5, .L83+28
	lsl	r0, r0, #3
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #3
	ldreq	r1, [r4]
	ldrne	r1, [r4]
	strne	r3, [r6]
	ldr	r0, [r4, #4]
	b	.L64
.L81:
	ldr	r3, .L83+36
	add	ip, r3, #16
	ldm	ip, {ip, lr}
	ldm	r3, {r2, r3}
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	lsl	r1, r1, #3
	ldr	r5, .L83+28
	lsl	r0, r0, #3
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #0
	movne	r1, #2
	ldrne	r3, .L83+40
	strne	r1, [r6]
	strne	r2, [r3]
	b	.L79
.L61:
	ldr	r3, .L83+44
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L83+40
	str	r2, [r6]
	str	r5, [r3]
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	b	.L62
.L84:
	.align	2
.L83:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	game_Stage
	.word	door_State
	.word	shadowOAM
	.word	beginner_Enemy
	.word	collision
	.word	next_Level_Door
	.word	intermediate_Enemy
	.word	battle_UI
	.word	hideSprites
	.size	update_Player, .-update_Player
	.align	2
	.global	update_Game
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_Game, %function
update_Game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	update_Player
	ldr	r3, .L87
	mov	lr, pc
	bx	r3
	ldr	r4, .L87+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L87+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	update_Game, .-update_Game
	.align	2
	.global	update_Battle_Controls
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_Battle_Controls, %function
update_Battle_Controls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L112
	ldr	r3, [ip]
	ldr	r1, .L112+4
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	ldr	r0, [r1]
	bne	.L90
	cmp	r0, #4
	ble	.L91
	ldr	r2, .L112+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L91
	ldr	r2, .L112+12
	ldrh	r2, [r2]
	tst	r2, #1
	moveq	r2, #1
	moveq	r0, r3
	moveq	r3, r2
	streq	r2, [ip]
.L91:
	mov	r4, #288
	mov	r6, #126
	mov	r5, #73
	mov	lr, #416
	ldr	r2, .L112+16
	strh	r4, [r2, #68]	@ movhi
	ldr	r4, .L112+20
	strh	r4, [r2, #64]	@ movhi
	ldr	r4, .L112+24
	strh	r6, [r2, #72]	@ movhi
	strh	r5, [r2, #74]	@ movhi
	strh	r4, [r2, #66]	@ movhi
	strh	lr, [r2, #76]	@ movhi
.L90:
	cmp	r3, #1
	addne	r3, r0, #1
	beq	.L110
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L110:
	cmp	r0, #4
	ble	.L109
	ldr	r2, .L112+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L96
	ldr	lr, .L112+12
	ldrh	lr, [lr]
	ands	lr, lr, #1
	bne	.L96
	ldr	r2, .L112+28
	ldr	r2, [r2]
	cmp	r2, #1
	beq	.L111
	cmp	r2, #2
	bne	.L109
	ldr	r5, .L112+32
	ldr	r4, .L112+36
	ldr	r0, [r5]
	ldr	r2, [r4]
	sub	r0, r0, #10
	sub	r2, r2, #50
	str	lr, [ip]
	str	r0, [r5]
	str	r2, [r4]
	b	.L95
.L96:
	tst	r2, #2
	beq	.L109
	ldr	r2, .L112+12
	ldrh	r2, [r2]
	ands	r2, r2, #2
	streq	r2, [ip]
	beq	.L95
.L109:
	add	r3, r0, #1
.L95:
	mov	lr, #73
	mov	ip, #416
	mov	r4, #126
	mov	r0, #448
	ldr	r2, .L112+16
	strh	lr, [r2, #74]	@ movhi
	strh	ip, [r2, #76]	@ movhi
	ldr	lr, .L112+40
	ldr	ip, .L112+44
	strh	r4, [r2, #72]	@ movhi
	strh	lr, [r2, #64]	@ movhi
	strh	ip, [r2, #66]	@ movhi
	strh	r0, [r2, #68]	@ movhi
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L111:
	ldr	r5, .L112+32
	ldr	r4, .L112+48
	ldr	r0, [r5]
	ldr	r2, [r4]
	sub	r0, r0, #5
	sub	r2, r2, #30
	str	lr, [ip]
	str	r0, [r5]
	str	r2, [r4]
	b	.L95
.L113:
	.align	2
.L112:
	.word	battle_UI
	.word	time
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	16499
	.word	-16299
	.word	game_Stage
	.word	player_Health
	.word	intermediate_Enemy_Health
	.word	16510
	.word	16484
	.word	beginner_Enemy_Health
	.size	update_Battle_Controls, .-update_Battle_Controls
	.align	2
	.global	update_Player_Health
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_Player_Health, %function
update_Player_Health:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L120
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r3]
	ldr	r5, .L120+4
	smull	r1, r2, r5, r3
	asr	ip, r3, #31
	rsb	ip, ip, r2, asr #5
	add	r2, ip, ip, lsl #2
	add	r2, r2, r2, lsl #2
	ldr	r4, .L120+8
	sub	r3, r3, r2, lsl #2
	smull	r1, r2, r4, r3
	asr	r0, r3, #31
	rsb	r0, r0, r2, asr #2
	ldr	r2, .L120+12
	ldr	r1, .L120+16
	str	ip, [r2]
	ldr	r2, .L120+20
	ldr	r1, [r1]
	str	r0, [r2]
	add	r2, r0, r0, lsl #2
	sub	r2, r3, r2, lsl #1
	ldr	r3, .L120+24
	cmp	r1, #1
	str	r2, [r3]
	ldreq	r3, .L120+28
	beq	.L119
	cmp	r1, #2
	beq	.L117
	ldr	r1, .L120+32
	ldr	lr, .L120+36
	ldr	r3, .L120+40
	ldr	r4, [r1]
	ldr	r5, [lr]
	ldr	r1, [r3]
	b	.L116
.L117:
	ldr	r3, .L120+44
.L119:
	ldr	r1, [r3]
	smull	r3, r5, r1, r5
	asr	r3, r1, #31
	rsb	r5, r3, r5, asr #5
	add	r3, r5, r5, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #2
	smull	r3, r4, r1, r4
	asr	r3, r1, #31
	rsb	r4, r3, r4, asr #2
	ldr	r3, .L120+32
	add	lr, r4, r4, lsl #2
	str	r4, [r3]
	sub	r1, r1, lr, lsl #1
	ldr	r3, .L120+36
	ldr	lr, .L120+40
	str	r5, [r3]
	str	r1, [lr]
.L116:
	mov	lr, #0
	mov	r10, #8
	mov	r9, #16
	mov	r8, #208
	mov	r7, #216
	mov	r6, #224
	ldr	r3, .L120+48
	add	r5, r5, #928
	add	r4, r4, #928
	add	ip, ip, #928
	add	r0, r0, #928
	add	r2, r2, #928
	add	r1, r1, #928
	strh	r5, [r3, #116]	@ movhi
	strh	r4, [r3, #124]	@ movhi
	strh	r10, [r3, #90]	@ movhi
	strh	r9, [r3, #106]	@ movhi
	strh	r8, [r3, #114]	@ movhi
	strh	r7, [r3, #122]	@ movhi
	strh	r6, [r3, #130]	@ movhi
	strh	lr, [r3, #80]	@ movhi
	strh	lr, [r3, #82]	@ movhi
	strh	lr, [r3, #88]	@ movhi
	strh	lr, [r3, #104]	@ movhi
	strh	lr, [r3, #112]	@ movhi
	strh	lr, [r3, #120]	@ movhi
	strh	lr, [r3, #128]	@ movhi
	strh	ip, [r3, #84]	@ movhi
	strh	r0, [r3, #92]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	strh	r1, [r3, #132]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	player_Health
	.word	1374389535
	.word	1717986919
	.word	player_Hundred
	.word	game_Stage
	.word	player_Ten
	.word	player_One
	.word	beginner_Enemy_Health
	.word	enemy_Ten
	.word	enemy_Hundred
	.word	enemy_One
	.word	intermediate_Enemy_Health
	.word	shadowOAM
	.size	update_Player_Health, .-update_Player_Health
	.align	2
	.global	update_Fight
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_Fight, %function
update_Fight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	update_Battle_Controls
	bl	update_Player_Health
	ldr	r3, .L124
	mov	lr, pc
	bx	r3
	ldr	r4, .L124+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L124+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	update_Fight, .-update_Fight
	.align	2
	.global	return_To_Game
	.syntax unified
	.arm
	.fpu softvfp
	.type	return_To_Game, %function
return_To_Game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L138
	ldr	r1, [ip]
	cmp	r1, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	beq	.L136
	cmp	r1, #2
	bne	.L137
	mov	r5, #512
	mov	fp, #4
	mov	r1, #0
	mvn	r10, #0
	ldr	r4, .L138+4
	mov	lr, #1
	mov	r7, #16
	mov	r6, #112
	mov	r2, r4
	mov	r9, #6
	mov	r8, #14
	mov	r0, r5
	str	fp, [ip]
	mov	r3, r4
	ldr	ip, .L138+8
	strh	r5, [r4, #48]	@ movhi
	ldr	r4, .L138+12
	str	r1, [ip]
	str	r1, [ip, #4]
	str	r1, [r4]
	ldr	r1, .L138+16
	str	r10, [r1]
	ldr	r1, .L138+20
	ldr	ip, .L138+24
	str	lr, [r1]
	ldr	r1, .L138+28
	str	r7, [ip]
	str	r6, [ip, #4]
	str	lr, [r1, #8]
	str	lr, [r1, #12]
	str	r9, [r1]
	str	r8, [r1, #4]
	add	r1, r2, #72
.L131:
	strh	r0, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L131
.L132:
	mov	r3, #112
	mov	r0, #16
.L129:
	mov	r1, #96
	strh	r0, [r2, #56]	@ movhi
	strh	r3, [r2, #58]	@ movhi
	strh	r1, [r2, #60]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L137:
	ldr	r2, .L138+24
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	ldrb	r0, [r2]	@ zero_extendqisi2
	lsr	r3, r3, #23
	ldr	r2, .L138+4
	b	.L129
.L136:
	mov	r5, #512
	mov	lr, #0
	mvn	r10, #0
	mov	r9, #6
	mov	r8, #14
	ldr	r4, .L138+4
	mov	r7, #16
	mov	r6, #112
	mov	r2, r4
	mov	r0, r5
	mov	r3, r4
	str	lr, [ip]
	ldr	ip, .L138+12
	str	lr, [ip]
	ldr	ip, .L138+32
	str	lr, [ip]
	str	lr, [ip, #4]
	ldr	ip, .L138+16
	str	r10, [ip]
	ldr	ip, .L138+28
	str	r9, [ip]
	str	r1, [ip, #8]
	str	r1, [ip, #12]
	str	r8, [ip, #4]
	ldr	ip, .L138+24
	ldr	lr, .L138+20
	strh	r5, [r4, #48]	@ movhi
	str	r7, [ip]
	str	r6, [ip, #4]
	str	r1, [lr]
	add	r1, r4, #72
.L128:
	strh	r0, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r1, r3
	bne	.L128
	b	.L132
.L139:
	.align	2
.L138:
	.word	game_Stage
	.word	shadowOAM
	.word	intermediate_Enemy
	.word	fighting
	.word	battle_UI
	.word	door_State
	.word	next_Level_Door
	.word	player
	.word	beginner_Enemy
	.size	return_To_Game, .-return_To_Game
	.comm	next_Level_Door,16,4
	.comm	intermediate_Enemy,40,4
	.comm	beginner_Enemy,40,4
	.comm	player,40,4
	.comm	shadowOAM,1024,4
	.comm	door_State,4,4
	.comm	enemy_One,4,4
	.comm	enemy_Ten,4,4
	.comm	enemy_Hundred,4,4
	.comm	player_One,4,4
	.comm	player_Ten,4,4
	.comm	player_Hundred,4,4
	.comm	battle_Sprite_Swap,4,4
	.comm	time,4,4
	.comm	battle_UI,4,4
	.comm	fighting,4,4
	.comm	enemies_Left,4,4
	.comm	intermediate_Enemy_Health,4,4
	.comm	beginner_Enemy_Health,4,4
	.comm	player_Health,4,4
	.comm	game_Stage,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
