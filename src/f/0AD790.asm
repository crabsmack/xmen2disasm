; ---------------------------------------------------------------------------
; SavageA2_CamSetHooks - SavageA2 camera creation hook: install SavageA2_CamUpdateFlood / SavageA2_CamApply, bounds +$40 = 100, +$42 = $A0
; In:  8(a6) = camera
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_CamSetHooks:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	SavageA2_CamUpdateFlood(pc),a0
	move.l	a0,$4(a4)
	lea.l	SavageA2_CamApply(pc),a0
	move.l	a0,$C(a4)
	move.w	#$64,$40(a4)
	move.w	#$A0,$42(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
