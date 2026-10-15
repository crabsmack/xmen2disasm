; ---------------------------------------------------------------------------
; Magneto_ShotEndAnim_Ret - Magneto_ShotEndAnim shared epilogue: restore registers and return
; In:  a6 frame of Magneto_ShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the cases of Magneto_ShotEndAnim
; ---------------------------------------------------------------------------
Magneto_ShotEndAnim_Ret:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
