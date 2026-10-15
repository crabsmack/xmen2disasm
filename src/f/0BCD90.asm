; ---------------------------------------------------------------------------
; SavageMediumBio_OnDeath - SAVAGEMEDIUMBIO slot +$72 OnDeath: stop, leave both lists, burst into a BIOBALLS (SavageMediumBio_StateBurst)
; In:  8(a6) = this
; Out: none
; Evidence: TAS 33579
; Found: jt 1026
; ---------------------------------------------------------------------------
SavageMediumBio_OnDeath:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	pea.l	g_HitListEnemyAtk(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$80(a4)
	andi.w	#$FFFB,$4(a4)
	ori.w	#$1,$6(a4)
	ori.w	#$2,$6(a4)
	lea.l	SavageMediumBio_StateBurst(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
