; ---------------------------------------------------------------------------
; PlayerSelect_PlayIdleAnim - play the character's idle animation on the select screen
; In:  8(a6) = portrait actor
; Out: none
; Evidence: switch on the cursor's character -> Obj_ChangeAnim; called by PortraitActor_StateIdle when no animation is running
; ---------------------------------------------------------------------------
PlayerSelect_PlayIdleAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.b	$3C(a0),d0
	bmi.w	PlayerSelect_PlayIdleAnim_part7
	cmpi.b	#$6,d0
	bgt.w	PlayerSelect_PlayIdleAnim_part7
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_067542(pc,d1.w),d1
	jmp	Sw_067542-2(pc,d1.w)
