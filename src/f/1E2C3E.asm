; ---------------------------------------------------------------------------
; sub_1E2C3E	[jt 2389]
; ---------------------------------------------------------------------------
sub_1E2C3E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a4
	move.w	-$1754(a5),d1
	ext.l	d1
	move.w	#$C000,d2
	and.w	d1,d2
	moveq	#$0,d1
	move.w	d2,d1
	cmpi.l	#$8000,d1
	bne.s	loc_1E2C74
	lea.l	$2BCA(a5),a0
	move.l	-$1758(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1E2C74
	lea.l	-$1758(a5),a4
	bra.s	loc_1E2C9E
loc_1E2C74:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1E2C9E
	lea.l	$2BCA(a5),a0
	move.l	-$1848(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1E2C9E
	lea.l	-$1848(a5),a4
loc_1E2C9E:
	move.l	a4,d0
	beq.s	loc_1E2CB4
	tst.l	$BE(a4)
	beq.s	loc_1E2CB4
	move.l	a4,-(a7)
	jsr	sub_1E2CBC(pc)
	jsr	$49CA(a5)	; -> sub_1E15F4
	addq.w	#$4,a7
loc_1E2CB4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
