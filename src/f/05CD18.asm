; ---------------------------------------------------------------------------
; loc_05CD18	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_05CD18:
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	addq.w	#$4,a7
	bra.s	loc_05CD3E
loc_05CD22:
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	addq.w	#$4,a7
	bra.s	loc_05CD3E
