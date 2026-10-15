; ---------------------------------------------------------------------------
; Hornet_SpawnForDeathbird_CaseDefault - type 0/1/default case of Hornet_SpawnForDeathbird: +$2E bits 0-1 = 3
; In:  a4 = new hornet
; Out: d0 = hornet
; Evidence: switch table Sw_137142; falls into Hornet_SpawnForDeathbird_Finish
; ---------------------------------------------------------------------------
Hornet_SpawnForDeathbird_CaseDefault:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	bra.s	Hornet_SpawnForDeathbird_Finish
