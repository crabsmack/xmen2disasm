; ---------------------------------------------------------------------------
; BanimazaDoor_PushCallback - collision callback of BANIMAZADOOR: for event 3, an object overlapping the rectangle is pushed 2 px out to the nearer side
; In:  8(a6) = word event, $C(a6) = rect {+8 left, +$A top, +$C right, +$E bottom}, $10(a6) = object, $14(a6) = push record
; Out: d0 = 0 other event, 1 no overlap, 2 pushed
; Evidence: registered by BanimazaDoor_ClassInit; push bytes +3/+5 = -2 or 2
; ---------------------------------------------------------------------------
BanimazaDoor_PushCallback:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$C(a6),a4
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_039DAE
	movea.l	$10(a6),a0
	move.w	$4E(a0),d0
	cmp.w	$C(a4),d0
	bgt.s	loc_039DAA
	move.w	$52(a0),d0
	cmp.w	$8(a4),d0
	blt.s	loc_039DAA
	move.w	$4C(a0),d0
	cmp.w	$E(a4),d0
	bgt.s	loc_039DAA
	move.w	$50(a0),d0
	cmp.w	$A(a4),d0
	blt.s	loc_039DAA
	move.l	$8(a0),d6
	asr.l	#$8,d6
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	cmp.w	d6,d7
	ble.s	loc_039D92
	dc.w	$177C,$FFFE,$0003	; insn: move.b #$fe, $3(a3)
	dc.w	$177C,$FFFE,$0005	; insn: move.b #$fe, $5(a3)
	bra.s	loc_039D9E
loc_039D92:
	move.b	#$2,$3(a3)
	move.b	#$2,$5(a3)
loc_039D9E:
	clr.b	$4(a3)
	clr.b	$6(a3)
	moveq	#$2,d0
	bra.s	loc_039DB0
loc_039DAA:
	moveq	#$1,d0
	bra.s	loc_039DB0
loc_039DAE:
	moveq	#$0,d0
loc_039DB0:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
