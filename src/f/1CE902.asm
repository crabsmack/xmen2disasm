; ---------------------------------------------------------------------------
; Magneto_StartBomb - special wind-up before the flux bomb
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: stop, clear B latch, Obj_SetAnim(Magneto_ShotAnim(dir)) or crouch wind-up, delay $FF, next Magneto_SpawnBomb
; ---------------------------------------------------------------------------
Magneto_StartBomb:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1CE92C
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CE93A
loc_1CE92C:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CE93A:
	tst.w	$10(a4)
	beq.s	loc_1CE94A
	lea.l	$46CA(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_1CE95A
loc_1CE94A:
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E3A(a5)	; -> Magneto_ShotAnim
	movea.l	d0,a3
	addq.w	#$4,a7
loc_1CE95A:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Magneto_SpawnBomb(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
