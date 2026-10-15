; ---------------------------------------------------------------------------
; HornetBullet_NopStatic - empty non-virtual helper called from HORNETBULLET's ClassInit and Reset
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; callers HornetBullet_ClassInit, HornetBullet_Reset
; ---------------------------------------------------------------------------
HornetBullet_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
