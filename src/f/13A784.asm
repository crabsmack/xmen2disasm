; ---------------------------------------------------------------------------
; Mine_Init - Mine: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$39CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	ori.w	#$4081,$6(a4)
	move.w	g_MineSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	clr.w	$90(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
