; ---------------------------------------------------------------------------
; SavageBio_ActReloadArt10 - SAVAGE bio script action: drop the tentacle and play animation jt[$202A], then reload the sprite tiles (frame $10)
; In:  8(a6) = this
; Out: d0
; Evidence: next SavageBio_StateReloadArt10
; Found: jt 996
; ---------------------------------------------------------------------------
SavageBio_ActReloadArt10:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$B0(a4)
	clr.w	$AE(a4)
	lea.l	$1E2A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SavageBio_StateReloadArt10(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
