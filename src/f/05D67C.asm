; ---------------------------------------------------------------------------
; Tuskette_StateChaseTarget - TUSKETTE chaser: follow its target object (+$A0); hit it when within 4 px, or give up when it is gone or dead
; In:  8(a6) = this
; Out: d0
; Evidence: next Tuskette_StateHitTarget / Tuskette_StateTargetGone / Tuskette_StateWanderOut
; ---------------------------------------------------------------------------
Tuskette_StateChaseTarget:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$A0(a4),a3
	move.l	a3,d0
	beq.s	loc_05D6E8
	tst.w	$68(a3)
	bgt.s	loc_05D6AA
	clr.w	$6C(a4)
	lea.l	Tuskette_StateTargetGone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_05D6FA
loc_05D6AA:
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_05D6C2
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	bra.s	loc_05D6CC
loc_05D6C2:
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	neg.l	d0
loc_05D6CC:
	cmpi.l	#$400,d0
	bge.s	loc_05D6FA
	clr.w	$6C(a4)
	lea.l	Tuskette_StateHitTarget(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_05D6FA
loc_05D6E8:
	clr.w	$6C(a4)
	lea.l	Tuskette_StateWanderOut(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D6FA:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
