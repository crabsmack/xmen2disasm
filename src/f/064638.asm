; ---------------------------------------------------------------------------
; PlayerSelect_AllocCharBuffers - allocate buffers big enough for the largest select-screen animation frame of the 7 characters
; In:  none
; Out: d0 = tiles reserved
; Evidence: switch over the 7 per-character sprite getters (sub_1841E4 Beast ... sub_1CEC28 Magneto), max box area and tile count; heap allocations stored in -$C9E/-$C9A
; ---------------------------------------------------------------------------
PlayerSelect_AllocCharBuffers:
	link.w	a6,#$FFF0
	movem.l	d3-d7/a3-a4,-(a7)
	clr.w	-$E(a6)
	moveq	#$0,d0
	move.l	d0,-$8(a6)
	clr.l	-$4(a6)
	clr.w	d4
loc_064650:
	move.w	d4,d0
	bmi.w	PlayerSelect_AllocCharBuffers_Measure
	cmpi.w	#$6,d0
	bgt.s	PlayerSelect_AllocCharBuffers_Measure
	add.w	d0,d0
	move.w	Sw_064638(pc,d0.w),d0
	jmp	Sw_064638-2(pc,d0.w)
