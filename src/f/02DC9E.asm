; ---------------------------------------------------------------------------
; sub_02DC9E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02DC9E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_02DCDC
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_02DCDC
	move.l	$76(a4),d0
	cmp.l	$C(a6),d0
	bne.s	loc_02DCDC
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	addq.w	#$4,a7
loc_02DCDC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
