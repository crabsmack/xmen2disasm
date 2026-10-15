; ---------------------------------------------------------------------------
; loc_06730C	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_06730C:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4322(a5)	; -> Beast_SetFrame
	addq.w	#$8,a7
	bra.s	loc_06736C
loc_06731A:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4092(a5)	; -> Actor_SetFrame
	addq.w	#$8,a7
	bra.s	loc_06736C
loc_067328:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4972(a5)	; -> sub_1D041E
	addq.w	#$8,a7
	bra.s	loc_06736C
loc_067336:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$452A(a5)	; -> sub_1A7BFE
	addq.w	#$8,a7
	bra.s	loc_06736C
loc_067344:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4622(a5)	; -> sub_1B9E78
	addq.w	#$8,a7
	bra.s	loc_06736C
loc_067352:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4422(a5)	; -> sub_197B96
	addq.w	#$8,a7
	bra.s	loc_06736C
