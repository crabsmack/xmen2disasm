; ---------------------------------------------------------------------------
; HoloBolt_StateA - HoloBolt first state: set animation $0E8424, then StateB after 255 frames
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim (sub_1F626A); +$5C/+$6C state machine; TAS 8153-9001
; ---------------------------------------------------------------------------
HoloBolt_StateA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2722(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	HoloBolt_StateB(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
