; ---------------------------------------------------------------------------
; MondoPlusPowerUp_Collect - MONDOPLUSPOWERUP collected: player health set to full ($900)
; In:  8(a6) = this  $C(a6) = player
; Out: none
; Evidence: slot 26 override; player +$68 = $900
; ---------------------------------------------------------------------------
MondoPlusPowerUp_Collect:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	move.l	a4,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2DAA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	#$900,$68(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
