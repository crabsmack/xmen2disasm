; ---------------------------------------------------------------------------
; ChildShip_Init - vtable +$12 constructor: CHILDSHIP flies in at the top of the view (y $F0) inside the box x $60-$220 / y $60-$140; palette line 3, sound $42; camera focus g_SceneVar3B20
; Evidence: stats g_SceneVar3B14 (health 8), script jt[$1FAA], state ChildShip_StateEnter, bob table $11B3C0 (+$AA); TAS 33388
; ---------------------------------------------------------------------------
ChildShip_Init:
	link.w	a6,#$FFFC
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1D8A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	movea.l	g_SceneVar3B14(a5),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	move.w	#$8,$68(a4)
	lea.l	$1EAA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$60,$9E(a4)
	move.w	#$220,$A0(a4)
	move.w	#$140,$A2(a4)
	move.w	#$60,$A4(a4)
	lea.l	$1DAA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$98(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	ChildShip_StateEnter(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$80,$6(a4)
	ori.w	#$1000,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	g_CameraX(a5),d0
	sub.w	#$64,d0
	move.w	d0,$10(a4)
	move.w	#$F0,$12(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.l	#$F000,$A6(a4)
	move.l	$A6(a4),$C(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	lea.l	$1EAA(a5),a0
	move.l	$2(a0),d0
	addq.l	#$4,d0
	move.l	d0,-$4(a6)
	lea.l	g_PalBase+$60(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$24(a7),a7
loc_0B71B2:
	movea.l	-$4(a6),a0
	addq.l	#$2,-$4(a6)
	move.w	(a0),(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_0B71B2
	moveq	#$0,d0
	move.l	d0,$94(a4)
	moveq	#$42,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$42,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,g_SceneVar3B20(a5)
	lea.l	$2FDA(a5),a0
	move.l	$2(a0),$AA(a4)
	addq.w	#$8,a7
	movem.l	-$14(a6),d3/d7/a3-a4
	unlk	a6
	rts
