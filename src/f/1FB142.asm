; ---------------------------------------------------------------------------
; Spr_SetFrame - select the frame a sprite instance shows, marking it up to date if that frame is already uploaded
; In:  8(a6) = sprite instance (object+$2E)   $C(a6) = word: frame index ($FF = none)
; Out: none
; Evidence: +1 = frame; bit 5 of +0 cleared, then set if frame != $FF and frame == uploaded frame +$A; called by actor Draw methods (BioBullet_Draw, SwampFly_Draw...) before Spr_Draw
; ---------------------------------------------------------------------------
Spr_SetFrame:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.b	d7,$1(a4)
	andi.b	#$DF,(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_1FB16E
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_1FB16E
	ori.b	#$20,(a4)
loc_1FB16E:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
