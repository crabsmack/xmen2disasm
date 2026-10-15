; ---------------------------------------------------------------------------
; loc_065662	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_065662:
	move.w	(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.l	#$2,a4
	addq.w	#$4,a7
	bra.s	loc_06569A
loc_065672:
	move.w	(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	addq.l	#$2,a4
	addq.w	#$4,a7
	bra.s	loc_06569A
