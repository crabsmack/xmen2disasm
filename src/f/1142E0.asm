; ---------------------------------------------------------------------------
; XNpc_IgnoreHurt - XNPC OnHurt override that does nothing (SWAMPFLY, MAINTROBOT)
; In:  none
; Out: none
; Evidence: slot 26 (+$6E) of SWAMPFLY $0C0CEA and MAINTROBOT $1391FE; body is link/unlk/rts
; ---------------------------------------------------------------------------
XNpc_IgnoreHurt:
	link.w	a6,#$0
	unlk	a6
	rts
