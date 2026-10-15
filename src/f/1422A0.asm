; ---------------------------------------------------------------------------
; TechWallGun_NopStatic - empty helper called by TechWallGun_ClassInit
; In:  none
; Out: none
; Evidence: bare body
; ---------------------------------------------------------------------------
TechWallGun_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
