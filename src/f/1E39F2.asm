; ---------------------------------------------------------------------------
; Cyclops_GroundSpecial - CYCLOPS slot +$DE: A on the ground: aim and fire the optic beam (Cyclops_GroundAim)
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Cyclops_GroundAim; same body as Cyclops_GroundSpecialUp
; ---------------------------------------------------------------------------
Cyclops_GroundSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Cyclops_GroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_GroundAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
