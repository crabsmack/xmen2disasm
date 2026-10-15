; ---------------------------------------------------------------------------
; TechWallGun_Fire_Case4 - TechWallGun_Fire switch case 4 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of TechWallGun_Fire
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in TechWallGun_Fire (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
TechWallGun_Fire_Case4:
	move.w	#$FFD5,-$4(a6)
	move.w	#$FFE5,-$2(a6)
	move.w	#$FD70,d4
	move.w	#$FD70,d5
	moveq	#-$A,d6
	moveq	#-$A,d7
	bra.w	TechWallGun_Fire_Spawn
