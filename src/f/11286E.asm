; ---------------------------------------------------------------------------
; Deathbird_StateDeadFlicker	[link-after-rts]
; ---------------------------------------------------------------------------
Deathbird_StateDeadFlicker:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	g_FrameCounter(a5),-(a7)
	pea.l	-$3940(a5)
	jsr	$4DAA(a5)	; -> Mem_Copy
	move.b	#$1,g_PalBaseDirty(a5)
	lea.l	$C(a7),a7
	move.w	#$2,$6C(a4)
	lea.l	Deathbird_StateDeadFlicker(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
