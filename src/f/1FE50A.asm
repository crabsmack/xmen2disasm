; ---------------------------------------------------------------------------
; Snd_PutByte - append one byte to the Z80 command ring and publish the new write index
; In:  d0 = byte, d1 = ring write index, a0 = $A00036 (index cell), a1 = $A01B40 (ring)
; Out: d1 = new index
; Evidence: (a1,d1) = d0; d1 = (d1+1) & $3F; (a0) = d1
; ---------------------------------------------------------------------------
Snd_PutByte:
	move.b	d0,(a1,d1.w)
	addq.b	#$1,d1
	andi.b	#$3F,d1
	move.b	d1,(a0)
	rts
