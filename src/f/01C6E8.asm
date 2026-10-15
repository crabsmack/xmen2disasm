; ---------------------------------------------------------------------------
; sub_01C6E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_01C6E8:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> sub_1F6A32
	move.l	d0,$96(a4)
	movea.l	d0,a3
	lea.l	$482(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_01C772
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_01C728
	ori.b	#$10,$2E(a4)
	bra.s	loc_01C72E
loc_01C728:
	andi.b	#$EF,$2E(a4)
loc_01C72E:
	tst.w	$6E(a4)
	bne.s	loc_01C772
	tst.l	$9C(a4)
	bne.s	loc_01C746
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01C772
loc_01C746:
	addq.w	#$1,$9A(a4)
	movea.l	$9C(a4),a0
	move.w	$9A(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_01C75A
	clr.w	$9A(a4)
loc_01C75A:
	movea.l	$9C(a4),a0
	addq.l	#$2,a0
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_01C772:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
