; ---------------------------------------------------------------------------
; Tuskette_StateHopBackLand - TUSKETTE hopper: land at home height
; In:  8(a6) = this
; Out: d0
; Evidence: next Tuskette_StateHopDone
; ---------------------------------------------------------------------------
Tuskette_StateHopBackLand:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	cmp.l	$C(a4),d7
	bge.s	loc_05D5B8
	move.l	d7,$C(a4)
	ori.w	#$4000,$6(a4)
	clr.w	$6C(a4)
	lea.l	Tuskette_StateHopDone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D5B8:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
