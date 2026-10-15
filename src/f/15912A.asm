; ---------------------------------------------------------------------------
; Magneto_AirShotAnim_Default - Magneto_AirShotAnim default case: out-of-range input returns 0
; In:  a6 frame of Magneto_AirShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the range check in Magneto_AirShotAnim
; ---------------------------------------------------------------------------
Magneto_AirShotAnim_Default:
	moveq	#$0,d0
	bra.s	Magneto_AirShotAnim_Ret
