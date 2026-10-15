; ---------------------------------------------------------------------------
; Barbarian_StateTryLeap - BARBARIAN state: try to leap to the target segment; if out of range walk instead after $1E frames
; In:  8(a6) = this
; Out: d0
; Evidence: Barbarian_SetupLeap; next Barbarian_StateLeap or Barbarian_StateLeapFailed; TAS 28049
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateTryLeap:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$4000,$6(a4)
	move.l	a4,-(a7)
	jsr	Barbarian_SetupLeap(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BDF80
	clr.w	$6C(a4)
	lea.l	Barbarian_StateLeap(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDF94
loc_0BDF80:
	move.w	#$1E,$6C(a4)
	lea.l	Barbarian_StateLeapFailed(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDF94:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
