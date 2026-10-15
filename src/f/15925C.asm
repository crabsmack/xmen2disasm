; ---------------------------------------------------------------------------
; Magneto_ShotAnim_Default - Magneto_ShotAnim default case: out-of-range input returns 0
; In:  a6 frame of Magneto_ShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the range check in Magneto_ShotAnim
; ---------------------------------------------------------------------------
Magneto_ShotAnim_Default:
	moveq	#$0,d0
	bra.s	Magneto_ShotAnim_Ret
