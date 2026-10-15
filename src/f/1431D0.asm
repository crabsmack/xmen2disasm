; ---------------------------------------------------------------------------
; TechWallGun_Fire_Default - TechWallGun_Fire default case: out-of-range input returns 0
; In:  a6 frame of TechWallGun_Fire
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the range check in TechWallGun_Fire
; ---------------------------------------------------------------------------
TechWallGun_Fire_Default:
	moveq	#$0,d0
	movea.l	d0,a4
	bra.s	TechWallGun_Fire_Ret
