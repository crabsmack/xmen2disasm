; ---------------------------------------------------------------------------
; sub_035A3A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_035A3A:
	link.w	a6,#$0
	clr.w	-$3B02(a5)
	lea.l	sub_03597A(pc),a0
	move.l	a0,-$3416(a5)
	lea.l	sub_03599A(pc),a0
	move.l	a0,-$3412(a5)
	lea.l	sub_0359BA(pc),a0
	move.l	a0,-$340E(a5)
	lea.l	sub_0359DA(pc),a0
	move.l	a0,-$340A(a5)
	lea.l	sub_0359FA(pc),a0
	move.l	a0,-$3406(a5)
	lea.l	sub_035A1A(pc),a0
	move.l	a0,-$3402(a5)
	unlk	a6
	rts
