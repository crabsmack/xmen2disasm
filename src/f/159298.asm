; ---------------------------------------------------------------------------
; Magneto_ShotEndAnim_Case1 - Magneto_ShotEndAnim switch case 1 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotEndAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotEndAnim_Case1:
	lea.l	$46BA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_ShotEndAnim_Result
