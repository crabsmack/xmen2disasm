; ---------------------------------------------------------------------------
; Magneto_ShotAnim_Case7 - Magneto_ShotAnim switch case 7 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotAnim (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotAnim_Case7:
	lea.l	$46A2(a5),a0
	movea.l	$2(a0),a4
	bra.s	Magneto_ShotAnim_Result
