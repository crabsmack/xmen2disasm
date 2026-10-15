; ---------------------------------------------------------------------------
; Tusk_StateIntro - TUSK intro: lock the arena, stand still, attach the segment found 32 px above it, wait 300 frames
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: Obj_ChangeAnim jt $5C154; Seg_FindNearestOfType(x, y-32, $13) + Obj_StandOnSeg; next Tusk_StateIntroWait
; ---------------------------------------------------------------------------
Tusk_StateIntro:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Tusk_LockArena(pc)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$D2A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d7
	moveq	#$20,d0
	sub.l	d0,d7
	moveq	#$13,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$4F42(a5)	; -> Seg_FindNearestOfType
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$18(a7),a7
	beq.s	loc_05C2E8
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> Obj_StandOnSeg
	addq.w	#$8,a7
loc_05C2E8:
	move.w	#$12C,$6E(a4)
	lea.l	Tusk_StateIntroWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
