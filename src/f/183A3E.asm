; ---------------------------------------------------------------------------
; Beast_RollPathClear - probe 12 px ahead in the curled frame: is there room to roll
; In:  8(a6) = player
; Out: d0 = 1 clear, 0 blocked
; Evidence: temporarily x += +/g_ScalerSizeKey, SetFrame $83, Obj_UpdateBox, $1F8B42 with hook Beast_RollProbeCb in $FFCD78; restores x
; ---------------------------------------------------------------------------
Beast_RollPathClear:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	g_SegResolveHook(a5),a3
	move.l	$8(a4),d7
	clr.b	$7B(a4)
	lea.l	Beast_RollProbeCb(pc),a0
	move.l	a0,g_SegResolveHook(a5)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_183A6C
	move.w	#$F400,d0
	bra.s	loc_183A70
loc_183A6C:
	move.w	#$C00,d0
loc_183A70:
	ext.l	d0
	add.l	d0,$8(a4)
	pea.l	($83).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	move.l	a4,-(a7)
	jsr	$4F5A(a5)	; -> Obj_CollideSegs
	move.l	a3,g_SegResolveHook(a5)
	tst.b	$7B(a4)
	lea.l	$10(a7),a7
	beq.s	loc_183AA6
	move.l	d7,$8(a4)
	moveq	#$0,d0
	bra.s	loc_183AAC
loc_183AA6:
	move.l	d7,$8(a4)
	moveq	#$1,d0
loc_183AAC:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
