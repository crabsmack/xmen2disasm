; ---------------------------------------------------------------------------
; BroodClaw_StateIdle - BROODCLAW state: idle (re-arms itself)
; In:  8(a6) = this
; Out: d0
; Evidence: jt 842; state of the first claw of a pair (BroodClaw_Spawn) and of the boss's claw at setup; TAS 49293-52265
; Found: jt 842
; ---------------------------------------------------------------------------
BroodClaw_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
