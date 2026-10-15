; ---------------------------------------------------------------------------
; Magneto_ShotEndAnim_Result - Magneto_ShotEndAnim common tail: move the chosen result into d0
; In:  a6 frame of Magneto_ShotEndAnim
; Out: d0 / output pointers as set by the case
; Evidence: reached from every case of Magneto_ShotEndAnim
; ---------------------------------------------------------------------------
Magneto_ShotEndAnim_Result:
	move.l	a4,d0
