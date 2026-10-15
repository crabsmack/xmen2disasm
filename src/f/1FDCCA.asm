; ---------------------------------------------------------------------------
; Irq_VBlank - V-int handler (hook $210): read pads, count frames and call the system and game V-blank hooks
; In:  none
; Out: none
; Evidence: Pad_ReadBoth; long -$3A10(a5) += 1; calls pointer -$3A14(a5) if set; calls pointer -$3A18(a5) unless byte -$38C0 or -$359E is set; clears byte -$3A0A
; ---------------------------------------------------------------------------
Irq_VBlank:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.b	-$3A0C(a5),d7
	jsr	$51B2(a5)	; -> Pad_ReadBoth
	addq.l	#$1,-$3A10(a5)
	tst.l	-$3A14(a5)
	beq.s	loc_1FDCE8
	movea.l	-$3A14(a5),a0
	jsr	(a0)
loc_1FDCE8:
	tst.b	-$38C0(a5)
	bne.s	loc_1FDD00
	tst.b	-$359E(a5)
	bne.s	loc_1FDD00
	tst.l	-$3A18(a5)
	beq.s	loc_1FDD00
	movea.l	-$3A18(a5),a0
	jsr	(a0)
loc_1FDD00:
	clr.b	-$3A0A(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
