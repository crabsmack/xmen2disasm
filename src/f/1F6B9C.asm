; ---------------------------------------------------------------------------
; Obj_StandOnSegHere - stand an object on whatever floor segment contains its current position
; In:  8(a6) = object
; Out: none
; Evidence: Seg_FindContaining(x, y, 1001 = any type), then Obj_StandOnSeg; callers MaintRobot_Init, Platform1_Init_Common
; ---------------------------------------------------------------------------
Obj_StandOnSegHere:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($3E9).w
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$4F4A(a5)	; -> Seg_FindContaining
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Obj_StandOnSeg(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
