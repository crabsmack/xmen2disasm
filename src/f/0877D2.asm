; ---------------------------------------------------------------------------
; sub_0877D2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0877D2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$130,d0
	ble.s	loc_0877FE
	clr.w	$6C(a4)
	lea.l	sub_0877D2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_08782A
loc_0877FE:
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	clr.w	$6C(a4)
	lea.l	sub_087832(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_08782A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
