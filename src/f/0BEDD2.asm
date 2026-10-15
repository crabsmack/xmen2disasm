; ---------------------------------------------------------------------------
; SporeMine_Init - vtable +$12 constructor: run the parent's Init, then set up a SPOREMINE
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the SPOREMINE descriptor $0BF580; never runs in the corpus; calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
SporeMine_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$21B2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	ori.w	#$4081,$6(a4)
	move.w	-$3C22(a5),d0
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
