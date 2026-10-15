; ---------------------------------------------------------------------------
; PlayerSelect_PlayPickAnim - play the chosen character's select pose and its voice/sound
; In:  8(a6) = portrait actor
; Out: d0
; Evidence: switch on the cursor's character (+$3C 0-6) -> Obj_ChangeAnim with a per-character animation; sound byte +$2C of the character's record (Snd_Stop/Snd_Play) unless $FF; called by PortraitActor_StateLanded
; ---------------------------------------------------------------------------
PlayerSelect_PlayPickAnim:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a0
	move.b	$3C(a0),d0
	bmi.w	PlayerSelect_PlayPickAnim_part3
	cmpi.b	#$6,d0
	bgt.w	PlayerSelect_PlayPickAnim_part3
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_067420(pc,d1.w),d1
	jmp	Sw_067420-2(pc,d1.w)
