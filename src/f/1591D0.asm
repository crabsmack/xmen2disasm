; ---------------------------------------------------------------------------
; Magneto_AirShotEndAnim_Default - Magneto_AirShotEndAnim default case: out-of-range input returns 0
; In:  a6 frame of Magneto_AirShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: branch target of the range check in Magneto_AirShotEndAnim
; ---------------------------------------------------------------------------
Magneto_AirShotEndAnim_Default:
	moveq	#$0,d0
	bra.s	Magneto_AirShotEndAnim_Ret
