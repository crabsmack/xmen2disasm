; ---------------------------------------------------------------------------
; Teleporter_StateArrive - TELEPORTER state: arrive - set the receiver's camera zone, reset the players' states and fade back in
; In:  8(a6) = this
; Out: d0
; Evidence: receiver flag +$E -> CloneA2_StartCamAltMode; CloneA2_SetCameraZone(+$8C); each live player: +$6A = 10, slot +$86, state := class slot +$A6; sub_1F690E(1) (blocking fade in); TAS 48377
; Found: link-after-rts
; ---------------------------------------------------------------------------
Teleporter_StateArrive:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8E(a3),a4
	tst.w	$E(a4)
	beq.s	loc_08586A
	jsr	$1172(a5)	; -> CloneA2_StartCamAltMode
loc_08586A:
	move.w	$8C(a3),d7
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$117A(a5)	; -> CloneA2_SetCameraZone
	moveq	#$0,d7
	addq.w	#$4,a7
loc_08587A:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_08588A
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_085890
loc_08588A:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_085890:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0858C8
	move.w	#$A,$6A(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	addq.w	#$4,a7
loc_0858C8:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.s	loc_08587A
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4EA2(a5)	; -> sub_1F690E
	addq.w	#$4,a7
	clr.w	$6C(a3)
	lea.l	Teleporter_StateWaitFade(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
