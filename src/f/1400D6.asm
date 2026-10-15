; ---------------------------------------------------------------------------
; Spark_NopStatic - empty helper called by Spark_ClassInit
; In:  none
; Out: none
; Evidence: bare rts body; only caller Spark_ClassInit
; ---------------------------------------------------------------------------
Spark_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
