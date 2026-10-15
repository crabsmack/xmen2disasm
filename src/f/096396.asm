; ---------------------------------------------------------------------------
; XClone_ActCheckLowHealth - XCLONE script action: below $E health switch to the clone record's low-health script (record +$C), else the next step
; In:  8(a6) = this
; Out: none
; Evidence: +$68 < $E -> AiScript_Set(+$96, record + word $C); jt 729; 3 callers
; Found: jt 729
; ---------------------------------------------------------------------------
XClone_ActCheckLowHealth:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$E,d0
	cmp.w	$68(a4),d0
	ble.s	loc_0963EE
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$C(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_0963D0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09642C
loc_0963D0:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09642C
loc_0963EE:
	tst.l	$98(a4)
	bne.s	loc_096400
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09642C
loc_096400:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096414
	clr.w	$96(a4)
loc_096414:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_09642C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
