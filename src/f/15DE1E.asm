; ---------------------------------------------------------------------------
; Actor_InActivateWindow - ACTOR slot +$3A: test whether an unattached object is inside the activation window
; In:  8(a6) = object
; Out: d0 = 1 inside (or flag $1000 = always), 0 outside or attached
; Evidence: attached (+$3A != $FF) -> 0; flags +6 $800 / $20 skip the x / y test; screen x vs $FFCC46/$FFCC48, y vs $FFCC42/$FFCC44
; ---------------------------------------------------------------------------
Actor_InActivateWindow:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_15DE3A
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE3A:
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_15DE48
	moveq	#$1,d0
	bra.s	loc_15DEA4
loc_15DE48:
	move.w	#$800,d0
	and.w	$6(a4),d0
	bne.s	loc_15DE76
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	-$35BA(a5),d7
	ble.s	loc_15DE6C
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE6C:
	cmp.w	-$35B8(a5),d7
	bge.s	loc_15DE76
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE76:
	moveq	#$20,d0
	and.w	$6(a4),d0
	bne.s	loc_15DEA2
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	-$35BE(a5),d7
	ble.s	loc_15DE98
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE98:
	cmp.w	-$35BC(a5),d7
	bge.s	loc_15DEA2
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DEA2:
	moveq	#$1,d0
loc_15DEA4:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
