; ---------------------------------------------------------------------------
; Magneto_ShotAnim_Result - Magneto_ShotAnim common tail: move the chosen result into d0
; In:  a6 frame of Magneto_ShotAnim
; Out: d0 / output pointers as set by the case
; Evidence: reached from every case of Magneto_ShotAnim
; ---------------------------------------------------------------------------
Magneto_ShotAnim_Result:
	move.l	a4,d0
