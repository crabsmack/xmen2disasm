; ---------------------------------------------------------------------------
; sub_01C64C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_01C64C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> sub_1F6A32
	move.l	d0,$96(a4)
	movea.l	d0,a3
	move.l	a3,d0
	beq.s	loc_01C6B4
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_01C67A
	ori.b	#$10,$2E(a4)
	bra.s	loc_01C680
loc_01C67A:
	andi.b	#$EF,$2E(a4)
loc_01C680:
	tst.w	$6E(a4)
	bne.s	loc_01C6B4
	tst.l	$9C(a4)
	bne.s	loc_01C698
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01C6B4
loc_01C698:
	clr.w	$9A(a4)
	movea.l	$9C(a4),a0
	addq.l	#$2,a0
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_01C6B4:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
