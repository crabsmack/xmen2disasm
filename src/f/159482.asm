; ---------------------------------------------------------------------------
; loc_159482	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_159482:
	move.w	#$63,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	moveq	#$0,d0
	move.l	d0,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	loc_1594B6
loc_15949C:
	move.w	#$45,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$13B00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
