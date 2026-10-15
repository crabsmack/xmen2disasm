; ---------------------------------------------------------------------------
; Barbarian_StateSegmentEnd - BARBARIAN state: reached the end of its segment - idle pose, then idle or leap (mode +$BC)
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateSegmentEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$209A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	ori.w	#$4000,$6(a4)
	clr.b	$BF(a4)
	move.b	$BC(a4),d0
	addq.w	#$8,a7
	beq.s	loc_0BDEB2
	subq.b	#$1,d0
	beq.s	loc_0BDEC6
	bra.s	loc_0BDEDA
loc_0BDEB2:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDEEC
loc_0BDEC6:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateTryLeap2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDEEC
loc_0BDEDA:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDEEC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
