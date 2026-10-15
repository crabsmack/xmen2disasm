; ---------------------------------------------------------------------------
; Tank_StateWreck - destroyed tank: show the wreck animation forever
; In:  8(a6) = this
; Out: d0 = +4 flag 8
; Evidence: Obj_SetAnim(jt $3E6A data), delay $FF, state itself
; ---------------------------------------------------------------------------
Tank_StateWreck:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3C6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Tank_StateWreck(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
