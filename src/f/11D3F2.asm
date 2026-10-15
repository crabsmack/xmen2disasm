; ---------------------------------------------------------------------------
; BabyBio_ActStartFiring - BABYBIO script action: load the shot count (+$BA) and start BabyBio_ActFireLoop
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: +$6E = 240; 7 callers (script thunks)
; ---------------------------------------------------------------------------
BabyBio_ActStartFiring:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$F0,$6E(a4)
	move.b	$BA(a4),$B9(a4)
	clr.w	$6C(a4)
	lea.l	BabyBio_ActFireLoop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
