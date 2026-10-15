; ---------------------------------------------------------------------------
; Hologram_ActPose0WaitA - Hologram script action: pose 0, next entry after the delay in word +$92
; In:  8(a6) = this
; Out: none
; Evidence: used after each Fire* in Hologram_ScriptAttack
; ---------------------------------------------------------------------------
Hologram_ActPose0WaitA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetPose(pc)
	tst.l	$8E(a4)
	addq.w	#$4,a7
	bne.s	loc_0EA76E
	move.l	$64(a4),$5C(a4)
	move.w	$92(a4),$6C(a4)
	bra.s	loc_0EA79C
loc_0EA76E:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0EA782
	clr.w	$8C(a4)
loc_0EA782:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	$92(a4),$6C(a4)
loc_0EA79C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
