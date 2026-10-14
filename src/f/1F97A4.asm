; ---------------------------------------------------------------------------
; sub_1F97A4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F97A4:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	move.w	d7,-$38D2(a5)
	moveq	#-$1,d0
	cmp.w	-$38D2(a5),d0
	beq.s	loc_1F97D6
	jsr	$5242(a5)	; -> sub_1FE5F2
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$522A(a5)	; -> sub_1FE5B4
	move.w	d7,-$38D2(a5)
	move.w	d7,d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
loc_1F97D6:
	move.l	-$4(a6),d7
	unlk	a6
	rts
