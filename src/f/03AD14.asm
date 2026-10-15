; ---------------------------------------------------------------------------
; RollingDiscs_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a ROLLINGDISCS
; In:  8(a6) = this (ROLLINGDISCS object)
; Out: none
; Evidence: class descriptor ROLLINGDISCS slot +$12 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
RollingDiscs_Init:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-$3C78(a5)
	ori.w	#$1082,$6(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	move.b	#$A,$70(a4)
	move.w	#$2,$68(a4)
	clr.b	$42(a4)
	tst.w	$6(a3)
	beq.s	loc_03AD7C
	move.w	$6(a3),d0
	bra.s	loc_03AD80
loc_03AD7C:
	move.w	#$200,d0
loc_03AD80:
	move.w	d0,$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_03AD92
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_03AD9A
loc_03AD92:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_03AD9A:
	move.w	d0,$22(a4)
	clr.b	$8B(a4)
	move.l	-$3C7E(a5),$8C(a4)
	lea.l	sub_03A87A(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	lea.l	$10(a7),a7
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
