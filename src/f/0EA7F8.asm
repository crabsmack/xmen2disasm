; ---------------------------------------------------------------------------
; Hologram_ActWait30 - Hologram script action: next entry after 30 frames
; In:  8(a6) = this
; Out: none
; Evidence: entry of Hologram_ScriptAttack
; ---------------------------------------------------------------------------
Hologram_ActWait30:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$8E(a4)
	bne.s	loc_0EA816
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_0EA844
loc_0EA816:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0EA82A
	clr.w	$8C(a4)
loc_0EA82A:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_0EA844:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
