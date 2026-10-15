; ---------------------------------------------------------------------------
; Irq_HBlank - H-int handler (hook $214): count the interrupt and disable further H-ints
; In:  none
; Out: none
; Evidence: word -$BC8(a5) += 1; writes VDP reg 0 = $04 ($8004, H-int off)
; ---------------------------------------------------------------------------
Irq_HBlank:
	link.w	a6,#$0
	move.w	-$BC8(a5),d0
	addq.w	#$1,-$BC8(a5)
	tst.w	d0
	move.w	#$8004,($C00004).l
	unlk	a6
	rts
