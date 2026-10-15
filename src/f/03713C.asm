; ---------------------------------------------------------------------------
; MagnetoBoss_Zone2Setup - MAGNETOBOSS chase part 2: offset ($73, -$5A), shot cooldown 90
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next MagnetoBoss_StateZone2Approach
; ---------------------------------------------------------------------------
MagnetoBoss_Zone2Setup:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	MagnetoBoss_StateZone2Approach(pc),a0
	move.l	a0,$90(a4)
	move.b	#$2,$B2(a4)
	move.w	#$73,$9E(a4)
	move.w	#$FFA6,$A0(a4)
	move.w	#$5A,$AA(a4)
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateZone2Approach(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
