; ---------------------------------------------------------------------------
; Barbarian_StateStart - BARBARIAN first state: stand on the floor below, play its pose, go idle
; In:  8(a6) = this
; Out: d0
; Evidence: Seg_FindBelow floor, Barbarian_StandOn, animation jt[$2292]; next Barbarian_StateIdle; TAS 27993-32927
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($3E8).w
	move.l	$C(a4),d0
	asr.l	#$8,d0
	moveq	#$14,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Barbarian_StandOn(pc)
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	Barbarian_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
