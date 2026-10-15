; ---------------------------------------------------------------------------
; ChildShip_OnHurt_Up - ChildShip_OnHurt switch case 12: knocked up (vy -$500); case 11 (down, vy $500) follows it
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
ChildShip_OnHurt_Up:
	move.w	#$FB00,$18(a4)
	bra.s	ChildShip_OnHurt_SetDecel
loc_0B747A:
	move.w	#$500,$18(a4)
	bra.s	ChildShip_OnHurt_SetDecel
