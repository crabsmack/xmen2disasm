; ---------------------------------------------------------------------------
; Barbarian_StateEngage - BARBARIAN state: face the target; approach on the same segment, else leap across
; In:  8(a6) = this
; Out: d0
; Evidence: +6 |= $1000; next Barbarian_StateApproach or Barbarian_StateTryLeap; TAS 28048-33091
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateEngage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$1000,$6(a4)
	movea.l	$A2(a4),a0
	move.l	$8(a0),d0
	cmp.l	$8(a4),d0
	bge.s	loc_0BDCC0
	ori.b	#$10,$2E(a4)
	bra.s	loc_0BDCC6
loc_0BDCC0:
	andi.b	#$EF,$2E(a4)
loc_0BDCC6:
	move.l	$AA(a4),d0
	cmp.l	$76(a4),d0
	bne.s	loc_0BDCE4
	clr.w	$6C(a4)
	lea.l	Barbarian_StateApproach(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDCF6
loc_0BDCE4:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateTryLeap(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDCF6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
