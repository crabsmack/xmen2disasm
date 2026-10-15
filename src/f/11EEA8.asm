; ---------------------------------------------------------------------------
; BioBalls_ActCollapse - BIOBALLS script action: put ball 0 on the object, end the list after it, restart the script at entry 0
; In:  8(a6) = this
; Out: none
; Evidence: ball list +$92 {word count, 6-byte balls {x, y, flags}}; -1,-1 = end marker; script {+$8C, +$8E}
; ---------------------------------------------------------------------------
BioBalls_ActCollapse:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$92(a4)
	beq.s	loc_11EEE6
	movea.l	$92(a4),a0
	tst.w	(a0)
	ble.s	loc_11EEE6
	movea.l	a0,a3
	addq.w	#$2,a3
	move.w	$10(a4),(a3)
	move.w	$12(a4),$2(a3)
	movea.l	$92(a4),a0
	moveq	#$1,d0
	cmp.w	(a0),d0
	bge.s	loc_11EEE6
	addq.w	#$6,a3
	move.w	#$FFFF,(a3)
	move.w	#$FFFF,$2(a3)
loc_11EEE6:
	tst.l	$8E(a4)
	bne.s	loc_11EEF8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11EF14
loc_11EEF8:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11EF14:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
