; ---------------------------------------------------------------------------
; MagnetoBoss_Zone0Setup - MAGNETOBOSS chase part 0: follow mode 2 at offset ($82, -$6E) from the target
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$90 resume state = MagnetoBoss_StateZone0; +$B2 mode; +$9E/+$A0 offset
; ---------------------------------------------------------------------------
MagnetoBoss_Zone0Setup:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	MagnetoBoss_StateZone0(pc),a0
	move.l	a0,$90(a4)
	move.b	#$2,$B2(a4)
	move.w	#$82,$9E(a4)
	move.w	#$FF92,$A0(a4)
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateZone0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
