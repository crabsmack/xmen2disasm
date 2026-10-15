; ---------------------------------------------------------------------------
; Tuskette_StateRunRight - TUSKETTE runner: run right (accel 40, max +$9A)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Tuskette_StateRunRightUntil
; ---------------------------------------------------------------------------
Tuskette_StateRunRight:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$28,$1E(a4)
	move.w	$9A(a4),d0
	asr.w	#$2,d0
	move.w	d0,$16(a4)
	move.w	$9A(a4),$22(a4)
	andi.w	#$BFFF,$6(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Tuskette_StateRunRightUntil(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
