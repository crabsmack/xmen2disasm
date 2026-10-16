; ---------------------------------------------------------------------------
; SavageA3_CamSetHooks - SavageA3 camera post-update hook (Cam_New, +$1C): the SavageA2 flood camera hooks, bounds +$40 = 100, +$42 = $A0
; In:  8(a6) = camera
; Out: none
; Evidence: camera +4 = SavageA2_CamUpdateFlood, +$C = SavageA2_CamApply
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_CamSetHooks:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1C0A(a5),a0
	move.l	a0,$4(a4)
	lea.l	$1C12(a5),a0
	move.l	a0,$C(a4)
	move.w	#$64,$40(a4)
	move.w	#$A0,$42(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
