; ---------------------------------------------------------------------------
; CoreElevator_MoveUp - CoreElevator: stop at the top limit (+$8E) and go to WaitAtTop
; In:  8(a6) = this
; Out: d0
; Evidence: sets +6 bit $4000 when stopped; TAS 9222-9544
; ---------------------------------------------------------------------------
CoreElevator_MoveUp:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	cmp.l	$C(a4),d7
	ble.s	loc_0EC6D6
	move.l	d7,$C(a4)
	ori.w	#$4000,$6(a4)
	clr.w	$6C(a4)
	lea.l	CoreElevator_WaitAtTop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0EC6D6:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
