; ---------------------------------------------------------------------------
; ExplodeFx_ChainStart - turn a killed object's memory into a chain explosion that follows a path script, optionally hurting what it touches
; In:  8(a6) = object  $F(a6) = layer  $17/$1B(a6) = priority / flag bytes  $1E(a6) = word x px  $22(a6) = word y px  $27(a6) = byte damaging  $28(a6) = path  $2E(a6) = word repeats (low byte) and repeat delay (high byte)
; Out: none
; Evidence: same set-up as ExplodeFx_BurstStart with ExplodeFx_ChainUpdate/ChainDraw; +$E/+$10 origin, +$18/+$1C path pointer/start, +$14 repeats, +$15 delay, +$16 bit 0 damaging, bit 1 h-flip, bit 2 v-flip
; ---------------------------------------------------------------------------
ExplodeFx_ChainStart:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.w	$2E(a6),d5
	move.b	$17(a6),d6
	movea.l	$8(a6),a4
	clr.b	d7
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_13E94A
	ori.b	#$2,d7
loc_13E94A:
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_13E956
	ori.b	#$4,d7
loc_13E956:
	move.b	$15(a4),d4
	pea.l	($BE).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$4(a4)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.b	d4,$C(a4)
	tst.b	d6
	beq.s	loc_13E976
	moveq	#$1,d0
	bra.s	loc_13E978
loc_13E976:
	moveq	#$0,d0
loc_13E978:
	ext.w	d0
	or.w	#$8010,d0
	move.w	d0,$4(a4)
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	#$6,$D(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	pea.l	ExplodeFx_ChainUpdate(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$8(a4)
	lea.l	$24(a7),a7
	beq.s	loc_13E9BC
	move.l	$8(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_13E9BC:
	moveq	#$0,d0
	move.l	d0,-(a7)
	tst.b	$1B(a6)
	beq.s	loc_13E9CA
	moveq	#$8,d1
	bra.s	loc_13E9CC
loc_13E9CA:
	moveq	#$0,d1
loc_13E9CC:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$F(a6),d0
	move.l	d0,-(a7)
	tst.b	d6
	beq.s	loc_13E9DE
	moveq	#$4,d0
	bra.s	loc_13E9E0
loc_13E9DE:
	moveq	#$0,d0
loc_13E9E0:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	ExplodeFx_ChainDraw(pc)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$6(a4)
	move.l	$28(a6),$18(a4)
	move.l	$18(a4),$1C(a4)
	move.w	$1E(a6),$E(a4)
	move.w	$22(a6),$10(a4)
	clr.w	$12(a4)
	move.w	#$FF,d0
	and.w	d5,d0
	move.b	d0,$14(a4)
	ext.l	d5
	move.w	#$FF00,d0
	and.w	d5,d0
	lsr.w	#$8,d0
	move.b	d0,$15(a4)
	clr.b	$16(a4)
	tst.b	$27(a6)
	lea.l	$18(a7),a7
	beq.s	loc_13EA38
	ori.b	#$1,$16(a4)
loc_13EA38:
	or.b	d7,$16(a4)
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
