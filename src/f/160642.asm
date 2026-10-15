; ---------------------------------------------------------------------------
; Sys_InitHardware - power-on hardware init: V-int hooks, VDP shadows, DMA queue, clear VRAM/CRAM/VSRAM, enable V-int and display
; In:  none
; Out: none
; Evidence: clears g_VBlankHook, Irq_Enable, reg 11 shadow g_VdpReg11 = $8B00/$8B08, VDP_ResetDmaQueue, frame counter g_VBlankCount = 0, VDP_ClearCram/VDP_ClearVram/VDP_ClearVsram, reg1 shadow g_VdpReg1 |= $20 then $40, Scroll_Init; TAS frame 4
; ---------------------------------------------------------------------------
Sys_InitHardware:
	link.w	a6,#$0
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,g_VBlankHook(a5)
	jsr	$4D92(a5)	; -> unk_Sys_1F4890
	moveq	#$0,d7
	tst.l	d7
	beq.s	loc_160676
	lea.l	$5122(a5),a0
	move.l	a0,g_VBlankHook(a5)
	lea.l	$512A(a5),a0
	move.l	a0,g_VBlankHook(a5)
	lea.l	$51C2(a5),a0
	move.l	a0,g_VBlankHook(a5)
	moveq	#$0,d0
	move.l	d0,g_VBlankHook(a5)
loc_160676:
	move.l	#$FF0000,g_HeapTop(a5)
	jsr	$4DA2(a5)	; -> Irq_Enable
	tst.b	g_ExtIntMode(a5)
	beq.s	loc_160690
	move.w	#$8B08,g_VdpReg11(a5)
	bra.s	loc_160696
loc_160690:
	move.w	#$8B00,g_VdpReg11(a5)
loc_160696:
	jsr	VDP_InitRegs(pc)
	tst.b	g_ExtIntMode(a5)
	beq.s	loc_1606A8
	dc.w	$13FC,$FF80,$00A1,$000D	; insn: move.b #$80, $a1000d.l
loc_1606A8:
	jsr	$50D2(a5)	; -> VDP_ResetDmaQueue
	moveq	#$0,d0
	move.l	d0,g_VBlankCount(a5)
	jsr	$51CA(a5)	; -> unk_VDP_1FE05C
loc_1606B6:
	moveq	#$2,d0
	and.w	($C00004).l,d0
	bne.s	loc_1606B6
	jsr	$5192(a5)	; -> VDP_ClearCram
	jsr	$5182(a5)	; -> VDP_ClearVram
	jsr	$518A(a5)	; -> VDP_ClearVsram
	ori.w	#$20,g_VdpReg1(a5)
	move.w	g_VdpReg1(a5),($C00004).l
	ori.w	#$40,g_VdpReg1(a5)
	move.w	g_VdpReg1(a5),($C00004).l
	jsr	$4E02(a5)	; -> Scroll_Init
	move.l	-$4(a6),d7
	unlk	a6
	rts
