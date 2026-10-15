; ---------------------------------------------------------------------------
; Explosion_SpawnHurtingSetTimerWord - start a damaging explosion and store a word at the start of its timer record
; In:  8(a6) = x  $C(a6) = y  $13(a6) = byte h-flip  $16(a6) = word  $1A(a6) = word damage flag
; Out: d0 = slot or 0
; Evidence: Explosion_SpawnEx with damage
; ---------------------------------------------------------------------------
Explosion_SpawnHurtingSetTimerWord:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$13(a6),d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	Explosion_SpawnEx(pc)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_1181EC
	tst.l	$6(a4)
	beq.s	loc_1181E8
	movea.l	$6(a4),a0
	move.w	$16(a6),(a0)
	bra.s	loc_1181EE
loc_1181E8:
	moveq	#$0,d0
	bra.s	loc_1181EE
loc_1181EC:
	moveq	#$0,d0
loc_1181EE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
