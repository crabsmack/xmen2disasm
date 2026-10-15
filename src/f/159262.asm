; ---------------------------------------------------------------------------
; Magneto_ShotAnim_Ret - Magneto_ShotAnim shared epilogue: restore registers and return
; In:  a6 frame of Magneto_ShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the cases of Magneto_ShotAnim
; ---------------------------------------------------------------------------
Magneto_ShotAnim_Ret:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
