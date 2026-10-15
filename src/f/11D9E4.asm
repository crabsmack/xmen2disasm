; ---------------------------------------------------------------------------
; loc_11D9E4	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_11D9E4:
	lea.l	$3022(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	$11DA1E
loc_11D9F8:
	lea.l	$302A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	$11DA1E
