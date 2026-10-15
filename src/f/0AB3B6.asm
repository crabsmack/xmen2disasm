; ---------------------------------------------------------------------------
; loc_0AB3B6	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_0AB3B6:
	clr.w	$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$2,$9E(a4)
	bra.s	loc_0AB416
loc_0AB3C8:
	move.w	#$1,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$2,$9E(a4)
	bra.s	loc_0AB416
loc_0AB3DC:
	move.w	#$2,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$3,$9E(a4)
	bra.s	loc_0AB416
loc_0AB3F0:
	move.w	#$3,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$4,$9E(a4)
	bra.s	loc_0AB416
loc_0AB404:
	move.w	#$4,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$4,$9E(a4)
