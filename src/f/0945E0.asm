; ---------------------------------------------------------------------------
; EvilMaker_Init - parent Init, then no motion, AI script jt $15EA (+$8C), state EvilMaker_StateWaitKills (+$5C/+$64), flags |= $5083, face like the live player (EVILMAKER override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Out: none
; Evidence: slot +$12 of the EVILMAKER descriptor $094BAC; TAS frames 52154-52154 (1 frames active)
; ---------------------------------------------------------------------------
EvilMaker_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$15E2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$15EA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	EvilMaker_StateWaitKills(pc),a0
	move.l	a0,$5C(a4)
	lea.l	EvilMaker_StateWaitKills(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$5083,$6(a4)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09466C
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_094664
	ori.b	#$4,$2E(a4)
	bra.s	loc_0946B2
loc_094664:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0946B2
loc_09466C:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09469C
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_094694
	ori.b	#$4,$2E(a4)
	bra.s	loc_0946B2
loc_094694:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0946B2
loc_09469C:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_0946AC
	ori.b	#$4,$2E(a4)
	bra.s	loc_0946B2
loc_0946AC:
	andi.b	#$FB,$2E(a4)
loc_0946B2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
