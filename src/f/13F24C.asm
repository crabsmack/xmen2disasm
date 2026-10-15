; ---------------------------------------------------------------------------
; Pop_FxChainSpiral - POP state, type 5: harmless spiral chain explosion from the top of its box
; In:  8(a6) = this
; Out: none
; Evidence: ExplodeFx_Chain(this, Tbl_ExplodeFxSpiralPath, 0, 0, box top - y px); same call as LaserCannon_OnDeath
; ---------------------------------------------------------------------------
Pop_FxChainSpiral:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$3B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	ExplodeFx_Chain(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
