; ---------------------------------------------------------------------------
; sub_10769A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_10769A:
	link.w	a6,#$0
	lea.l	sub_107560(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	sub_107592(pc)
	jsr	sub_10750C(pc)
	jsr	sub_107378(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_10770A
	ori.b	#$4,-$172A(a5)
	moveq	#$8,d0
	and.w	-$1752(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1716(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$16D0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_10770A:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_107750
	ori.b	#$4,-$181A(a5)
	moveq	#$8,d0
	and.w	-$1842(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1806(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$17C0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_107750:
	lea.l	$3F1A(a5),a0
	move.l	a0,-$33FE(a5)
	clr.b	-$38DE(a5)
	pea.l	sub_107658(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
