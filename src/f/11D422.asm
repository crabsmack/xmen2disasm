; ---------------------------------------------------------------------------
; BabyBio_ActAttachFlame - BABYBIO script action: create a BIOFLAME attached at (15,-28) facing the same way, keep it in +$A8, next entry
; In:  8(a6) = this
; Out: d0
; Evidence: class New via jt $3082 (Tbl_BioFlame_vtable); flame +$8C = owner, +$90/+$92 offset
; ---------------------------------------------------------------------------
BabyBio_ActAttachFlame:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$F,d6
	moveq	#-$1C,d7
	tst.l	$A8(a4)
	beq.s	loc_11D44E
	movea.l	$A8(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
loc_11D44E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$3082(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$3082(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_11D4A8
	move.l	a3,$A8(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D48E
	ori.b	#$10,$2E(a3)
loc_11D48E:
	move.l	a4,$8C(a3)
	move.w	d6,$90(a3)
	move.w	d7,$92(a3)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D4A8
	ori.b	#$4,$2E(a3)
loc_11D4A8:
	tst.l	$98(a4)
	bne.s	loc_11D4BA
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D4E6
loc_11D4BA:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D4CE
	clr.w	$96(a4)
loc_11D4CE:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11D4E6:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
