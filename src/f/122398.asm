; ---------------------------------------------------------------------------
; BigBio_ActSpit3 - BIGBIO script action: spit animation (jt $368A), 3 shots
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: first entry of BigBio_Script; next StateSpitStart
; ---------------------------------------------------------------------------
BigBio_ActSpit3:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$348A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$3,$B4(a4)
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	BigBio_StateSpitStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
