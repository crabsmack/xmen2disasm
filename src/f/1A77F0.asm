; ---------------------------------------------------------------------------
; sub_1A77F0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A77F0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6A(a4)
	andi.l	#$FFFFFFBF,$90(a4)
	clr.w	$10(a4)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1A781C
	andi.l	#$FF7FFFFF,$90(a4)
loc_1A781C:
	andi.l	#$FFDFFFFF,$90(a4)
	movea.l	-$35B6(a5),a0
	andi.w	#$FFEF,$4A(a0)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
