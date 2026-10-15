; ---------------------------------------------------------------------------
; Tusk_StateChargeStart - TUSK: charge forward (frame 8, vx +/-900, accel +/-40, max $640) with sound $E6
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: next Tusk_StateCharging
; ---------------------------------------------------------------------------
Tusk_StateChargeStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05C958
	move.l	#$FFFFFC7C,d0
	bra.s	loc_05C95E
loc_05C958:
	move.l	#$384,d0
loc_05C95E:
	move.w	d0,$16(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05C96E
	moveq	#-$28,d0
	bra.s	loc_05C970
loc_05C96E:
	moveq	#$28,d0
loc_05C970:
	ext.w	d0
	move.w	d0,$1E(a4)
	move.w	#$640,$22(a4)
	pea.l	($E6).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E6).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	Tusk_StateCharging(pc),a0
	move.l	a0,$5C(a4)
	lea.l	$10(a7),a7
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
