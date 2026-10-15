; ---------------------------------------------------------------------------
; Magneto_AirShotEndAnim_Case3 - Magneto_AirShotEndAnim switch case 3 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_AirShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_AirShotEndAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_AirShotEndAnim_Case3:
	lea.l	$46F2(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotEndAnim_Result
loc_159194:
	lea.l	$46E2(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotEndAnim_Result
loc_15919E:
	lea.l	$46E2(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotEndAnim_Result
loc_1591A8:
	lea.l	$46F2(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotEndAnim_Result
