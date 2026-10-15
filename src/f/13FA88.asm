; ---------------------------------------------------------------------------
; Spark_GetSize - return sizeof(SPARK object) = $9C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $9C
; Evidence: method 0 of class descriptor $1400DE (name string "SPARK", parent ACTOR)
; ---------------------------------------------------------------------------
Spark_GetSize:
	link.w	a6,#$0
	move.l	#$9C,d0
	unlk	a6
	rts
