; ---------------------------------------------------------------------------
; sub_10750C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_10750C:
	link.w	a6,#$0
	move.b	#$1,-$35C8(a5)
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	lea.l	$2A42(a5),a0
	move.l	a0,-$3AF0(a5)
	move.l	d0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	unlk	a6
	rts
