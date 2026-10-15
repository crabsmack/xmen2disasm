; ---------------------------------------------------------------------------
; Cyclops_GroundSpecialDown	[jt 2394]
; ---------------------------------------------------------------------------
Cyclops_GroundSpecialDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Cyclops_CrouchAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_CrouchAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
