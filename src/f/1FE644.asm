; ---------------------------------------------------------------------------
; Snd_ReadDriverByte - read byte N of the Z80 driver status area ($A01B22+N) unless muted
; In:  8(a6) = long: index (low byte)
; Out: d0 = byte read (unchanged if muted)
; Evidence: SR masked, Z80_BusRequest, reads $A01B22+idx, Z80_BusFree; one caller BroodClaw_StateWaitMusic (TAS frames 51133-51930)
; ---------------------------------------------------------------------------
Snd_ReadDriverByte:
	tst.b	g_SndMute(a5)
	bne.s	loc_1FE66A
	move.w	sr,-(a7)
	ori.w	#$700,sr
	jsr	Z80_BusRequest(pc)
	moveq	#$0,d0
	move.b	$9(a7),d0
	lea.l	($A01B22).l,a0
	move.b	(a0,d0.w),d0
	jsr	Z80_BusFree(pc)
	move.w	(a7)+,sr
loc_1FE66A:
	rts
