; ---------------------------------------------------------------------------
; TechWallGun_Fire_Ret - TechWallGun_Fire shared epilogue: restore registers and return
; In:  a6 frame of TechWallGun_Fire
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the cases of TechWallGun_Fire
; ---------------------------------------------------------------------------
TechWallGun_Fire_Ret:
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
