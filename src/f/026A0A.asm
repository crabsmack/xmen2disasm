; ---------------------------------------------------------------------------
; RetractFloor_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a RETRACTFLOOR
; In:  8(a6) = this (RETRACTFLOOR object)
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
	move.w	-$3CCE(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
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
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a3
	move.l	a3,$90(a4)
	lea.l	sub_026D8E(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
