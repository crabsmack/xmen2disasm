; ---------------------------------------------------------------------------
; Hornet_SpawnForDeathbird - create a HORNET for Deathbird's hornet waves: face the player, set the type-specific attack stats, drop it into the arena
; In:  8(a6) = long x << 8  $C(a6) = long y << 8  $10(a6) = spawn record (+6 radius, +8 step, +$A delay, +$C shots, +$E recover)  $14(a6) = type 0-3
; Out: d0 = new HORNET or 0
; Evidence: HORNET New via descriptor +$E; +6 |= $1000, +$9E = type; type 2: +$2E bits 0-1 = 1, delay 60, 2 shots, lifetime 600; type 3: bits 0-1 = 2, delay 50, 3 shots, lifetime 900, +$9C = 3; +$94 = Hornet_MoveVelocity, +$5C = Hornet_StateDropIn; only caller Deathbird_StateSendHornets (jt 1794), TAS 37421-44550
; ---------------------------------------------------------------------------
Hornet_SpawnForDeathbird:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$383A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$383A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.w	loc_137246
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_137198
	ori.b	#$10,$2E(a4)
	bra.s	loc_13719E
loc_137198:
	andi.b	#$EF,$2E(a4)
loc_13719E:
	ori.w	#$1000,$6(a4)
	move.w	$16(a6),$9E(a4)
	move.w	$16(a6),d0
	bmi.s	Hornet_SpawnForDeathbird_CaseDefault
	cmpi.w	#$3,d0
	bgt.s	Hornet_SpawnForDeathbird_CaseDefault
	add.w	d0,d0
	move.w	Sw_137142(pc,d0.w),d0
	jmp	Sw_137142-2(pc,d0.w)
