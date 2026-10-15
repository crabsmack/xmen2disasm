; ---------------------------------------------------------------------------
; sub_182F0C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_182F0C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_182F30
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	ori.l	#$8,$90(a4)
	addq.w	#$4,a7
loc_182F30:
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	#$F900,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	$18(a0),$24(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	clr.w	$16(a4)
	clr.w	$1E(a4)
	lea.l	$425A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$FF,$6C(a4)
	andi.l	#$FFFFFFFD,$90(a4)
	bclr	#$0,$93(a4)
	tst.b	$9D(a4)
	addq.w	#$8,a7
	bne.s	loc_182F9A
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_182FA8
loc_182F9A:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_182FA8:
	tst.b	$9D(a4)
	bne.s	loc_182FBE
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_182FCC
loc_182FBE:
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_182FCC:
	pea.l	($96).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($9A).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($9A).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$42A2(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
