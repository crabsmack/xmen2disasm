; ---------------------------------------------------------------------------
; XNpc_StateDeathFling - XNPC death fling with the landing line at the current y
; In:  8(a6) = this
; Out: none
; Evidence: next XNpc_StateDeathFlying; TAS 915-57140
; ---------------------------------------------------------------------------
XNpc_StateDeathFling:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$12(a4)
	move.l	a4,-(a7)
	jsr	XNpc_StartDeathFling(pc)
	lea.l	XNpc_StateDeathFlying(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XNpc_StateDeathFlying(pc)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
