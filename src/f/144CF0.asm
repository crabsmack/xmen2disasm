; ---------------------------------------------------------------------------
; ToxicCan_Despawn - TOXICCAN slot +$36: return to the spawn record; a damaged can respawns as TOXICCANDAMAGED
; In:  8(a6) = this, $C(a6) = spawn record
; Out: none
; Evidence: like Actor_Despawn; frame 1 (damaged) -> rec+0 = TOXICCANDAMAGED descriptor
; ---------------------------------------------------------------------------
ToxicCan_Despawn:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.w	$4(a4)
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_144D18
	lea.l	$3D62(a5),a0
	move.l	$2(a0),(a3)
loc_144D18:
	move.b	#$5,$4(a3)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$6(a3)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$8(a3)
	move.b	#$FF,$5(a3)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
