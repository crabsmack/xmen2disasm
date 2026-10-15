; ---------------------------------------------------------------------------
; VDP_DmaToVram - immediately DMA a block from 68000 memory to VRAM and wait for completion
; In:  4(a7) = long: source address   8(a7) = long: VRAM dest (low word)   $C(a7) = long: length in bytes (low word)
; Out: none
; Evidence: builds regs $93-$97 from len/2 and src/2 and command $4000|dest + $80 (DMA), DMA enabled via reg1 shadow -$1D48 | $10; polls status bit 1; used by VDP_QueueDma when the display is off
; ---------------------------------------------------------------------------
VDP_DmaToVram:
	moveq	#$0,d0
	move.w	$A(a7),d0
	lsl.l	#$2,d0
	lsr.w	#$2,d0
	ori.l	#$804000,d0
	swap	d0
	move.l	d0,-(a7)
	move.w	g_VdpReg1(a5),d0
	ori.w	#$10,d0
	move.w	d0,($C00004).l
	move.w	$12(a7),d1
	lsr.w	#$1,d1
	move.w	#$9300,d0
	move.b	d1,d0
	move.w	d0,($C00004).l
	move.b	#$94,d1
	rol.w	#$8,d1
	move.w	d1,($C00004).l
	move.l	$8(a7),d1
	lsr.l	#$1,d1
	move.w	#$9500,d0
	move.b	d1,d0
	move.w	d0,($C00004).l
	move.b	#$96,d1
	rol.w	#$8,d1
	move.w	d1,($C00004).l
	swap	d1
	andi.w	#$7F,d1
	ori.w	#$9700,d1
	move.w	d1,($C00004).l
	move.w	(a7)+,($C00004).l
	move.w	(a7)+,($C00004).l
	moveq	#$2,d0
loc_1FE168:
	and.w	($C00004).l,d0
	bne.s	loc_1FE168
	move.w	g_VdpReg1(a5),($C00004).l
	rts
