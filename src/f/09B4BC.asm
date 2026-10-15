; ---------------------------------------------------------------------------
; BroodClaw_StateScroll - BROODCLAW state: scroll the scene for +$6E frames, then (when the scroll mode ends) move to the drop point
; In:  8(a6) = this
; Out: d0
; Evidence: +$91 = 1; -$340E := 0; next BroodClaw_StateMoveToDrop; TAS 51953-52126
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodClaw_StateScroll:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_09B4F2
	move.b	#$1,$91(a4)
	tst.b	$90(a4)
	bne.s	loc_09B4F2
	moveq	#$0,d0
	move.l	d0,g_SegTypeHooks+$5C(a5)
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateMoveToDrop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09B504
loc_09B4F2:
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateScroll(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09B504:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
