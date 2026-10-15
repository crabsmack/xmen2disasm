; ---------------------------------------------------------------------------
; Barbarian_Init - vtable +$12 constructor: stats $0BD42E, sprite set $0CC87E, walk speed +$98 (900 or placement +6), find its platforms
; Evidence: Barbarian_FindPlatforms; first state Barbarian_StateStart; TAS 27990-32925
; ---------------------------------------------------------------------------
Barbarian_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$211A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$2082(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$10(a7),a7
	ori.w	#$4080,$6(a4)
	lea.l	$235A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	moveq	#$0,d0
	move.l	d0,$A2(a4)
	move.w	#$384,$98(a4)
	move.l	a3,d1
	beq.s	loc_0BE726
	tst.w	$6(a3)
	beq.s	loc_0BE726
	move.w	$6(a3),$98(a4)
loc_0BE726:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	Barbarian_FindPlatforms(pc)
	clr.b	$BF(a4)
	clr.b	$C0(a4)
	lea.l	Barbarian_StateStart(pc),a0
	move.l	a0,$5C(a4)
	clr.b	$BB(a4)
	addq.w	#$8,a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
