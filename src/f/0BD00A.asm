; ---------------------------------------------------------------------------
; SavageMediumBio_ActShoot - SAVAGEMEDIUMBIO script action: stop and play the shooting animation jt[$3612]
; In:  8(a6) = this
; Out: d0
; Evidence: next SavageMediumBio_StateFire
; Found: jt 1030
; ---------------------------------------------------------------------------
SavageMediumBio_ActShoot:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$3412(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SavageMediumBio_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
