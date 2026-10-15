; ---------------------------------------------------------------------------
; BigBio_ResumeAfterHit - BIGBIO: clear the hit flag and resume the state saved in +$60
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: called from BigBio_TakeDamage
; ---------------------------------------------------------------------------
BigBio_ResumeAfterHit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFBF,$6(a4)
	tst.l	$60(a4)
	beq.s	loc_123268
	move.l	$60(a4),$5C(a4)
	moveq	#$0,d0
	move.l	d0,$60(a4)
	clr.w	$6C(a4)
loc_123268:
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
