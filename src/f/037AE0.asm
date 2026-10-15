; ---------------------------------------------------------------------------
; ThronePhone_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a THRONEPHONE
; In:  8(a6) = this (THRONEPHONE object)
; Out: none
; Evidence: class descriptor THRONEPHONE slot +$12 (tools/classes.py); TAS frames 19372-19372 (1 active)
; ---------------------------------------------------------------------------
ThronePhone_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$7DA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	sub_037E58(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_037E58(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$5083,$6(a4)
	move.w	-$3CAA(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	clr.w	$90(a4)
	clr.b	$92(a4)
	clr.w	$98(a4)
	clr.w	$A0(a4)
	moveq	#$0,d0
	move.b	$92(a4),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
