; ---------------------------------------------------------------------------
; Blast_Draw - vtable +$1A: draw a BLAST
; In:  8(a6) = this
; Evidence: slot +$1A of the BLAST descriptor $0DD0E8; TAS frames 2782-7280 (1786 frames active); calls parent ACTOR slot +$1A
; ---------------------------------------------------------------------------
Blast_Draw:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$96(a4),d0
	btst	#$0,d0
	beq.s	loc_0DCE2E
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_BlastSprDef(a5),d2
	ext.l	d2
	lsl.l	#$2,d2
	move.l	d2,d3
	lsl.l	#$2,d2
	add.l	d3,d2
	lea.l	g_SpriteDefs(a5),a0
	pea.l	(a0,d2.w)
	lea.l	$3F6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$90(a4),-(a7)
	jsr	$3F2A(a5)	; -> Spr_EmitFlicker
	lea.l	$20(a7),a7
	bra.s	loc_0DCE44
loc_0DCE2E:
	move.l	a4,-(a7)
	lea.l	$24CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0DCE44:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
