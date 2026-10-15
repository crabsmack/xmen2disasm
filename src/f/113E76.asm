; ---------------------------------------------------------------------------
; XNpc_TakeDamage_Done - XNpc_TakeDamage common exit
; In:  -
; Out: -
; Evidence: 2 branch sources
; ---------------------------------------------------------------------------
XNpc_TakeDamage_Done:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
