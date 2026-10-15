; ---------------------------------------------------------------------------
; Tuskette_StateHopBack - TUSKETTE hopper: jump back towards home x
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Tuskette_StateHopBackRise
; ---------------------------------------------------------------------------
Tuskette_StateHopBack:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	cmp.l	$8(a4),d7
	bge.s	loc_05D4F6
	ori.b	#$10,$2E(a4)
	bra.s	loc_05D4FC
loc_05D4F6:
	andi.b	#$EF,$2E(a4)
loc_05D4FC:
	lea.l	$C6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05D51C
	move.w	$9A(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_05D522
loc_05D51C:
	move.w	$9A(a4),d0
	ext.l	d0
loc_05D522:
	move.w	d0,$16(a4)
	move.w	#$F830,$18(a4)
	move.w	#$64,$20(a4)
	andi.w	#$BFFF,$6(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Tuskette_StateHopBackRise(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
