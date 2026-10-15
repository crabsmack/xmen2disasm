; ---------------------------------------------------------------------------
; TechWallGun_Fire_Case5 - TechWallGun_Fire switch case 5 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of TechWallGun_Fire
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in TechWallGun_Fire (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
TechWallGun_Fire_Case5:
	move.w	#$FFCE,-$4(a6)
	move.w	#$FFF9,-$2(a6)
	move.w	#$FC60,d4
	clr.w	d5
	moveq	#-$E,d6
	clr.w	d7
	bra.s	TechWallGun_Fire_Spawn
loc_14316A:
	move.w	#$FFD5,-$4(a6)
	move.w	#$A,-$2(a6)
	move.w	#$FD70,d4
	move.w	#$290,d5
	moveq	#-$A,d6
	moveq	#$A,d7
	bra.s	TechWallGun_Fire_Spawn
loc_143184:
	move.w	#$FFE5,-$4(a6)
	move.w	#$1B,-$2(a6)
	move.w	#$FD70,d4
	move.w	#$290,d5
	moveq	#-$A,d6
	moveq	#$A,d7
	bra.s	TechWallGun_Fire_Spawn
