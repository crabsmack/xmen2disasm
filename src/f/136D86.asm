; ---------------------------------------------------------------------------
; Hornet_StatePickPattern - Hornet state: pick the flight pattern from the spawn type +$9E, then start the attack cycle
; In:  8(a6) = this
; Out: d0 = flags & 8 (unused)
; Evidence: switch +$9E: 0/other vx = $200 bounce in x (Hornet_MoveBounce), 1 vy = $180 bounce in y, 2 vy = $300 Hornet_MoveDiveOnce, 3 vy = $300 Hornet_MoveDiveRepeat; then +$5C = Hornet_StateFacePlayer after +$A6
; ---------------------------------------------------------------------------
Hornet_StatePickPattern:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9E(a4),d0
	bmi.s	Hornet_StatePickPattern_CaseDefault
	cmpi.w	#$3,d0
	bgt.s	Hornet_StatePickPattern_CaseDefault
	add.w	d0,d0
	move.w	Sw_136D86(pc,d0.w),d0
	jmp	Sw_136D86-2(pc,d0.w)
