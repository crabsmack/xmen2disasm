; ---------------------------------------------------------------------------
; Magneto_ShotAnim_Case4 - Magneto_ShotAnim switch case 4 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotAnim_Case4:
	lea.l	$4682(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_ShotAnim_Result
loc_159234:
	lea.l	$4682(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_ShotAnim_Result
loc_15923E:
	lea.l	$4692(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_ShotAnim_Result
