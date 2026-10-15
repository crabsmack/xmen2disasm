; ---------------------------------------------------------------------------
; XClone_ActAnim3C - XCLONE script action: play move-set animation +$3C (if the character has one) to its end
; In:  8(a6) = this
; Out: none
; Evidence: Obj_SetAnim(this, set + word $3C), +$6C = $FF; skipped when the offset is 0; jt 757; TAS 57410
; Found: jt 757
; ---------------------------------------------------------------------------
XClone_ActAnim3C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$AC(a4),a0
	tst.w	$3C(a0)
	beq.s	loc_0977EE
	movea.l	a0,a1
	adda.w	$3C(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_0977BE
	move.l	$64(a4),$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_09782C
loc_0977BE:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0977D2
	clr.w	$96(a4)
loc_0977D2:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_09782C
loc_0977EE:
	tst.l	$98(a4)
	bne.s	loc_097800
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09782C
loc_097800:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097814
	clr.w	$96(a4)
loc_097814:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_09782C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
