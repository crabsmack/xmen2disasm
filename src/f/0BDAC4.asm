; ---------------------------------------------------------------------------
; Barbarian_StateIdle - BARBARIAN state: idle animation, 200-frame idle timer, start watching the players
; In:  8(a6) = this
; Out: d0
; Evidence: animation $0BD45A; next Barbarian_StateWatchP1; TAS 27994-33098
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$EFFF,$6(a4)
	lea.l	$209A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	#$C8,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Barbarian_StateWatchP1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
