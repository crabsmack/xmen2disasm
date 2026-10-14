; ---------------------------------------------------------------------------
; sub_13412A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13412A:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8E(a4),d0
	beq.s	loc_134178
	subq.w	#$1,d0
	beq.s	loc_13415E
	subq.w	#$1,d0
	bne.s	loc_134178
	tst.b	$90(a4)
	beq.s	loc_134154
	lea.l	$3692(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_134190
loc_134154:
	lea.l	$36AA(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_134190
loc_13415E:
	tst.b	$90(a4)
	beq.s	loc_13416E
	lea.l	$369A(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_134190
loc_13416E:
	lea.l	$36B2(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_134190
loc_134178:
	tst.b	$90(a4)
	beq.s	loc_134188
	lea.l	$36A2(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_134190
loc_134188:
	lea.l	$36BA(a5),a0
	movea.l	$2(a0),a3
loc_134190:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	d0,-$4(a6)
	lea.l	$14(a7),a7
	beq.s	loc_1341EA
	move.w	$8C(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	#$FF,d1
	or.l	d0,d1
	move.l	d1,-(a7)
	moveq	#-$20,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$3AFA(a5)	; -> sub_13EFA0
	lea.l	$18(a7),a7
loc_1341EA:
	move.l	-$4(a6),$92(a4)
	clr.w	$6C(a4)
	lea.l	sub_134080(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
