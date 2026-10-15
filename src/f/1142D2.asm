; ---------------------------------------------------------------------------
; XNpc_DeathReact_Done - XNpc_DeathReact common exit: state delay 0
; In:  -
; Out: -
; Evidence: 2 branch sources
; ---------------------------------------------------------------------------
XNpc_DeathReact_Done:
	clr.w	$6C(a4)
loc_1142D6:
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
