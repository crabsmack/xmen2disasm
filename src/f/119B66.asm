; ---------------------------------------------------------------------------
; Synchronizer_RunMembers - Synchronizer state: Update every member; when all report MemberOutsideWindow go to DeactivateMembers
; In:  8(a6) = this
; Out: none
; Evidence: member vtable +$4A Update and +$72; TAS 476 frames
; ---------------------------------------------------------------------------
Synchronizer_RunMembers:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d6
	clr.w	d7
	bra.s	loc_119BA4
loc_119B78:
	ext.l	d7
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	$4(a3,d0.l),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_119BA0
	move.w	d6,d0
	addq.w	#$1,d6
loc_119BA0:
	move.w	d7,d0
	addq.w	#$1,d7
loc_119BA4:
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmp.w	d7,d0
	bgt.s	loc_119B78
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmp.w	d6,d0
	bne.s	loc_119BC0
	lea.l	Synchronizer_DeactivateMembers(pc),a0
	move.l	a0,$2C(a3)
loc_119BC0:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
