; ---------------------------------------------------------------------------
; SpikeBall_ClassInit - vtable +$5E: per-level class setup for SPIKEBALL: load its resource set (-$3C20)
; ---------------------------------------------------------------------------
SpikeBall_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	SpikeBall_Nop6A(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$2382(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_SpikeBallSprDef(a5)
	unlk	a6
	rts
