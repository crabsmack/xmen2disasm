; ---------------------------------------------------------------------------
; Anim_ApplyStep - apply the current animation step: play its sound or show its frame and set the flip bits
; In:  8(a6) = object   $C(a6) = byte: apply the step's flip flags
; Out: d0 = byte: the flag arg, 0 if the script ended
; Evidence: script +0 flags (4 = per-step flips, 8 = face velocity +$16), steps of 2 bytes from +6: {flags, value}; flag $20 = sound step: Snd_Stop + Snd_Play(value), Anim_Advance, repeat; else vtable +$56 SetFrame(obj, value), step bits $80/$40 toggle h/v flip in +$2E
; ---------------------------------------------------------------------------
Anim_ApplyStep:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$44(a4),a0
	moveq	#$0,d5
	move.b	(a0),d5
	tst.l	d5
	bra.s	loc_15F7E0
loc_15F7A6:
	move.w	$48(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$44(a4),d0
	movea.l	d0,a0
	moveq	#$0,d7
	move.b	$7(a0),d7
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,-(a7)
	jsr	Anim_Advance(pc)
	tst.l	$44(a4)
	lea.l	$C(a7),a7
	bne.s	loc_15F7E0
	moveq	#$0,d0
	bra.w	loc_15F8AC
loc_15F7E0:
	move.w	$48(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$44(a4),d0
	movea.l	d0,a0
	moveq	#$0,d0
	move.b	$6(a0),d0
	moveq	#$20,d1
	and.b	d0,d1
	bne.s	loc_15F7A6
	moveq	#$10,d7
	and.b	$2E(a4),d7
	moveq	#$8,d6
	and.b	$2E(a4),d6
	move.w	$48(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$44(a4),d0
	movea.l	d0,a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,-$2(a6)
	moveq	#$4,d0
	and.w	d5,d0
	beq.s	loc_15F85E
	tst.b	$F(a6)
	beq.s	loc_15F874
	move.w	$48(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$44(a4),d0
	movea.l	d0,a0
	moveq	#$0,d4
	move.b	$6(a0),d4
	move.w	#$80,d0
	and.w	d4,d0
	beq.s	loc_15F84E
	tst.b	d7
	seq.b	d3
	neg.b	d3
	move.b	d3,d7
loc_15F84E:
	moveq	#$40,d0
	and.w	d4,d0
	beq.s	loc_15F874
	tst.b	d6
	seq.b	d3
	neg.b	d3
	move.b	d3,d6
	bra.s	loc_15F874
loc_15F85E:
	moveq	#$8,d0
	and.w	d5,d0
	beq.s	loc_15F874
	tst.w	$16(a4)
	bge.s	loc_15F86C
	moveq	#$1,d7
loc_15F86C:
	tst.w	$16(a4)
	ble.s	loc_15F874
	clr.b	d7
loc_15F874:
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	andi.b	#$E7,$2E(a4)
	tst.b	d7
	beq.s	loc_15F894
	moveq	#$10,d0
	bra.s	loc_15F896
loc_15F894:
	moveq	#$0,d0
loc_15F896:
	tst.b	d6
	beq.s	loc_15F89E
	moveq	#$8,d1
	bra.s	loc_15F8A0
loc_15F89E:
	moveq	#$0,d1
loc_15F8A0:
	or.b	d0,d1
	or.b	d1,$2E(a4)
	move.b	$F(a6),d0
	addq.w	#$8,a7
loc_15F8AC:
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
