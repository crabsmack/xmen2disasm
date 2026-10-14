; ---------------------------------------------------------------------------
; sub_13FAA2	[jt 1901]
; ---------------------------------------------------------------------------
sub_13FAA2:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$3BB2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$20(a4)
	lea.l	sub_13FEB6(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	lea.l	sub_1400AA(pc),a0
	move.l	a0,$60(a4)
	move.w	-$1A72(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.l	d7,$92(a4)
	move.l	d6,$96(a4)
	move.b	#$1,$70(a4)
	ori.w	#$80,$6(a4)
	ori.w	#$8,$6(a4)
	ori.w	#$8,$6(a4)
	move.b	#$10,$42(a4)
	move.w	#$128,$22(a4)
	move.w	#$128,$24(a4)
	moveq	#$0,d0
	move.l	d0,$8E(a4)
	move.b	$7(a3),$8B(a4)
	tst.w	$8(a3)
	lea.l	$18(a7),a7
	beq.s	loc_13FB7C
	ori.b	#$4,$2E(a4)
	bra.s	loc_13FB82
loc_13FB7C:
	andi.b	#$FB,$2E(a4)
loc_13FB82:
	tst.w	$A(a3)
	beq.s	loc_13FB8E
	move.w	$A(a3),d0
	bra.s	loc_13FB92
loc_13FB8E:
	move.w	#$100,d0
loc_13FB92:
	move.w	d0,$8C(a4)
	clr.w	$9A(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
