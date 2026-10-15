; ---------------------------------------------------------------------------
; Deathbird_StateStart - Deathbird first state: wobble flight, then send hornets
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: set as +$5C/+$64 by Deathbird_Init; TAS frame 37300
; ---------------------------------------------------------------------------
Deathbird_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,$AE(a4)
	move.w	#$4,$A6(a4)
	move.w	#$3,$A8(a4)
	clr.w	$6C(a4)
	lea.l	Deathbird_StateSendHornets(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
