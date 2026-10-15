; ---------------------------------------------------------------------------
; SavageMediumBio_Init - parent (SAVAGEBIOBASE) Init, then SavageBio_NopStatic, flags |= $83, stats record -$3B14 with health 4, AI script jt $1E3A, state SavageMediumBio_StateAppear (+$5C/+$64), sprite def jt $359A (palette 3), home +$AE/+$B0 = position, frame $60, Obj_UpdateBoxes (SAVAGEMEDIUMBIO override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Out: none
; Evidence: slot +$12 of the SAVAGEMEDIUMBIO descriptor $0BD39C; TAS frames 33558-33558 (1 frames active)
; ---------------------------------------------------------------------------
SavageMediumBio_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$207A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	jsr	SavageBio_NopStatic(pc)
	ori.w	#$83,$6(a4)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$4,$2(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$1E3A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	SavageMediumBio_StateAppear(pc),a0
	move.l	a0,$5C(a4)
	lea.l	SavageMediumBio_StateAppear(pc),a0
	move.l	a0,$64(a4)
	lea.l	$359A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$AE(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$B0(a4)
	moveq	#$60,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	movea.l	-$4(a6),a4
	unlk	a6
	rts
