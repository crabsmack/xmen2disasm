; ---------------------------------------------------------------------------
; Cerebro_IntroPalHook - palette hook during the Cerebro intro: fade lines 1/2 in and out on a countdown
; In:  none
; Out: none
; Evidence: installed in -$3A18 by Cerebro_PlayIntro; counter -$3B0C, copies 16-colour steps from jt tables into $FFC8C0/$FFC8A0, then Cerebro_AnimatePalettes
; ---------------------------------------------------------------------------
Cerebro_IntroPalHook:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	jsr	Cerebro_AnimatePalettes(pc)
	subq.w	#$1,-$3B0C(a5)
	cmpi.w	#$C9,-$3B0C(a5)
	bgt.s	loc_065E12
	cmpi.w	#$A9,-$3B0C(a5)
	blt.s	loc_065E12
	lea.l	$F5A(a5),a0
	movea.l	$2(a0),a3
	move.w	-$3B0C(a5),d0
	ext.l	d0
	move.l	#$C9,d1
	sub.l	d0,d1
	move.l	d1,d7
	asr.l	#$2,d7
	ext.l	d7
	move.l	d7,d0
	add.l	d0,d0
	lea.l	(a3,d0.l),a4
	lea.l	-$3940(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_065E02:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_065E02
	move.b	#$1,g_PalBaseDirty(a5)
loc_065E12:
	moveq	#$2C,d0
	cmp.w	-$3B0C(a5),d0
	blt.s	loc_065E62
	moveq	#$14,d0
	cmp.w	-$3B0C(a5),d0
	bgt.s	loc_065E62
	lea.l	$F6A(a5),a0
	movea.l	$2(a0),a4
	move.w	-$3B0C(a5),d0
	ext.l	d0
	moveq	#$2C,d1
	sub.l	d0,d1
	move.l	#$FFC,d0
	and.l	d1,d0
	move.l	d0,d7
	lsl.l	#$2,d7
	ext.l	d7
	move.l	d7,d0
	add.l	d0,d0
	lea.l	(a4,d0.l),a3
	lea.l	-$3960(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_065E52:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_065E52
	move.b	#$1,g_PalBaseDirty(a5)
loc_065E62:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
