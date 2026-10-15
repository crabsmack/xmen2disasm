; ---------------------------------------------------------------------------
; ExplodeFx_BurstStart - turn a killed object's memory into a burst effect: clear it, explosion sound, start ExplodeFx_BurstUpdate timer and ExplodeFx_BurstDraw hook
; In:  8(a6) = object  $F(a6) = byte draw layer (+$42)  $10(a6) = (+$43, unused)  $17(a6) = byte priority (+$2E bit 2)  $1B(a6) = byte flag (+6 bit 3)
; Out: none
; Evidence: Mem_Set(+4, 0, $BE) keeping +$15 in +$C; +4 = $8010 | priority; Snd_Stop/Snd_Play($38), +$D sound cooldown 6; Timer_Create(ExplodeFx_BurstUpdate, 1, obj, 1); DrawList_Add(ExplodeFx_BurstDraw, obj, 0/4, layer, 0/8, 0) -> +6; caller ExplodeFx_Burst. The Trail/Bounce/Chain starts are copies with their own update/draw
; ---------------------------------------------------------------------------
ExplodeFx_BurstStart:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.b	$17(a6),d7
	movea.l	$8(a6),a4
	move.b	$15(a4),d6
	pea.l	($BE).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$4(a4)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.b	d6,$C(a4)
	tst.b	d7
	beq.s	loc_13D984
	moveq	#$1,d0
	bra.s	loc_13D986
loc_13D984:
	moveq	#$0,d0
loc_13D986:
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
	pea.l	ExplodeFx_BurstUpdate(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$8(a4)
	lea.l	$24(a7),a7
	beq.s	loc_13D9CA
	move.l	$8(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_13D9CA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	tst.b	$1B(a6)
	beq.s	loc_13D9D8
	moveq	#$8,d1
	bra.s	loc_13D9DA
loc_13D9D8:
	moveq	#$0,d1
loc_13D9DA:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$F(a6),d0
	move.l	d0,-(a7)
	tst.b	d7
	beq.s	loc_13D9EC
	moveq	#$4,d0
	bra.s	loc_13D9EE
loc_13D9EC:
	moveq	#$0,d0
loc_13D9EE:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	ExplodeFx_BurstDraw(pc)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$6(a4)
	lea.l	$18(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
