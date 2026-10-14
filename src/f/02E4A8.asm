; ---------------------------------------------------------------------------
; sub_02E4A8	[jt 215]
; ---------------------------------------------------------------------------
sub_02E4A8:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$6EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$7082,$6(a4)
	move.w	-$3CB2(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	lea.l	$18(a7),a7
	ori.b	#$4,$2E(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	sub_02DFA4(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	subq.b	#$2,$42(a4)
	clr.l	$94(a4)
	clr.w	$98(a4)
	move.l	a3,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
