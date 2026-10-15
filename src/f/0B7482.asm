; ---------------------------------------------------------------------------
; ChildShip_OnHurt_Left - ChildShip_OnHurt switch case 9: knocked left (vx -$500)
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
ChildShip_OnHurt_Left:
	move.w	#$FB00,$16(a4)
	bra.s	ChildShip_OnHurt_SetDecel
