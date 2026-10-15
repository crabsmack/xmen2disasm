; ---------------------------------------------------------------------------
; CloneA1_InitSprites - set up the three CloneA1 sprite slots (jt $7658A frames 0-2) with their map rows
; In:  none
; Out: none
; Evidence: Spr_Init on -$3596/-$3582/-$356E at tile -$3AAE + 0/$10/$20; sub_1F5500/Map_SetRowPalette on the map at -$3AA6
; ---------------------------------------------------------------------------
CloneA1_InitSprites:
	link.w	a6,#$0
	jsr	CloneA1_NopStatic(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E0A(a5)	; -> sub_1F5500
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E0A(a5)	; -> sub_1F5500
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	-$3AA8(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$356E(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
