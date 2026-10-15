; ---------------------------------------------------------------------------
; TechWallGun_UpdateBullet_Case8 - TechWallGun_UpdateBullet switch case 8 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of TechWallGun_UpdateBullet
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in TechWallGun_UpdateBullet (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
TechWallGun_UpdateBullet_Case8:
	move.b	#$5,$F(a3)
	bra.s	TechWallGun_UpdateBullet_Draw
