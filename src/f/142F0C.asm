; ---------------------------------------------------------------------------
; TechWallGun_UpdateBullet_Case1 - TechWallGun_UpdateBullet switch case 1 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of TechWallGun_UpdateBullet
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in TechWallGun_UpdateBullet (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
TechWallGun_UpdateBullet_Case1:
	move.b	#$4,$F(a3)
	bra.s	TechWallGun_UpdateBullet_Draw
loc_142F14:
	move.b	#$3,$F(a3)
	bra.s	TechWallGun_UpdateBullet_Draw
loc_142F1C:
	ori.b	#$10,$E(a3)
	move.b	#$4,$F(a3)
	bra.s	TechWallGun_UpdateBullet_Draw
