; ---------------------------------------------------------------------------
; Bitmap_Test - test bit n of a bitmap
; In:  8(a6) = bitmap, $C(a6) = word n
; Out: d0 = byte $FF set / 0
; Evidence: byte n>>3 & 1 << (n & 7)
; ---------------------------------------------------------------------------
Bitmap_Test:
	movea.l	$4(a7),a0
	move.w	$A(a7),d1
	moveq	#$7,d0
	and.w	d1,d0
	lsr.w	#$3,d1
	btst	d0,(a0,d1.w)
	sne.b	d0
	rts
