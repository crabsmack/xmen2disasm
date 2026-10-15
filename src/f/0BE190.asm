; ---------------------------------------------------------------------------
; Barbarian_StateLeapFailed - BARBARIAN state: leap was out of range - set mode 1 and walk instead
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateLeapFailed:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,$BC(a4)
	clr.w	$6C(a4)
	lea.l	Barbarian_StateWalkStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
