; ---------------------------------------------------------------------------
; BigBio_SetOrbShape - BIGBIO: remember a shape (+$AC) and place the orbs on it
; In:  8(a6) = this  $C(a6) = shape
; Out: none
; Evidence: BigBio_PlaceOrbs; 3 callers
; ---------------------------------------------------------------------------
BigBio_SetOrbShape:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),$AC(a4)
	move.l	$AC(a4),-(a7)
	move.l	a4,-(a7)
	jsr	BigBio_PlaceOrbs(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
