; ---------------------------------------------------------------------------
; RetractFloor_StateSlide - RETRACTFLOOR: slide away 8 px a frame (16 at half rate) until offset $80, then kill itself
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$8E offset; next RetractFloor_StateKill
; ---------------------------------------------------------------------------
RetractFloor_StateSlide:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_026EEE
	moveq	#$10,d0
	bra.s	loc_026EF0
loc_026EEE:
	moveq	#$8,d0
loc_026EF0:
	move.w	d0,d7
	add.w	d7,$8E(a4)
	cmpi.w	#$80,$8E(a4)
	ble.s	loc_026F12
	clr.w	$6C(a4)
	lea.l	RetractFloor_StateKill(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_026F24
loc_026F12:
	clr.w	$6C(a4)
	lea.l	RetractFloor_StateSlide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_026F24:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
