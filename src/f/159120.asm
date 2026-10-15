; ---------------------------------------------------------------------------
; Magneto_AirShotAnim_Case9 - Magneto_AirShotAnim switch case 9 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_AirShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_AirShotAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_AirShotAnim_Case9:
	lea.l	$471A(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotAnim_Result
