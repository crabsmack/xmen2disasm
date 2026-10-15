; ---------------------------------------------------------------------------
; Tuskette_StateHopOut - TUSKETTE hopper: jump towards the player (vx +$9A, vy -$7D0, gravity 100)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: animation jt $E6A; +6 |= $1000, &= ~$4000; next Tuskette_StateHopRise
; ---------------------------------------------------------------------------
Tuskette_StateHopOut:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$1000,$6(a4)
	lea.l	$C6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05D3F8
	move.w	$9A(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_05D3FE
loc_05D3F8:
	move.w	$9A(a4),d0
	ext.l	d0
loc_05D3FE:
	move.w	d0,$16(a4)
	move.w	#$F830,$18(a4)
	move.w	#$64,$20(a4)
	andi.w	#$BFFF,$6(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Tuskette_StateHopRise(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
