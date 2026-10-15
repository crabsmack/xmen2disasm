; ---------------------------------------------------------------------------
; sub_0ADD8A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ADD8A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$98(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	move.l	-$16E2(a5),d0
	cmp.l	$9C(a4),d0
	addq.w	#$8,a7
	bne.s	loc_0ADDC4
	pea.l	g_Player1(a5)
	jsr	$4E7A(a5)	; -> Obj_Detach
	movea.l	$9C(a4),a0
	ori.b	#$40,(a0)
	addq.w	#$4,a7
loc_0ADDC4:
	move.l	-$17D2(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADDE0
	pea.l	g_Player2(a5)
	jsr	$4E7A(a5)	; -> Obj_Detach
	movea.l	$9C(a4),a0
	ori.b	#$40,(a0)
	addq.w	#$4,a7
loc_0ADDE0:
	move.l	$9C(a4),-(a7)
	jsr	$20D2(a5)	; -> sub_0BD9F0
	addq.w	#$4,a7
	move.w	#$8,$6C(a4)
	lea.l	sub_0ADE06(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
