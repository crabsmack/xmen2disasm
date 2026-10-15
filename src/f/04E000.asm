; ---------------------------------------------------------------------------
; ApocBomb_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a APOCBOMB
; In:  8(a6) = this (APOCBOMB object)
; Out: none
; Evidence: class descriptor APOCBOMB slot +$12 (tools/classes.py); TAS frames 24409-25804 (13 active)
; ---------------------------------------------------------------------------
ApocBomb_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$BDA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	-$3C6E(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$1,$70(a4)
	ori.w	#$1082,$6(a4)
	clr.w	$98(a4)
	move.w	#$1,$92(a4)
	lea.l	$B4A(a5),a0
	move.l	$2(a0),$A0(a4)
	move.l	#$B400,$8C(a4)
	move.w	-$3C70(a5),$90(a4)
	moveq	#$0,d0
	move.l	d0,$9A(a4)
	clr.w	$9E(a4)
	clr.l	$94(a4)
	move.w	-$3B08(a5),d1
	addq.w	#$1,-$3B08(a5)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
