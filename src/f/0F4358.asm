; ---------------------------------------------------------------------------
; SentinelsB1_LoadLevel - SentinelsB1: load the stage through the scene loader, copy 16 palette words, set scroll ratios
; In:  none
; Out: none
; Evidence: sub_1F98A8 with level thunks $0ED120/$0DACA6/$0ECA88; 16 words from jt $261A to $FFC8C0
; ---------------------------------------------------------------------------
SentinelsB1_LoadLevel:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$292A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$291A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2922(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2922(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	clr.w	g_PalBase(a5)
	lea.l	$241A(a5),a0
	movea.l	$2(a0),a3
	lea.l	-$3940(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$40(a7),a7
loc_0F43CC:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_0F43CC
	move.b	#$1,-$38B4(a5)
	move.w	#$C0,-$3498(a5)
	move.w	#$80,-$3496(a5)
	clr.b	-$38DE(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
