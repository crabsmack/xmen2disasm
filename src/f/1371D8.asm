; ---------------------------------------------------------------------------
; Hornet_SpawnForDeathbird_Case2 - types 2 and 3 of Hornet_SpawnForDeathbird: +$2E bits 0-1 = 1/2 and stronger volley/lifetime stats
; In:  a4 = new hornet
; Out: d0 = hornet
; Evidence: switch table Sw_137142; type 3 continues at loc_137200 (3 shots, lifetime 900, path shift 3)
; ---------------------------------------------------------------------------
Hornet_SpawnForDeathbird_Case2:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$3C,$A6(a4)
	move.w	#$2,$A4(a4)
	move.w	#$A,$A2(a4)
	move.w	#$258,$B6(a4)
	bra.s	Hornet_SpawnForDeathbird_Finish
loc_137200:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$32,$A6(a4)
	move.w	#$3,$A4(a4)
	move.w	#$5,$A2(a4)
	move.w	#$384,$B6(a4)
	move.w	#$3,$9C(a4)
