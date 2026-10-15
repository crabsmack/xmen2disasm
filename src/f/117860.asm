; ---------------------------------------------------------------------------
; SegmentPlusPowerUp_Collect - SEGMENTPLUSPOWERUP collected: player gains 1 health segment
; In:  8(a6) = this  $C(a6) = player
; Out: none
; Evidence: slot 26 override; player vtable +$6E (XPlayer_AddHealth: health += n*$100, clamped 1..$900) with +1; TAS 7263-52198
; ---------------------------------------------------------------------------
SegmentPlusPowerUp_Collect:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	move.l	a4,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2D8A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
