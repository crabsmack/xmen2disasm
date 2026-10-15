; ---------------------------------------------------------------------------
; MagnetoBoss_Zone1Setup - MAGNETOBOSS zone 1: hover between x $1C4 and $2A4 (mode 3)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A6/+$A8 hover limits, +$9B flags; next MagnetoBoss_StateZone1
; ---------------------------------------------------------------------------
MagnetoBoss_Zone1Setup:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$3,$B2(a4)
	andi.b	#$F3,$9B(a4)
	ori.b	#$2,$9B(a4)
	move.w	#$1C4,$A6(a4)
	move.w	#$2A4,$A8(a4)
	lea.l	MagnetoBoss_StateZone1(pc),a0
	move.l	a0,$90(a4)
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateZone1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
