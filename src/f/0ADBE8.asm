; ---------------------------------------------------------------------------
; TrapDoor_StateWaitPlayer - TRAPDOOR state: wait until a player stands on its segment (player +$76 == +$9C)
; In:  8(a6) = this
; Out: d0
; Evidence: next TrapDoor_StateSag; TAS 30957-32920
; Found: link-after-rts
; ---------------------------------------------------------------------------
TrapDoor_StateWaitPlayer:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	g_Player1+$76(a5),d0
	cmp.l	$9C(a4),d0
	beq.s	loc_0ADC06
	move.l	g_Player2+$76(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADC1E
loc_0ADC06:
	ori.w	#$1000,$6(a4)
	clr.w	$6C(a4)
	lea.l	TrapDoor_StateSag(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0ADC1E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
