; ---------------------------------------------------------------------------
; FloatBubbleExplode_ClassInit - vtable +$5E: per-level class setup for FLOATBUBBLEEXPLODE
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the FLOATBUBBLEEXPLODE descriptor $0AC1B8; never runs in the corpus
; ---------------------------------------------------------------------------
FloatBubbleExplode_ClassInit:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.l	$8(a6),-(a7)
	jsr	FloatBubbleExplode_Nop6A(pc)
	addq.w	#$4,a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
