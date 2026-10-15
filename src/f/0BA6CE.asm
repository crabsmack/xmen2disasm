; ---------------------------------------------------------------------------
; SavageBigBio_TakeDamage - vtable +$26: unless shielded (+$9C bit 0): health -= damage, 20-frame flash; at 0 stop, leave both lists and die (SavageBio_StateDying), else sound $D8; publish health in -$3B02
; Evidence: -$3B02 drives the SavageA4 palette stages (SavageA4_FrameHook); TAS 33684-33890
; ---------------------------------------------------------------------------
SavageBigBio_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9C(a4),d0
	btst	#$0,d0
	bne.w	loc_0BA774
	move.b	$17(a6),d0
	ext.w	d0
	sub.w	d0,$68(a4)
	move.w	#$14,$6A(a4)
	tst.w	$68(a4)
	bgt.s	loc_0BA750
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	SavageBio_StateDying(pc),a0
	move.l	a0,$5C(a4)
	ori.w	#$40,$6(a4)
	move.w	#$14,$AC(a4)
	pea.l	g_HitListEnemyAtk(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	ori.w	#$2,$6(a4)
	ori.w	#$1,$6(a4)
	lea.l	$10(a7),a7
	bra.s	loc_0BA76E
loc_0BA750:
	ori.w	#$40,$6(a4)
	pea.l	($D8).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D8).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	#$14,$AC(a4)
	addq.w	#$8,a7
loc_0BA76E:
	move.w	$68(a4),-$3B02(a5)
loc_0BA774:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
