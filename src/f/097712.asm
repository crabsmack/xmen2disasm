; ---------------------------------------------------------------------------
; XClone_ActStopAnim46 - XCLONE script action: stop and play move-set animation +$46, next step after 10 frames
; In:  8(a6) = this
; Out: none
; Evidence: +$AC = the clone's character move-set record (word offsets to animations); jt 756
; Found: jt 756
; ---------------------------------------------------------------------------
XClone_ActStopAnim46:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$AC(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_097750
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_09777E
loc_097750:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097764
	clr.w	$96(a4)
loc_097764:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_09777E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
