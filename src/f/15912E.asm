; ---------------------------------------------------------------------------
; Magneto_AirShotAnim_Result - Magneto_AirShotAnim common tail: move the chosen result into d0
; In:  a6 frame of Magneto_AirShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: reached from every case of Magneto_AirShotAnim
; ---------------------------------------------------------------------------
Magneto_AirShotAnim_Result:
	move.l	a4,d0
