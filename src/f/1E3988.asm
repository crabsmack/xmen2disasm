; ---------------------------------------------------------------------------
; Cyclops_GroundAim	[link-after-rts]
; ---------------------------------------------------------------------------
Cyclops_GroundAim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	lea.l	Cyclops_StateGroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_StateGroundAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
