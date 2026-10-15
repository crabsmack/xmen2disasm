; ---------------------------------------------------------------------------
; SavageBio_ActFireVertical - SAVAGE bio script action: animation $0B7DE2, then fire a rocket straight up/down
; In:  8(a6) = this
; Out: d0
; Evidence: next SavageBio_StateFireVertical
; Found: jt 994
; ---------------------------------------------------------------------------
SavageBio_ActFireVertical:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$1E1A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SavageBio_StateFireVertical(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
