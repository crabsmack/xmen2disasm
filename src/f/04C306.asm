; ---------------------------------------------------------------------------
; Apocalypse_StateDefeatedRise - APOCALYPSE defeated: accelerate upwards for 30 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$20 = -$20; next Apocalypse_StateVanish
; ---------------------------------------------------------------------------
Apocalypse_StateDefeatedRise:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$FFE0,$20(a4)
	move.w	#$1E,$6C(a4)
	lea.l	Apocalypse_StateVanish(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
