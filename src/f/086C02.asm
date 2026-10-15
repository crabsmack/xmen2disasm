; ---------------------------------------------------------------------------
; BroodBoss_StateRoar - BROODBOSS state: roar animation, reset the boss x offset, wait $78 frames
; In:  8(a6) = this
; Out: d0
; Evidence: Obj_SetAnim(this, $0889AA), -$3C44 := 0, +$6C = $78, next BroodBoss_StateEnter; TAS 49293
; ---------------------------------------------------------------------------
BroodBoss_StateRoar:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$0,d0
	move.l	d0,g_BroodBossOffsetX(a5)
	addq.w	#$8,a7
	move.w	#$78,$6C(a4)
	lea.l	BroodBoss_StateEnter(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
