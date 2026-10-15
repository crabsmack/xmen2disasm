; ---------------------------------------------------------------------------
; Synchronizer_WaitMembers - Synchronizer state: if any member is back in its window go to ActivateMembers; if all spawn records are out of view go to DespawnMembers
; In:  8(a6) = this
; Out: none
; Evidence: member vtable +$6E and +$76
; ---------------------------------------------------------------------------
Synchronizer_WaitMembers:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d6
	clr.w	d7
	bra.s	loc_119AFA
loc_119A9E:
	ext.l	d7
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	$4(a3,d0.l),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_119AC2
	lea.l	Synchronizer_ActivateMembers(pc),a0
	move.l	a0,$2C(a3)
	bra.s	loc_119AF6
loc_119AC2:
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	-$38DC(a5),a0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	pea.l	(a0,d0.l)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_119AF6
	move.w	d6,d0
	addq.w	#$1,d6
loc_119AF6:
	move.w	d7,d0
	addq.w	#$1,d7
loc_119AFA:
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmp.w	d7,d0
	bgt.s	loc_119A9E
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmp.w	d6,d0
	bne.s	loc_119B16
	lea.l	Synchronizer_DespawnMembers(pc),a0
	move.l	a0,$2C(a3)
loc_119B16:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
