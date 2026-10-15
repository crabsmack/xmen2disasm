; ---------------------------------------------------------------------------
; Cyclops_GroundSpecialDown - CYCLOPS slot +$E2: Down+A on the ground: crouched beam (Cyclops_CrouchAim)
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Cyclops_CrouchAim
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
