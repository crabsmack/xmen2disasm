; ---------------------------------------------------------------------------
; Wolverine_LeapSlashEnd - after a leaping slash: recover when its animation ends
; In:  8(a6) = player
; Out: none
; Evidence: clears A latch; state XPlayer_AttackRecover, delay 0 if the anim ended else $FF
; ---------------------------------------------------------------------------
Wolverine_LeapSlashEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	bne.s	loc_19769C
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1976AA
loc_19769C:
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1976AA:
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	tst.l	$44(a4)
	beq.s	loc_1976C0
	move.l	#$FF,d0
	bra.s	loc_1976C2
loc_1976C0:
	moveq	#$0,d0
loc_1976C2:
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
