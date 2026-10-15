; ---------------------------------------------------------------------------
; BroodBoss_StateDeathStart - BROODBOSS state: death - animation, claw speed -$100
; In:  8(a6) = this
; Out: d0
; Evidence: Obj_SetAnim(this, $088A2A); next BroodBoss_StateDeathSlide; TAS 50612
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateDeathStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$14A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	$96(a4),a0
	move.w	#$FF00,$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateDeathSlide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
