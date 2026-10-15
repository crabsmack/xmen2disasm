; ---------------------------------------------------------------------------
; Tusk_HookIsEvent3 - scene hook in -$321A while TUSK holds the arena: 1 for event 3
; In:  8(a6) = word event
; Out: d0 = 1/0
; Evidence: installed by Tusk_LockArena
; ---------------------------------------------------------------------------
Tusk_HookIsEvent3:
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
