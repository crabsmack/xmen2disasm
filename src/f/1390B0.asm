; ---------------------------------------------------------------------------
; MaintRobot_StateChase_End - common exit of MaintRobot_StateChase
; In:  none
; Out: none
; Evidence: branch target of every case and of the out-of-range switch value
; ---------------------------------------------------------------------------
MaintRobot_StateChase_End:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
