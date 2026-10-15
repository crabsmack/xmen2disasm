; ---------------------------------------------------------------------------
; Exodus_AtkSwoopA - EXODUS attack: swoop to floor segment A (x $80) and fire a kind-5 blast
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$94 = $80, +$A3 = 1, +$A2 = +$A0 (segment), blast kind +$A5 = 5; next Exodus_StateSwoopStart
; ---------------------------------------------------------------------------
Exodus_AtkSwoopA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$80,$94(a4)
	move.b	#$1,$A3(a4)
	move.b	$A0(a4),$A2(a4)
	move.b	#$5,$A5(a4)
	clr.w	$6C(a4)
	lea.l	Exodus_StateSwoopStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
