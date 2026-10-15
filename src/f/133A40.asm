; ---------------------------------------------------------------------------
; BrainRocket_StateSetDirection - BRAINROCKET: set velocity and animation for its angle (0, 45, 90, 135, 180, 270)
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: speeds $380/$140; Obj_SetAnim; next BrainRocket_StateFly
; ---------------------------------------------------------------------------
BrainRocket_StateSetDirection:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8C(a4),d0
	beq.s	loc_133A76
	subi.w	#$2D,d0
	beq.s	loc_133A94
	subi.w	#$2D,d0
	beq.s	loc_133AB2
	subi.w	#$2D,d0
	beq.s	loc_133ACE
	subi.w	#$2D,d0
	beq.w	loc_133AEC
	subi.w	#$5A,d0
	beq.w	loc_133B08
	bra.w	loc_133B28
loc_133A76:
	move.w	#$380,$16(a4)
	clr.w	$18(a4)
	lea.l	$362A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.w	loc_133B28
loc_133A94:
	move.w	#$140,$16(a4)
	move.w	#$FEC0,$18(a4)
	lea.l	$3632(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_133B28
loc_133AB2:
	clr.w	$16(a4)
	move.w	#$FC80,$18(a4)
	lea.l	$363A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_133B28
loc_133ACE:
	move.w	#$FEC0,$16(a4)
	move.w	#$FEC0,$18(a4)
	lea.l	$3632(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_133B28
loc_133AEC:
	move.w	#$FC80,$16(a4)
	clr.w	$18(a4)
	lea.l	$362A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_133B28
loc_133B08:
	clr.w	$16(a4)
	move.w	#$380,$18(a4)
	lea.l	$363A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	ori.b	#$8,$2E(a4)
	addq.w	#$8,a7
loc_133B28:
	clr.w	$6C(a4)
	lea.l	BrainRocket_StateFly(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
