; ---------------------------------------------------------------------------
; loc_06750E
; ---------------------------------------------------------------------------
loc_06750E:
	move.l	a4,d0
	beq.s	loc_067538
	moveq	#$0,d0
	move.b	$2C(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_067538
	moveq	#$0,d0
	move.b	$2C(a4),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$0,d0
	move.b	$2C(a4),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
loc_067538:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
