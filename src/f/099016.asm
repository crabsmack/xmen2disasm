; ---------------------------------------------------------------------------
; sub_099016	[jt 793]
; ---------------------------------------------------------------------------
sub_099016:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3B30(a5)
	clr.w	-$3C40(a5)
	clr.w	-$3B06(a5)
	clr.w	-$3B08(a5)
	jsr	sub_09989E(pc)
	move.w	d0,-$3B04(a5)
	pea.l	Str_Empty_099078(pc)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3B20(a5)
	lea.l	sub_099C22(pc),a0
	move.l	a0,-$3406(a5)
	lea.l	$1432(a5),a0
	move.l	a0,-$3402(a5)
	jsr	$1312(a5)	; -> sub_085932
	lea.l	sub_09984A(pc),a0
	move.l	a0,-$388E(a5)
	jsr	$1162(a5)	; -> CloneA2_FlickerInit
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	sub_098FB6(pc)
	jsr	$3F3A(a5)	; -> sub_15B0E6
	unlk	a6
	rts
