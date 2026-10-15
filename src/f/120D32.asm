; ---------------------------------------------------------------------------
; BioSentinel_StateDropFlip - BIOSENTINEL drop: turn right side up (keep the box centre), falling animation
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_UpdateBox; next StateFalling
; ---------------------------------------------------------------------------
BioSentinel_StateDropFlip:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	lsl.l	#$7,d7
	andi.b	#$F7,$2E(a4)
	lea.l	$3442(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d7,d0
	sub.l	d1,d0
	add.l	d0,$C(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	BioSentinel_StateFalling(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
