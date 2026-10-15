; ---------------------------------------------------------------------------
; RetractFloor_Init - parent Init, then no vertical speed, flags |= $4083, sprite set -$3CCE (palette line 0), opening +$8C = 0, find the type-$13 floor segment at its 32-px cell (Seg_FindInBlock) into +$90, state RetractFloor_StateInit (+$5C/+$64) (RETRACTFLOOR override of slot +$12 Init)
; In:  8(a6) = this (RETRACTFLOOR object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = spawn param
; Out: none
; Evidence: class descriptor RETRACTFLOOR slot +$12 (tools/classes.py); TAS frames 14236-16679 (17 active)
; ---------------------------------------------------------------------------
RetractFloor_Init:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$582(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	ori.w	#$4083,$6(a4)
	move.w	g_RetractFloorSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	clr.l	$8C(a4)
	moveq	#$D,d0
	move.l	$8(a4),d6
	asr.l	d0,d6
	moveq	#$D,d0
	move.l	$C(a4),d7
	asr.l	d0,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$13,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> Seg_FindInBlock
	movea.l	d0,a3
	move.l	a3,$90(a4)
	lea.l	RetractFloor_StateInit(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
