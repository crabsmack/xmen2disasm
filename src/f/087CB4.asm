; ---------------------------------------------------------------------------
; BroodBoss_StateDeathAnim - BROODBOSS death: play the death animation jt[$16AA] for $3C frames
; In:  8(a6) = this
; Out: d0
; Evidence: next BroodBoss_StateDeathFx; TAS 50631
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateDeathAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$14AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$3C,$6C(a4)
	lea.l	BroodBoss_StateDeathFx(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
