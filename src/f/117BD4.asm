; ---------------------------------------------------------------------------
; MysteryPowerUp_Collect - MYSTERYPOWERUP collected: +3 or -3 health segments depending on the frame counter
; In:  8(a6) = this  $C(a6) = player
; Out: none
; Evidence: slot 26 override; g_FrameCounter bit 1 picks +3/-3 for player +$6E
; ---------------------------------------------------------------------------
MysteryPowerUp_Collect:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$C(a6),a4
	moveq	#$2,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_117BEC
	moveq	#$3,d0
	bra.s	loc_117BEE
loc_117BEC:
	moveq	#-$3,d0
loc_117BEE:
	move.w	d0,d7
	move.l	a4,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$14(a7),a7
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
