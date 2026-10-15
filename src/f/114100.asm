; ---------------------------------------------------------------------------
; XNpc_HurtReact_Done - XNpc_HurtReact common exit: state delay 0
; In:  -
; Out: -
; Evidence: 2 branch sources
; ---------------------------------------------------------------------------
XNpc_HurtReact_Done:
	clr.w	$6C(a4)
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
