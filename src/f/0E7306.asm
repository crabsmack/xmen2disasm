; ---------------------------------------------------------------------------
; SentinelsA1_CyclePalettes - SentinelsA1: step the stage's palette cycles (Pal_CycleStep), plus 16 more once the exit is open ($FFC61A)
; In:  none
; Out: none
; Evidence: Pal_CycleStep writes g_PalBase colours from cycle tables $0E7AFC-$0E7CC2; $FFC61A set by Hologram_OpenExit
; ---------------------------------------------------------------------------
SentinelsA1_CyclePalettes:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2642(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B3A(a5)
	pea.l	g_SceneVar3B42(a5)
	pea.l	g_SceneVar3B32(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$264A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B3C(a5)
	pea.l	g_SceneVar3B44(a5)
	pea.l	g_SceneVar3B34(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2652(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B3E(a5)
	pea.l	g_SceneVar3B46(a5)
	pea.l	g_SceneVar3B36(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2662(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B3E(a5)
	pea.l	g_SceneVar3B46(a5)
	pea.l	g_SceneVar3B36(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$265A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B40(a5)
	pea.l	g_SceneVar3B48(a5)
	pea.l	g_SceneVar3B38(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$266A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles+$6(a5)
	pea.l	g_SentinelsA1PalCycles+$8(a5)
	pea.l	g_SentinelsA1PalCycles+$A(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	tst.b	g_SentinelsA1ExitOpen(a5)
	lea.l	$78(a7),a7
	beq.w	loc_0E757E
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2672(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$267A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2682(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$268A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2692(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$269A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26A2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26AA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26B2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26BA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26C2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26CA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26D2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26DA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$26E2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$26EA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SentinelsA1PalCycles(a5)
	pea.l	g_SentinelsA1PalCycles+$2(a5)
	pea.l	g_SentinelsA1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
loc_0E757E:
	unlk	a6
	rts
