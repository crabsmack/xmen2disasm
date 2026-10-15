; ---------------------------------------------------------------------------
; Z80_BusAcquire - stop the Z80 and return to the caller holding its bus (release via Z80_BusRelease)
; In:  none
; Out: d1 = word: Z80 RAM byte $A00036 (sound driver status), a0 = $A00036, a1 = $A01B40 (Z80 RAM command area); a6 frame left open
; Evidence: pops its return address, builds a frame saving d1/a1 and SR, masks interrupts, requests the bus ($A11100 = $100) and waits for the grant, then returns into the caller; callers end with jmp Z80_BusRelease
; ---------------------------------------------------------------------------
Z80_BusAcquire:
	movea.l	(a7)+,a0
	link.w	a6,#$0
	movem.l	d1/a1,-(a7)
	move.w	sr,-(a7)
	move.l	a0,-(a7)
	lea.l	($A00036).l,a0
	lea.l	($A01B40).l,a1
	ori.w	#$700,sr
	move.w	#$100,($A11100).l
loc_1FE4DC:
	btst	#$0,($A11100).l
	bne.s	loc_1FE4DC
	move.b	(a0),d1
	ext.w	d1
	rts
Z80_BusRelease:
	move.w	#$0,($A11100).l
	move.w	(a7)+,sr
	movem.l	(a7)+,d1/a1
	unlk	a6
	rts
