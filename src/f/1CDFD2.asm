; ---------------------------------------------------------------------------
; Magneto_StartAirShot - start an air shot in the chosen direction (remember whether he was hovering)
; In:  8(a6) = player
; Out: none
; Evidence: +$12 = hovering (anim == Tbl_MagnetoAnim (jt $467A)); not hovering -> gravity char +$E; clear B latch; Obj_SetAnim(Magneto_AirShotAnim(+$BC)); state Magneto_StateAirShot
; ---------------------------------------------------------------------------
Magneto_StartAirShot:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$467A(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1CDFF4
	move.w	#$1,$12(a4)
	bra.s	loc_1CDFF8
loc_1CDFF4:
	clr.w	$12(a4)
loc_1CDFF8:
	tst.w	$12(a4)
	bne.s	loc_1CE008
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
loc_1CE008:
	tst.b	$9D(a4)
	bne.s	loc_1CE01E
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CE02C
loc_1CE01E:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CE02C:
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E2A(a5)	; -> Magneto_AirShotAnim
	movea.l	d0,a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	Magneto_StateAirShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StateAirShot(pc)
	lea.l	$10(a7),a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
