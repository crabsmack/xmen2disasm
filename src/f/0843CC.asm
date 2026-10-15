; ---------------------------------------------------------------------------
; loc_0843CC	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_0843CC:
	lea.l	sub_084F5A(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_084F5A(pc),a0
	move.l	a0,$64(a4)
	lea.l	$122A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.b	d6
	addq.w	#$8,a7
	beq.s	loc_084420
	ori.w	#$1,$B2(a4)
	bra.s	loc_084420
loc_0843FA:
	lea.l	$1232(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	loc_084420
loc_08440E:
	lea.l	$123A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
