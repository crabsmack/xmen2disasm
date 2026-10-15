; ---------------------------------------------------------------------------
; Z80_LoadDriver - hold the Z80 in reset, copy the sound driver into Z80 RAM and zero the rest
; In:  none
; Out: none
; Evidence: asserts reset ($A11200), Z80_BusRequest, copies ROM $1FE66C-$1FFED2 to $A00000 then zero-fills up to $A02000; called by Snd_Init
; ---------------------------------------------------------------------------
Z80_LoadDriver:
	move.l	a1,-(a7)
	move.w	sr,-(a7)
	ori.w	#$700,sr
	move.w	#$100,($A11200).l
	jsr	Z80_BusRequest(pc)
	lea.l	$1FE66C(pc),a0
	lea.l	$1FFED3(pc),a1
	move.l	a1,d0
	sub.l	a0,d0
	subq.w	#$1,d0
	lea.l	($A00000).l,a1
loc_1FE476:
	move.b	(a0)+,(a1)+
	dbra	d0,loc_1FE476
loc_1FE47C:
	move.b	#$0,(a1)+
	cmpa.l	#$A02000,a1
	bne.s	loc_1FE47C
	move.w	(a7)+,sr
	movea.l	(a7)+,a1
	rts
