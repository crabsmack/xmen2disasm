; ---------------------------------------------------------------------------
; Tuskette_StateHopRise - TUSKETTE hopper: wait until falling
; In:  8(a6) = this
; Out: none
; Evidence: vy > 0; next Tuskette_StateHopLand
; ---------------------------------------------------------------------------
Tuskette_StateHopRise:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$18(a4)
	ble.s	loc_05D452
	clr.w	$6C(a4)
	lea.l	Tuskette_StateHopLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D452:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
