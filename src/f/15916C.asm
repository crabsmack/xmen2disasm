; ---------------------------------------------------------------------------
; Magneto_AirShotEndAnim_Case0 - Magneto_AirShotEndAnim switch case 0 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_AirShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_AirShotEndAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_AirShotEndAnim_Case0:
	lea.l	$4722(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotEndAnim_Result
loc_159176:
	lea.l	$4712(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_AirShotEndAnim_Result
