; ---------------------------------------------------------------------------
; Tuskette_StateRunLeftUntil - TUSKETTE runner: run until x reaches +$9C
; In:  8(a6) = this
; Out: d0
; Evidence: next Tuskette_StateRunLeftEnd
; ---------------------------------------------------------------------------
Tuskette_StateRunLeftUntil:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9C(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$8(a4),d0
	blt.s	loc_05D9D4
	clr.w	$6C(a4)
	lea.l	Tuskette_StateRunLeftEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D9D4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
