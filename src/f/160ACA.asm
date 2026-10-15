; ---------------------------------------------------------------------------
; Cam_FollowObject - CAMERA slot +$22: track an arbitrary object inside a dead-zone box
; In:  8(a6) = this, $C(a6) = object, $10/$14/$18/$1C(a6) = words box left, top, right, bottom
; Out: none
; Evidence: +8 = Cam_TrackObject, +$24 = object
; ---------------------------------------------------------------------------
Cam_FollowObject:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Cam_TrackObject(pc),a0
	move.l	a0,$8(a4)
	move.w	$12(a6),$3C(a4)
	move.w	$16(a6),$40(a4)
	move.w	$1A(a6),$3E(a4)
	move.w	$1E(a6),$42(a4)
	move.w	#$40,$62(a4)
	move.w	#$E0,$64(a4)
	move.l	$C(a6),$24(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
