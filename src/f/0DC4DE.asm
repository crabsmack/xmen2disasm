; ---------------------------------------------------------------------------
; ClosedBarrier_GetSize - vtable +$06: return sizeof(CLOSEDBARRIER) = $8C bytes
; In:  none
; Out: d0 = $8C
; Evidence: slot +$6 of the CLOSEDBARRIER descriptor $0DCA2E; never runs in the corpus
; ---------------------------------------------------------------------------
ClosedBarrier_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
