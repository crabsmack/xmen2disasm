; ---------------------------------------------------------------------------
; Cam_FollowBoth - CAMERA slot +$1A: two-player mode: track both players inside a dead-zone box
; In:  8(a6) = this, $C/$10/$14/$18(a6) = words box left, top, right, bottom (+$3C, +$40, +$3E, +$42)
; Out: none
; Evidence: +8 tracking fn = Cam_TrackBoth, +$10 = Cam_EaseOffset, look limits +$62/+$64 = $40/$E0, target +$24 = 0; Cam_Init passes ($96,$40,$AA,$C0) when two players are alive
; ---------------------------------------------------------------------------
Cam_FollowBoth:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Cam_TrackBoth(pc),a0
	move.l	a0,$8(a4)
	lea.l	Cam_EaseOffset(pc),a0
	move.l	a0,$10(a4)
	move.w	$E(a6),$3C(a4)
	move.w	$12(a6),$40(a4)
	move.w	$16(a6),$3E(a4)
	move.w	$1A(a6),$42(a4)
	move.w	#$40,$62(a4)
	move.w	#$E0,$64(a4)
	moveq	#$0,d0
	move.l	d0,$24(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
