; ---------------------------------------------------------------------------
; VDP_FlushDmaQueue - V-blank DMA: upload the sprite table to VRAM $F000 and run every queued DMA, with the sound driver paused
; In:  none
; Out: none
; Evidence: Z80_DriverPause; DMA $280 bytes from -$1FDA(a5) ($FFE226) to VRAM $F000 (command $70000083); then writes each queued record's 8 register words, clears count -$7B4; Z80_DriverResume; called by VDP_FrameUpdate when byte -$1D4A(a5) is set
; ---------------------------------------------------------------------------
VDP_FlushDmaQueue:
	jsr	$5202(a5)	; -> Z80_DriverPause
	lea.l	($C00004).l,a1
	move.w	-$1D48(a5),d0
	ori.w	#$10,d0
	move.w	d0,(a1)
	move.w	#$9340,(a1)
	move.w	#$9401,(a1)
	lea.l	-$1FDA(a5),a0
	move.l	a0,d1
	lsr.l	#$1,d1
	move.w	#$9500,d0
	move.b	d1,d0
	move.w	d0,(a1)
	move.b	#$96,d1
	rol.w	#$8,d1
	move.w	d1,(a1)
	swap	d1
	andi.w	#$7F,d1
	ori.w	#$9700,d1
	move.w	d1,(a1)
	move.l	#$70000083,-(a7)
	move.w	(a7)+,(a1)
	move.w	(a7)+,(a1)
	moveq	#$2,d0
loc_1FE2D8:
	and.w	(a1),d0
	bne.s	loc_1FE2D8
	move.w	-$1D48(a5),(a1)
	lea.l	-$7A4(a5),a0
	move.w	-$7B4(a5),d2
	bra.w	loc_1FE308
loc_1FE2EC:
	addq.w	#$8,a0
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	moveq	#$2,d0
loc_1FE300:
	and.w	(a1),d0
	bne.s	loc_1FE300
	move.w	-$1D48(a5),(a1)
loc_1FE308:
	dbra	d2,loc_1FE2EC
	clr.w	-$7B4(a5)
	jsr	$520A(a5)	; -> Z80_DriverResume
	rts
