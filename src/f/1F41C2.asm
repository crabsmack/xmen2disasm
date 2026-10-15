; ---------------------------------------------------------------------------
; Player_IsClimber - is this player one of the XCLIMBER characters (Beast, Nightcrawler, Psylocke, Wolverine)
; In:  8(a6) = player
; Out: d0 = byte 1/0
; Evidence: compares obj+0 with Tbl_Beast/Nightcrawler/Psylocke/Wolverine_vtable (classes.py: these four derive from XCLIMBER)
; ---------------------------------------------------------------------------
Player_IsClimber:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	(a0),a4
	moveq	#$1,d3
	lea.l	$2B9A(a5),a0
	cmpa.l	$2(a0),a4
	beq.s	loc_1F41FC
	lea.l	$2BA2(a5),a0
	cmpa.l	$2(a0),a4
	beq.s	loc_1F41FC
	lea.l	$2BAA(a5),a0
	cmpa.l	$2(a0),a4
	beq.s	loc_1F41FC
	lea.l	$2BB2(a5),a0
	cmpa.l	$2(a0),a4
	beq.s	loc_1F41FC
	moveq	#$0,d3
loc_1F41FC:
	move.b	d3,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
