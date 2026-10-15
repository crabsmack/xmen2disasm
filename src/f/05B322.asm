; ---------------------------------------------------------------------------
; Boulder_SpawnDebris - throw rock debris from (x, y): 2 small and 3 big pieces with random velocities that bounce near floor height h
; In:  8(a6) = word x px, $C(a6) = word y px, $10(a6) = word floor y (screen)
; Out: d0
; Evidence: Boulder_AllocDebris; sub_1600AA random; caller BaniMazaB2_CrackFloorHook
; ---------------------------------------------------------------------------
Boulder_SpawnDebris:
	link.w	a6,#$FFD0
	movem.l	d3-d7/a4,-(a7)
	move.w	$12(a6),d4
	move.w	$E(a6),d5
	move.w	$A(a6),d6
	clr.w	d7
loc_05B338:
	jsr	Boulder_AllocDebris(pc)
	movea.l	d0,a4
	move.l	a4,d0
	beq.w	loc_05B45C
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$8(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$8(a6),d0
	sub.l	d1,d0
	move.l	-$4(a6),d1
	add.l	d1,d0
	move.l	d0,(a4)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,-$C(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$7F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$10(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$10(a6),d0
	sub.l	d1,d0
	move.l	-$C(a6),d1
	add.l	d1,d0
	move.l	d0,$4(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$7FF,d0
	and.w	d1,d0
	move.l	d0,-$14(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$7FF,d0
	and.w	d1,d0
	move.l	-$14(a6),d1
	sub.w	d0,d1
	move.w	d1,$8(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	move.l	d0,-$18(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$1FF,d0
	and.w	d1,d0
	move.l	-$18(a6),d1
	sub.w	d0,d1
	move.w	d1,$A(a4)
	tst.w	$8(a4)
	ble.s	loc_05B426
	move.w	#$FFFF,$C(a4)
	bra.s	loc_05B42C
loc_05B426:
	move.w	#$1,$C(a4)
loc_05B42C:
	move.w	#$20,$E(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$7,d0
	and.w	d1,d0
	move.b	d0,$10(a4)
	clr.b	$11(a4)
	move.w	d4,d0
	sub.w	#$10,d0
	move.w	d0,$12(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$2,d7
	blt.w	loc_05B338
loc_05B45C:
	clr.w	d7
loc_05B45E:
	jsr	Boulder_AllocDebris(pc)
	movea.l	d0,a4
	move.l	a4,d0
	beq.w	loc_05B584
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-$1C(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$20(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$20(a6),d0
	sub.l	d1,d0
	move.l	-$1C(a6),d1
	add.l	d1,d0
	move.l	d0,(a4)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,-$24(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$7F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$28(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$28(a6),d0
	sub.l	d1,d0
	move.l	-$24(a6),d1
	add.l	d1,d0
	move.l	d0,$4(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	move.l	d0,-$2C(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	move.l	-$2C(a6),d1
	sub.w	d0,d1
	move.w	d1,$8(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	move.l	d0,-$30(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$1FF,d0
	and.w	d1,d0
	move.l	-$30(a6),d1
	sub.w	d0,d1
	move.w	d1,$A(a4)
	tst.w	$8(a4)
	ble.s	loc_05B54C
	move.w	#$FFFF,$C(a4)
	bra.s	loc_05B552
loc_05B54C:
	move.w	#$1,$C(a4)
loc_05B552:
	move.w	#$20,$E(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3,d0
	and.w	d1,d0
	move.b	d0,$10(a4)
	move.b	#$1,$11(a4)
	move.w	d4,d0
	sub.w	#$18,d0
	move.w	d0,$12(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$3,d7
	blt.w	loc_05B45E
loc_05B584:
	movem.l	-$48(a6),d3-d7/a4
	unlk	a6
	rts
