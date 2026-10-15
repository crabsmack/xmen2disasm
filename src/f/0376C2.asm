; ---------------------------------------------------------------------------
; MagnetoBoss_Zone4Exit - MAGNETOBOSS leaves zone 4: fly towards ($7C0, $100) in mode 1
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A2/+$A4 target; next MagnetoBoss_StateBreakWall
; ---------------------------------------------------------------------------
MagnetoBoss_Zone4Exit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	MagnetoBoss_StateBreakWall(pc),a0
	move.l	a0,$90(a4)
	move.b	#$1,$B2(a4)
	move.w	#$7C0,$A2(a4)
	move.w	#$100,$A4(a4)
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateBreakWall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
