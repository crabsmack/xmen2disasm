; ---------------------------------------------------------------------------
; loc_1FDB76	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_1FDB76:
	move.w	$4(a4),d5
	move.l	a4,-$6(a6)
	movea.l	a4,a0
	move.w	$6(a0),d6
	move.w	$2(a0),d4
	subq.w	#$1,d4
	ext.l	d6
	move.l	d6,-(a7)
	pea.l	($1000).w
	jsr	$4E3A(a5)	; -> sub_1F6258
	move.l	d0,-$A(a6)
	ext.l	d5
	move.l	d5,-(a7)
	pea.l	($1000).w
	jsr	$4E3A(a5)	; -> sub_1F6258
	move.l	-$A(a6),d1
	sub.l	d0,d1
	ext.l	d4
	move.l	d1,d0
	move.l	d4,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d7,d1
	asl.w	#$2,d1
	move.l	d0,(a3,d1.w)
	lea.l	$10(a7),a7
	bra.s	$1FDBE6
