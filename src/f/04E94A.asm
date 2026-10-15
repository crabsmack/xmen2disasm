; ---------------------------------------------------------------------------
; ApocBomb_Spawn - create an APOCBOMB at (256, -20): low nibble of the parameter = drop offset kind 0-3, high nibble 0 = harmless palette 2, $10 = hittable (frame 9, palette 1)
; In:  8(a6) = word speed, $C(a6) = word parameter
; Out: d0
; Evidence: Tbl_ApocBomb_vtable +$0E New; +$90 speed, +$96/+$98 kind fields; +$9E offset 0/-100/100/200; list $FFEBAE when hittable; caller Apocalypse_StateDropBombs
; ---------------------------------------------------------------------------
ApocBomb_Spawn:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	move.l	#$10000,d7
	move.l	#$FFFFEC00,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	lea.l	$BDA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$BDA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.w	loc_04EA38
	moveq	#$F,d6
	and.w	d5,d6
	move.w	#$F0,d7
	and.w	d5,d7
	move.w	$A(a6),$90(a4)
	move.w	d6,$96(a4)
	move.w	d7,$98(a4)
	move.w	d6,d0
	bmi.s	ApocBomb_Spawn_part1
	cmpi.w	#$3,d0
	bgt.s	ApocBomb_Spawn_part1
	add.w	d0,d0
	move.w	Sw_04E94A(pc,d0.w),d0
	jmp	Sw_04E94A-2(pc,d0.w)
