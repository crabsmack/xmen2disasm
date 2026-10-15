; ---------------------------------------------------------------------------
; Magneto_ShotEndAnim_Default - Magneto_ShotEndAnim default case: out-of-range input returns 0
; In:  a6 frame of Magneto_ShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the range check in Magneto_ShotEndAnim
; ---------------------------------------------------------------------------
Magneto_ShotEndAnim_Default:
	moveq	#$0,d0
	bra.s	Magneto_ShotEndAnim_Ret
