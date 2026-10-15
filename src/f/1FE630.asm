; ---------------------------------------------------------------------------
; Snd_SetParam - set sound driver parameter slot N to a value (driver command $1B + index + value) unless muted
; In:  8(a6) = long: slot index   $C(a6) = long: value
; Out: none
; Evidence: callers write slots 0, $A, $B, $C, $12, $13 (sub_0C14B4 zeroes $A-$C after Snd_StopAll); active in 2327 TAS frames
; ---------------------------------------------------------------------------
Snd_SetParam:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$1B,d0
	bra.w	Snd_SendCmd2
