; ---------------------------------------------------------------------------
; TrapDoor_StateSpring - TRAPDOOR state: spring back - tiles +$94, segment and players 2 px up, 5 frames
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
TrapDoor_StateSpring:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$94(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	movea.l	$9C(a4),a0
	subq.w	#$2,$A(a0)
	movea.l	$9C(a4),a0
	subq.w	#$2,$E(a0)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.s	loc_0ADD3A
	move.l	g_Player1+$76(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADD3A
	subi.l	#$200,g_Player1+$C(a5)
	pea.l	g_Player1(a5)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_0ADD3A:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0ADD6E
	move.l	g_Player2+$76(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADD6E
	subi.l	#$200,g_Player2+$C(a5)
	pea.l	g_Player2(a5)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_0ADD6E:
	move.w	#$5,$6C(a4)
	lea.l	TrapDoor_StateOpen(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
