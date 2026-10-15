; ---------------------------------------------------------------------------
; sub_1CEB18	[jt 2306]
; ---------------------------------------------------------------------------
sub_1CEB18:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6A(a0),a1
	jsr	(a1)
	lea.l	$47BA(a5),a0
	move.l	$2(a0),$8C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	$A6(a0),$64(a4)
	lea.l	$4D22(a5),a0
	move.l	a0,$60(a4)
	clr.l	$16(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$18(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CEB9C
	move.w	-$3BB2(a5),d1
	bra.s	loc_1CEBA0
loc_1CEB9C:
	move.w	-$3BB4(a5),d1
loc_1CEBA0:
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	lea.l	$3D9A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	lea.l	$30(a7),a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
