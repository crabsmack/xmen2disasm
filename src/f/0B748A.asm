; ---------------------------------------------------------------------------
; ChildShip_OnHurt_Right - ChildShip_OnHurt switch case 10: knocked right (vx $500)
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
ChildShip_OnHurt_Right:
	move.w	#$500,$16(a4)
