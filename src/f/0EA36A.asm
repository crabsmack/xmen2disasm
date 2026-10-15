; ---------------------------------------------------------------------------
; Hologram_Raise_Pose4 - Hologram attack script: pose 4, next script entry after 10 frames
; In:  8(a6) = this
; Out: none
; Evidence: Hologram_SetPose(4) and script advance
; ---------------------------------------------------------------------------
Hologram_Raise_Pose4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetPose(pc)
	tst.l	$8E(a4)
	addq.w	#$4,a7
	bne.s	loc_0EA392
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0EA3C0
loc_0EA392:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0EA3A6
	clr.w	$8C(a4)
loc_0EA3A6:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0EA3C0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
