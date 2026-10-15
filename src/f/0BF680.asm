; ---------------------------------------------------------------------------
; SpikeBall_Draw - vtable +$1A: draw a SPIKEBALL
; In:  8(a6) = this
; Evidence: slot +$1A of the SPIKEBALL descriptor $0BF820; TAS frames 27964-30508 (1309 frames active)
; ---------------------------------------------------------------------------
SpikeBall_Draw:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	moveq	#$0,d4
	move.b	$2F(a4),d4
	tst.l	d4
	cmpi.l	#$FF,d4
	beq.w	loc_0BF764
	move.w	$34(a4),d0
	ext.l	d0
	move.l	d0,d5
	moveq	#$1,d0
	cmp.l	d4,d0
	bne.s	loc_0BF6D2
	addi.l	#$10,d5
loc_0BF6D2:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BF6E0
	ori.l	#$800,d5
loc_0BF6E0:
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BF6EE
	ori.l	#$1000,d5
loc_0BF6EE:
	ori.l	#$6000,d5
	subi.l	#$10,d6
	subi.l	#$10,d7
	moveq	#-$20,d0
	cmp.l	d6,d0
	bge.s	loc_0BF764
	cmpi.l	#$140,d6
	bge.s	loc_0BF764
	moveq	#-$20,d0
	cmp.l	d7,d0
	bge.s	loc_0BF764
	cmpi.l	#$E0,d7
	bge.s	loc_0BF764
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$F,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	d5,$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
loc_0BF764:
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
