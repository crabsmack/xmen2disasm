; ---------------------------------------------------------------------------
; Exodus_AtkSwoopB - EXODUS attack: swoop to floor segment B (x $100) and fire a kind-6 blast
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$94 = $100, +$A4 = 1, +$A2 = +$A1, kind 6
; ---------------------------------------------------------------------------
Exodus_AtkSwoopB:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,$94(a4)
	move.b	#$1,$A4(a4)
	move.b	$A1(a4),$A2(a4)
	move.b	#$6,$A5(a4)
	clr.w	$6C(a4)
	lea.l	Exodus_StateSwoopStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
