; ---------------------------------------------------------------------------
; Hornet_StatePickPattern_Case1 - cases 1-3 of Hornet_StatePickPattern: vertical bounce (vy = $180), dive once or repeat (vy = $300)
; In:  a4 = this
; Out: none
; Evidence: switch table Sw_136D86 entries 1 (this label), 2 loc_136DDA, 3 loc_136DF0; TAS SpaceA1 Deathbird fight
; ---------------------------------------------------------------------------
Hornet_StatePickPattern_Case1:
	move.w	#$180,$18(a4)
	ori.w	#$2,$A0(a4)
	lea.l	Hornet_MoveBounce(pc),a0
	move.l	a0,$94(a4)
	bra.s	Hornet_StatePickPattern_StartAttack
loc_136DDA:
	move.w	#$300,$18(a4)
	ori.w	#$2,$A0(a4)
	lea.l	Hornet_MoveDiveOnce(pc),a0
	move.l	a0,$94(a4)
	bra.s	Hornet_StatePickPattern_StartAttack
loc_136DF0:
	move.w	#$300,$18(a4)
	ori.w	#$2,$A0(a4)
	lea.l	Hornet_MoveDiveRepeat(pc),a0
	move.l	a0,$94(a4)
