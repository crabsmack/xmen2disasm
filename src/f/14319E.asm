; ---------------------------------------------------------------------------
; TechWallGun_Fire_Case8 - TechWallGun_Fire switch case 8 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of TechWallGun_Fire
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in TechWallGun_Fire (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
TechWallGun_Fire_Case8:
	move.w	#$FFF8,-$4(a6)
	move.w	#$22,-$2(a6)
	clr.w	d4
	move.w	#$3A0,d5
	clr.w	d6
	moveq	#$E,d7
	bra.s	TechWallGun_Fire_Spawn
