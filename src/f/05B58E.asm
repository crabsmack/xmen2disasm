; ---------------------------------------------------------------------------
; Boulder_StateWaitGround - BOULDER: wait until its +$3A byte is -1 (landed), then bounce after 20 frames
; In:  8(a6) = this
; Out: d0
; Evidence: next Boulder_StateBounce
; ---------------------------------------------------------------------------
Boulder_StateWaitGround:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_05B5B8
	clr.w	$6C(a4)
	lea.l	Boulder_StateWaitGround(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_05B5CC
loc_05B5B8:
	move.w	#$14,$6C(a4)
	lea.l	Boulder_StateBounce(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05B5CC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
