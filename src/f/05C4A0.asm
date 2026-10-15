; ---------------------------------------------------------------------------
; Tusk_StateChooseAttack - TUSK: face the nearest player; charge if that player is on the lower platform (+$90), else run the next attack of its 10-step cycle (+$98)
; In:  8(a6) = this
; Out: d0
; Evidence: cycle: vulnerable, throw, spawn tuskette, throw, vulnerable, spawn, throw, spawn both, throw, throw
; ---------------------------------------------------------------------------
Tusk_StateChooseAttack:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	move.l	d0,$8C(a4)
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_05C4CC
	ori.b	#$10,$2E(a4)
	bra.s	loc_05C4D2
loc_05C4CC:
	andi.b	#$EF,$2E(a4)
loc_05C4D2:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_05C4E2
	moveq	#$6,d0
	bra.s	loc_05C4E4
loc_05C4E2:
	moveq	#$5,d0
loc_05C4E4:
	move.b	d0,$71(a4)
	move.l	$76(a3),d0
	cmp.l	$90(a4),d0
	bne.s	loc_05C500
	lea.l	Tusk_AtkCharge(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.w	Tusk_StateChooseAttack_part3
loc_05C500:
	tst.w	$6E(a4)
	bne.w	Tusk_StateChooseAttack_part3
	addq.b	#$1,$98(a4)
	move.b	$98(a4),d0
	cmpi.b	#$9,d0
	bhi.s	Tusk_StateChooseAttack_part1
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_05C4A0(pc,d1.w),d1
	jmp	Sw_05C4A0-2(pc,d1.w)
