; ---------------------------------------------------------------------------
; TechWallGun_Fire_Case9 - TechWallGun_Fire switch case 9 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of TechWallGun_Fire
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in TechWallGun_Fire (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
TechWallGun_Fire_Case9:
	move.w	#$A,-$4(a6)
	move.w	#$1C,-$2(a6)
	move.w	#$290,d4
	move.w	#$290,d5
	moveq	#$A,d6
	moveq	#$A,d7
	bra.s	TechWallGun_Fire_Spawn
