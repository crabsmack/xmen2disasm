; ---------------------------------------------------------------------------
; loc_04BCB2	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_04BCB2:
	lea.l	$A22(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	loc_04BCEC
loc_04BCC6:
	lea.l	$A2A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	loc_04BCEC
loc_04BCDA:
	lea.l	$A32(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
