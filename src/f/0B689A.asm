; ---------------------------------------------------------------------------
; BrainBabyBio_SetHome - BRAINBABYBIO: set its home position (+$BC/+$BE)
; In:  8(a6) = this, $E(a6) = word x, $12(a6) = word y
; Out: none
; Evidence: BrainBabyBio_Init stores its spawn pixel position there; caller BrainChild_OnDeath ($8A, $140)
; Found: link-after-rts
; ---------------------------------------------------------------------------
BrainBabyBio_SetHome:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),$BC(a4)
	move.w	$12(a6),$BE(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
