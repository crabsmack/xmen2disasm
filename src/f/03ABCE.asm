; ---------------------------------------------------------------------------
; RollingDiscs_ReverseAtY - reverse the rolling-disc band covering height y (velocity, or acceleration if set)
; In:  8(a6) = word y px
; Out: d0
; Evidence: called by BaniMazaA1_SwitchTileHook with row*32
; ---------------------------------------------------------------------------
RollingDiscs_ReverseAtY:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$A(a6),d6
	move.w	-$3C7A(a5),d0
	ext.l	d0
	move.l	d0,d7
	movea.l	-$3C7E(a5),a4
	bra.s	loc_03AC28
loc_03ABE8:
	cmp.w	$2(a4),d6
	ble.s	loc_03AC20
	ext.l	d6
	move.w	$2(a4),d0
	ext.l	d0
	add.l	#$80,d0
	cmp.l	d6,d0
	ble.s	loc_03AC20
	tst.w	$10(a4)
	beq.s	loc_03AC14
	move.w	$10(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$10(a4)
	bra.s	loc_03AC20
loc_03AC14:
	move.w	$C(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$C(a4)
loc_03AC20:
	move.l	d7,d0
	subq.l	#$1,d7
	lea.l	$14(a4),a4
loc_03AC28:
	tst.l	d7
	bne.s	loc_03ABE8
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
