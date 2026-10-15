; ---------------------------------------------------------------------------
; unk_Snd_1FE5B4 - send driver command $20 with one byte argument unless muted (meaning unknown)
; In:  8(a6) = long: argument byte
; Out: none
; Evidence: only caller Music_Play sends it with $0A between Snd_StopAll and Snd_Play(track); possibly a music volume/tempo setting, unconfirmed
; ---------------------------------------------------------------------------
unk_Snd_1FE5B4:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$20,d0
	bra.s	loc_1FE592
