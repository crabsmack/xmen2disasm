; ---------------------------------------------------------------------------
; Synchronizer_DespawnMembers - Synchronizer state: Despawn every member, reset its spawn record position from the placement entry, then destroy the synchronizer
; In:  8(a6) = this
; Out: none
; Evidence: member vtable +$36, own vtable +$1E
; ---------------------------------------------------------------------------
Synchronizer_DespawnMembers:
	link.w	a6,#$FFFC
	movem.l	d6-d7/a3-a4,-(a7)
	clr.w	d7
	bra.s	loc_119A22
loc_1199C4:
	ext.l	d7
	movea.l	$8(a6),a0
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	$4(a0,d0.l),a3
	moveq	#$0,d6
	move.b	$14(a3),d6
	ext.l	d6
	movea.l	-$38DC(a5),a0
	move.l	d6,d0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
	move.l	$A(a4),-$4(a6)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a0
	move.w	$2(a0),$6(a4)
	movea.l	-$4(a6),a0
	move.w	$4(a0),$8(a4)
	addq.w	#$8,a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_119A22:
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$36(a0),d0
	cmp.w	d7,d0
	bgt.s	loc_1199C4
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$1E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$14(a6),d6-d7/a3-a4
	unlk	a6
	rts
