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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r1, #640
	mov	r0, #2
	ldr	ip, .L8+4
	ldr	lr, .L8+8
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
	mov	r2, #296
	ldr	r1, .L8+12
	ldr	ip, .L8+16
	ldr	r0, .L8+20
	strh	r2, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	strh	ip, [r1, #2]	@ movhi
	ldr	r4, .L8+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	100694016
	.word	670
	.word	shadowOAM
	.word	-16299
	.word	16464
	.word	DMANow
	.word	waitForVBlank
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
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r5, #67108864
	ldr	r4, .L12
	strh	r2, [r5]	@ movhi
	mov	r3, #144
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r2, #3840
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L12+28
	ldr	r1, .L12+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+36
	ldr	r1, .L12+40
	ldrh	r0, [r3]
	ldr	r2, .L12+44
	strh	r0, [r1]	@ movhi
	ldrh	r1, [r2, #48]
	ldr	r2, .L12+48
	strh	r1, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	pop	{r4, r5, r6, lr}
	b	goToStart
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	tilemapTiles
	.word	tilemapPal
	.word	100694016
	.word	tilemapMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose.part.0, %function
lose.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	r2, #512
	ldr	r3, .L16+4
	strh	r2, [r3, #16]	@ movhi
	b	goToStart
.L17:
	.align	2
.L16:
	.word	buttons
	.word	shadowOAM
	.size	lose.part.0, .-lose.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	r2, #512
	ldr	r3, .L20+4
	strh	r2, [r3, #24]	@ movhi
	b	goToStart
.L21:
	.align	2
.L20:
	.word	buttons
	.word	shadowOAM
	.size	win.part.0, .-win.part.0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"press START to play\000"
	.align	2
.LC1:
	.ascii	"Instruction Page\000"
	.align	2
.LC2:
	.ascii	"Blue = Beginner Enemy Level\000"
	.align	2
.LC3:
	.ascii	"Red = Intermediate Enemy Level\000"
	.align	2
.LC4:
	.ascii	"ARROW KEYS for Movement\000"
	.align	2
.LC5:
	.ascii	"A/B for traversing Battle UI\000"
	.align	2
.LC6:
	.ascii	"Collision for Battle!\000"
	.align	2
.LC7:
	.ascii	"Black Square WIP\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L24+4
	ldr	r5, .L24+8
	strh	r2, [r3]	@ movhi
	mov	r0, #0
	ldr	r3, .L24+12
	ldr	r4, .L24+16
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r1, #0
	mov	r0, #57
	ldr	r2, .L24+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #10
	mov	r0, #57
	ldr	r2, .L24+24
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #20
	mov	r0, #57
	ldr	r2, .L24+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #30
	mov	r0, #57
	ldr	r2, .L24+32
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #40
	mov	r0, #57
	ldr	r2, .L24+36
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #50
	mov	r0, #57
	ldr	r2, .L24+40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #60
	mov	r0, #57
	ldr	r2, .L24+44
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L24+48
	mov	r1, #70
	mov	r0, #57
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L24+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	hideSprites
	.word	1027
	.word	32767
	.word	fillScreen3
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L38
	ldr	r4, .L38+4
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	mov	r1, #512
	ldr	r2, .L38+12
	ldr	r3, .L38+16
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L38+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L36:
	mov	r2, #512
	ldr	r3, .L38+12
	strh	r2, [r3]	@ movhi
	bl	goToInstructions
	ldrh	r3, [r5]
	b	.L27
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	shadowOAM
	.word	init_Game
	.word	state
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L52
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L52+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L41:
	tst	r3, #4
	beq	.L40
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L51
.L40:
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	mov	r5, #67108864
	mov	r2, #4352
	ldr	r4, .L52+8
	strh	r2, [r5]	@ movhi
	mov	r3, #144
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L52+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L52+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L52+20
	ldr	r1, .L52+24
	mov	lr, pc
	bx	r4
	mov	r2, #3840
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L52+28
	ldr	r1, .L52+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L52+36
	ldr	r1, .L52+40
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L50:
	mov	r6, #67108864
	mov	r2, #4352
	ldr	r5, .L52+8
	mov	r3, #144
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	ldr	r1, .L52+12
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L52+16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L52+20
	ldr	r1, .L52+24
	mov	lr, pc
	bx	r5
	mov	r2, #3840
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L52+32
	ldr	r2, .L52+28
	mov	lr, pc
	bx	r5
	ldr	r2, .L52+36
	ldr	r1, .L52+40
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L52+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+52
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L52+56
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L41
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	buttons
	.word	DMANow
	.word	tilemapTiles
	.word	tilemapPal
	.word	100694016
	.word	tilemapMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	init_Game
	.word	waitForVBlank
	.word	state
	.size	instructions, .-instructions
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
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L56+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToFightBeginner
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFightBeginner, %function
goToFightBeginner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+8
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	r2, #6
	ldr	r1, .L60+12
	ldr	r3, .L60+16
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	hideSprites
	.word	init_BG_Beginner_Fight
	.word	waitForVBlank
	.word	fighting
	.word	state
	.size	goToFightBeginner, .-goToFightBeginner
	.align	2
	.global	goToIntermediateStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToIntermediateStage, %function
goToIntermediateStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L64
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+12
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L64+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L65:
	.align	2
.L64:
	.word	hideSprites
	.word	init_BG_Intermediate_Stage
	.word	init_Intermediate_Characters
	.word	waitForVBlank
	.word	state
	.size	goToIntermediateStage, .-goToIntermediateStage
	.align	2
	.global	goToFightIntermediate
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFightIntermediate, %function
goToFightIntermediate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L68
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	r2, #7
	ldr	r1, .L68+12
	ldr	r3, .L68+16
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	hideSprites
	.word	init_BG_Intermediate_Fight
	.word	waitForVBlank
	.word	fighting
	.word	state
	.size	goToFightIntermediate, .-goToFightIntermediate
	.align	2
	.global	goToXL_Stage
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToXL_Stage, %function
goToXL_Stage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #4608
	ldr	r4, .L72+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L72+8
	mov	lr, pc
	bx	r4
	mov	r3, #2288
	mov	r0, #3
	ldr	r2, .L72+12
	ldr	r1, .L72+16
	mov	lr, pc
	bx	r4
	ldr	r1, .L72+20
	mov	r3, #3072
	mov	r0, #3
	ldr	r2, .L72+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L72+28
	ldr	r3, .L72+32
	strh	r2, [r5, #10]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+36
	mov	lr, pc
	bx	r3
	mov	r2, #9
	ldr	r3, .L72+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L73:
	.align	2
.L72:
	.word	hideSprites
	.word	DMANow
	.word	XL_MapPal
	.word	100679680
	.word	XL_MapTiles
	.word	XL_MapMap
	.word	100696064
	.word	-28667
	.word	init_XL_Characters
	.word	waitForVBlank
	.word	state
	.size	goToXL_Stage, .-goToXL_Stage
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
	mov	r2, #256
	ldr	r1, .L76
	ldr	ip, .L76+4
	ldr	r0, .L76+8
	push	{r4, lr}
	mov	r3, #512
	strh	r2, [r1, #12]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	strh	ip, [r1, #10]	@ movhi
	ldr	r4, .L76+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L76+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L76+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L77:
	.align	2
.L76:
	.word	shadowOAM
	.word	16469
	.word	16464
	.word	DMANow
	.word	waitForVBlank
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
	ldr	r4, .L97
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L79
	ldr	r2, .L97+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L93
.L79:
	tst	r3, #4
	beq	.L78
	ldr	r3, .L97+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L94
.L78:
	pop	{r4, lr}
	bx	lr
.L93:
	ldr	r2, .L97+8
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L95
	cmp	r2, #1
	beq	.L96
	cmp	r2, #2
	bne	.L79
	bl	goToFightIntermediate
	ldrh	r3, [r4]
	b	.L79
.L94:
	pop	{r4, lr}
	b	goToStart
.L95:
	mov	r1, #512
	ldr	r2, .L97+12
	ldr	r3, .L97+16
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L97+20
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L79
.L96:
	mov	r2, #512
	ldr	r3, .L97+12
	strh	r2, [r3, #8]	@ movhi
	bl	goToFightBeginner
	ldrh	r3, [r4]
	b	.L79
.L98:
	.align	2
.L97:
	.word	oldButtons
	.word	buttons
	.word	game_Stage
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	pause, .-pause
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
	push	{r4, lr}
	ldr	r3, .L105
	mov	lr, pc
	bx	r3
	mov	r1, #640
	mov	r0, #4
	ldr	ip, .L105+4
	ldr	lr, .L105+8
.L100:
	sub	r3, r1, #640
.L101:
	lsl	r2, r3, #1
	add	r3, r3, #32
	cmp	r3, r1
	strh	r0, [ip, r2]	@ movhi
	bne	.L101
	add	r1, r3, #1
	cmp	r1, lr
	bne	.L100
	mov	r2, #192
	ldr	r1, .L105+12
	ldr	ip, .L105+16
	ldr	r0, .L105+20
	strh	r2, [r1, #20]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	strh	ip, [r1, #18]	@ movhi
	ldr	r4, .L105+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L105+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L105+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L106:
	.align	2
.L105:
	.word	hideSprites
	.word	100694016
	.word	670
	.word	shadowOAM
	.word	16469
	.word	16464
	.word	DMANow
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
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
	ldr	r3, .L109
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.0
.L110:
	.align	2
.L109:
	.word	oldButtons
	.size	lose, .-lose
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
	push	{r4, lr}
	ldr	r3, .L117
	mov	lr, pc
	bx	r3
	mov	r1, #640
	mov	r0, #5
	ldr	ip, .L117+4
	ldr	lr, .L117+8
.L112:
	sub	r3, r1, #640
.L113:
	lsl	r2, r3, #1
	add	r3, r3, #32
	cmp	r3, r1
	strh	r0, [ip, r2]	@ movhi
	bne	.L113
	add	r1, r3, #1
	cmp	r1, lr
	bne	.L112
	mov	r2, #160
	ldr	r1, .L117+12
	ldr	ip, .L117+16
	ldr	r0, .L117+20
	strh	r2, [r1, #28]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	strh	ip, [r1, #26]	@ movhi
	ldr	r4, .L117+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L117+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L117+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L118:
	.align	2
.L117:
	.word	hideSprites
	.word	100694016
	.word	670
	.word	shadowOAM
	.word	16469
	.word	16464
	.word	DMANow
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L139
	ldr	r4, .L139+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L120
	ldr	r2, .L139+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L133
.L120:
	tst	r3, #4
	beq	.L121
	ldr	r3, .L139+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L134
.L121:
	ldr	r3, .L139+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L135
	cmp	r3, #2
	beq	.L136
	cmp	r3, #3
	beq	.L137
	cmp	r3, #5
	beq	.L138
	pop	{r4, lr}
	bx	lr
.L135:
	pop	{r4, lr}
	b	goToFightBeginner
.L134:
	bl	goToWin
	b	.L121
.L133:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L120
.L138:
	pop	{r4, lr}
	b	goToXL_Stage
.L136:
	pop	{r4, lr}
	b	goToFightIntermediate
.L137:
	pop	{r4, lr}
	b	goToIntermediateStage
.L140:
	.align	2
.L139:
	.word	update_Game
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	game_Stage
	.size	game, .-game
	.align	2
	.global	fight_Beginner
	.syntax unified
	.arm
	.fpu softvfp
	.type	fight_Beginner, %function
fight_Beginner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L157
	ldr	r3, .L157+4
	ldr	r4, .L157+8
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L142
	ldr	r2, .L157+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L153
.L142:
	tst	r3, #4
	beq	.L143
	ldr	r3, .L157+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L154
.L143:
	ldr	r3, .L157+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L155
.L144:
	ldr	r3, .L157+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L156
	pop	{r4, r5, r6, lr}
	bx	lr
.L156:
	ldr	r2, .L157+24
	ldr	r3, [r2]
	ldr	r1, .L157+28
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r3, .L157+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L157+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L157+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L155:
	bl	goToLose
	b	.L144
.L154:
	bl	goToWin
	b	.L143
.L153:
	bl	goToPause
	ldrh	r3, [r5]
	b	.L142
.L158:
	.align	2
.L157:
	.word	oldButtons
	.word	update_Fight
	.word	waitForVBlank
	.word	buttons
	.word	player_Health
	.word	beginner_Enemy_Health
	.word	enemies_Left
	.word	hideSprites
	.word	return_To_Game
	.word	init_BG
	.word	state
	.size	fight_Beginner, .-fight_Beginner
	.align	2
	.global	intermediate_Stage
	.syntax unified
	.arm
	.fpu softvfp
	.type	intermediate_Stage, %function
intermediate_Stage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L173
	ldr	r4, .L173+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L173+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L160
	ldr	r2, .L173+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L170
.L160:
	tst	r3, #4
	beq	.L161
	ldr	r3, .L173+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L171
.L161:
	ldr	r3, .L173+16
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L172
	pop	{r4, lr}
	bx	lr
.L172:
	pop	{r4, lr}
	b	goToFightIntermediate
.L171:
	bl	goToWin
	b	.L161
.L170:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L160
.L174:
	.align	2
.L173:
	.word	update_Game
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	game_Stage
	.size	intermediate_Stage, .-intermediate_Stage
	.align	2
	.global	fight_Intermediate
	.syntax unified
	.arm
	.fpu softvfp
	.type	fight_Intermediate, %function
fight_Intermediate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L191
	ldr	r3, .L191+4
	ldr	r4, .L191+8
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L176
	ldr	r2, .L191+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L187
.L176:
	tst	r3, #4
	beq	.L177
	ldr	r3, .L191+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L188
.L177:
	ldr	r3, .L191+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L189
.L178:
	ldr	r3, .L191+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L190
	pop	{r4, r5, r6, lr}
	bx	lr
.L190:
	ldr	r2, .L191+24
	ldr	r3, [r2]
	ldr	r1, .L191+28
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r3, .L191+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L191+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L191+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L189:
	bl	goToLose
	b	.L178
.L188:
	bl	goToWin
	b	.L177
.L187:
	bl	goToPause
	ldrh	r3, [r5]
	b	.L176
.L192:
	.align	2
.L191:
	.word	oldButtons
	.word	update_Fight
	.word	waitForVBlank
	.word	buttons
	.word	player_Health
	.word	intermediate_Enemy_Health
	.word	enemies_Left
	.word	hideSprites
	.word	return_To_Game
	.word	init_BG_Intermediate_Stage
	.word	state
	.size	fight_Intermediate, .-fight_Intermediate
	.align	2
	.global	XL_Stage
	.syntax unified
	.arm
	.fpu softvfp
	.type	XL_Stage, %function
XL_Stage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L205
	ldr	r4, .L205+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L205+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L194
	ldr	r2, .L205+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L203
.L194:
	tst	r3, #4
	beq	.L193
	ldr	r3, .L205+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L204
.L193:
	pop	{r4, lr}
	bx	lr
.L204:
	pop	{r4, lr}
	b	goToWin
.L203:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L194
.L206:
	.align	2
.L205:
	.word	update_Game
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	XL_Stage, .-XL_Stage
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
	ldr	r6, .L226
	ldr	r8, .L226+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L226+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L226+12
	ldr	r2, [r6]
	ldrh	r0, [r8]
	ldr	fp, .L226+16
	ldr	r10, .L226+20
	ldr	r9, .L226+24
	ldr	r7, .L226+28
	ldr	r4, .L226+32
.L209:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #9
	ldrls	pc, [pc, r2, asl #2]
	b	.L222
.L211:
	.word	.L220
	.word	.L219
	.word	.L218
	.word	.L217
	.word	.L216
	.word	.L215
	.word	.L214
	.word	.L213
	.word	.L212
	.word	.L210
.L212:
	ldr	r3, .L226+36
	mov	lr, pc
	bx	r3
.L210:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L213:
	ldr	r3, .L226+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L214:
	ldr	r3, .L226+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L215:
	tst	r0, #8
	beq	.L222
	ldr	r3, .L226+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L216:
	tst	r0, #8
	beq	.L222
	ldr	r3, .L226+52
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L217:
	ldr	r3, .L226+56
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L218:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L219:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L220:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L209
.L222:
	mov	r0, r3
	b	.L209
.L227:
	.align	2
.L226:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	XL_Stage
	.word	67109120
	.word	intermediate_Stage
	.word	fight_Intermediate
	.word	fight_Beginner
	.word	lose.part.0
	.word	win.part.0
	.word	pause
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	ldr	r3, .L230
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L231:
	.align	2
.L230:
	.word	oldButtons
	.size	win, .-win
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
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
