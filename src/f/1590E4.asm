; ---------------------------------------------------------------------------
; Magneto_AirShotAnim_Case3 - Magneto_AirShotAnim switch case 3 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_AirShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_AirShotAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_AirShotAnim_Case3:
	lea.l	$46EA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotAnim_Result
loc_1590EE:
	lea.l	$46DA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotAnim_Result
loc_1590F8:
	lea.l	$46DA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotAnim_Result
loc_159102:
	lea.l	$46EA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotAnim_Result
