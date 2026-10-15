; ---------------------------------------------------------------------------
; loc_1431D6
; ---------------------------------------------------------------------------
loc_1431D6:
	clr.b	$F(a4)
	move.w	-$4(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$8(a3),d0
	move.l	d0,(a4)
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$C(a3),d0
	move.l	d0,$4(a4)
	move.w	d4,$8(a4)
	move.w	d5,$A(a4)
	move.b	d6,$C(a4)
	move.b	d7,$D(a4)
	pea.l	($F3).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F3).w
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
