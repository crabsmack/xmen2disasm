; ---------------------------------------------------------------------------
; BioSentinel_StateAimLevel - BIOSENTINEL: straight aiming animation (jt $3612), then fire
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim; next StateFireLevel
; ---------------------------------------------------------------------------
BioSentinel_StateAimLevel:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3412(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	BioSentinel_StateFireLevel(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
