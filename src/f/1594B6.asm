; ---------------------------------------------------------------------------
; Magneto_ShotOriginAir_Ret - Magneto_ShotOriginAir shared epilogue: restore registers and return
; In:  a6 frame of Magneto_ShotOriginAir
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the cases of Magneto_ShotOriginAir
; ---------------------------------------------------------------------------
Magneto_ShotOriginAir_Ret:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
