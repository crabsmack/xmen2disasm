; ---------------------------------------------------------------------------
; XClone_Explode - XCLONE slot +$7E Explode: leave the hit list, clear the hurt flags and run the death script jt[$1B8A]
; In:  8(a6) = this
; Out: none
; Evidence: XNPC slot +$7E (death effect); List_Unlink(+$84, $FFEBAE) when hittable; AiScript_Set(+$96, jt[$1B8A]); TAS 53285-56667
; Found: jt 719
; ---------------------------------------------------------------------------
XClone_Explode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.w	$6(a4),d0
	bne.s	loc_0956FE
	ori.w	#$2,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	addq.w	#$8,a7
loc_0956FE:
	andi.w	#$FDFF,$4(a4)
	andi.w	#$FFFB,$4(a4)
	andi.w	#$BFFF,$6(a4)
	lea.l	$198A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_095734
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_095750
loc_095734:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_095750:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
