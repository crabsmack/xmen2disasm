; ---------------------------------------------------------------------------
; loc_1371D8	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1371D8:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$3C,$A6(a4)
	move.w	#$2,$A4(a4)
	move.w	#$A,$A2(a4)
	move.w	#$258,$B6(a4)
	bra.s	loc_13722C
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
