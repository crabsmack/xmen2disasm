; ---------------------------------------------------------------------------
; SavageA4_CamSetHooks - SavageA4 camera creation hook: dead zones $A0/$A0, update SavageA4_CamUpdate
; In:  8(a6) = camera
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_CamSetHooks:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A0,$3C(a4)
	move.w	#$A0,$3E(a4)
	lea.l	SavageA4_CamUpdate(pc),a0
	move.l	a0,$8(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
