; ---------------------------------------------------------------------------
; BanimazaDoor_StateRaised - BANIMAZADOOR: fully raised, idle
; In:  8(a6) = this
; Out: none
; Evidence: +$A0 = 0; +$6C = $FF
; ---------------------------------------------------------------------------
BanimazaDoor_StateRaised:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$A0(a4)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
