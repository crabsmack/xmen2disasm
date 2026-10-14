; ---------------------------------------------------------------------------
; sub_09980C	[jt 794]
; ---------------------------------------------------------------------------
sub_09980C:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	move.l	d0,-$3AF0(a5)
	lea.l	sub_099526(pc),a0
	move.l	a0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	lea.l	sub_099466(pc),a0
	move.l	a0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	clr.b	-$35CA(a5)
	moveq	#$1,d0
	unlk	a6
	rts
