; ---------------------------------------------------------------------------
; Barbarian_SegHook1A - floor-segment hook for type $1A (barbarian platforms): solid only in mode 3
; In:  8(a6) = word mode
; Out: d0 = mode == 3
; Evidence: installed in g_SegTypeHooks[$1A] (-$3402) by Barbarian_ClassInit; TAS 27957-33098
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_SegHook1A:
	link.w	a6,#$0
	move.l	d3,-(a7)
	moveq	#$3,d1
	cmp.w	$A(a6),d1
	seq.b	d3
	neg.b	d3
	sne.b	d0
	andi.w	#$1,d0
	move.l	-$4(a6),d3
	unlk	a6
	rts
