; ---------------------------------------------------------------------------
; RollingDiscs_Draw - empty: returns at once (this class's override of: draw a ROLLINGDISCS)
; In:  8(a6) = this (ROLLINGDISCS object)
; Out: none
; Evidence: class descriptor ROLLINGDISCS slot +$1A (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
RollingDiscs_Draw:
	link.w	a6,#$0
	unlk	a6
	rts
