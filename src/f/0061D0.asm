; ---------------------------------------------------------------------------
; Player_CharIndexOf - map a character class (vtable) to its index 0 Beast,1 Cyclops,2 Gambit,3 Nightcrawler,4 Psylocke,5 Wolverine,6 Magneto
; In:  8(a6) = class vtable (or 0)
; Out: d0.w = index, -1 if none/unknown
; Evidence: compares against jt $2B9A,$2BCA,$2BC2,$2BA2,$2BAA,$2BB2,$2BBA; index stored in g_P1CharIndex; TAS RAM vs screenshots confirm 0 Beast, 3 Nightcrawler, 5 Wolverine
; ---------------------------------------------------------------------------
Player_CharIndexOf:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d7
	move.l	a4,d0
	beq.s	loc_006236
	lea.l	$2B9A(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_0061EE
	clr.w	d7
loc_0061EE:
	lea.l	$2BCA(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_0061FA
	moveq	#$1,d7
loc_0061FA:
	lea.l	$2BC2(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_006206
	moveq	#$2,d7
loc_006206:
	lea.l	$2BA2(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_006212
	moveq	#$3,d7
loc_006212:
	lea.l	$2BAA(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_00621E
	moveq	#$4,d7
loc_00621E:
	lea.l	$2BB2(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_00622A
	moveq	#$5,d7
loc_00622A:
	lea.l	$2BBA(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_006236
	moveq	#$6,d7
loc_006236:
	move.w	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
