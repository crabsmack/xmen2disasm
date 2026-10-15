; ---------------------------------------------------------------------------
; Magneto_AirShotEndAnim_Ret - Magneto_AirShotEndAnim shared epilogue: restore registers and return
; In:  a6 frame of Magneto_AirShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the cases of Magneto_AirShotEndAnim
; ---------------------------------------------------------------------------
Magneto_AirShotEndAnim_Ret:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
