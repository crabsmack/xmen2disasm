; ---------------------------------------------------------------------------
; BabyBio_EndHurt - BabyBio: XNPC hook: leave the hurt state and resume the saved state (class slot 28, +$76)
; In:  8(a6) = this
; Out: none
; Evidence: method 28 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_EndHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$308A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	move.l	$8(a4),$9C(a4)
	move.l	$C(a4),$A0(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
