; ---------------------------------------------------------------------------
; Magneto_AirShotAnim_Ret - Magneto_AirShotAnim shared epilogue: restore registers and return
; In:  a6 frame of Magneto_AirShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the cases of Magneto_AirShotAnim
; ---------------------------------------------------------------------------
Magneto_AirShotAnim_Ret:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
