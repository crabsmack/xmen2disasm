; ---------------------------------------------------------------------------
; Spark_ClassInit - Spark: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $1400DE (name string "SPARK", parent ACTOR)
; ---------------------------------------------------------------------------
Spark_ClassInit:
	link.w	a6,#$0
	jsr	sub_1400D6(pc)
	unlk	a6
	rts
