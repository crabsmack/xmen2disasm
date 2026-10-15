; ---------------------------------------------------------------------------
; sub_05CCDA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CCDA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$C8,g_SceneExitTimer(a5)
	moveq	#$3,d0
	bmi.s	loc_05CD0A
	cmpi.l	#$4,d0
	bgt.s	loc_05CD0A
	add.l	d0,d0
	move.w	$5CD00(pc,d0.l),d0
	jmp	$5CCFE(pc,d0.w)
