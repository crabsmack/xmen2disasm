; ---------------------------------------------------------------------------
; CapedAcolyte_StateKnockback - CAPEDACOLYTE hurt state: start a 15-frame knockback timer
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$90 = 15; next CapedAcolyte_StateKnockbackRun
; ---------------------------------------------------------------------------
CapedAcolyte_StateKnockback:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$F,$90(a4)
	clr.w	$6C(a4)
	lea.l	CapedAcolyte_StateKnockbackRun(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
