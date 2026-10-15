; ---------------------------------------------------------------------------
; Pad_ReadPort - read a 3/6-button joypad on port d0 (0 or 1) with the TH-toggle protocol
; In:  d0 = word: port (0 = $A10003, 1 = $A10005); >1 returns at once
; Out: d0 = buttons active-high (bits 0-3 Up/Down/Left/Right, 4-7 B/C/A/Start, 8-11 Z/Y/X/Mode, $4000 = 6-button pad), $8000 = no pad
; Evidence: holds the Z80 bus, toggles TH ($40) four times, checks the 6-button signature; only caller Pad_ReadBoth in the V-int
; ---------------------------------------------------------------------------
Pad_ReadPort:
	cmpi.w	#$1,d0
	ble.s	loc_1FD626
	rts
loc_1FD626:
	move.w	#$100,($A11100).l
	move.w	#$100,($A11200).l
loc_1FD636:
	btst	#$0,($A11100).l
	bne.s	loc_1FD636
	add.w	d0,d0
	movea.l	#$A10003,a0
	adda.w	d0,a0
	moveq	#$0,d0
	move.b	#$40,$6(a0)
	nop
	nop
	move.b	#$40,(a0)
	moveq	#$0,d0
	nop
	nop
	nop
	move.b	(a0),d0
	cmpi.b	#$70,d0
	beq.w	loc_1FD712
	move.b	#$0,(a0)
	lsl.w	#$8,d0
	move.b	(a0),d0
	cmpi.b	#$3F,d0
	beq.w	loc_1FD712
	move.b	#$40,(a0)
	moveq	#$0,d1
	nop
	nop
	nop
	move.b	(a0),d1
	move.b	#$0,(a0)
	lsl.w	#$8,d1
	move.b	(a0),d1
	move.b	#$40,(a0)
	moveq	#$0,d2
	nop
	nop
	nop
	move.b	(a0),d2
	move.b	#$0,(a0)
	lsl.w	#$8,d2
	move.b	(a0),d2
	move.b	#$40,(a0)
	swap	d2
	nop
	nop
	nop
	move.b	(a0),d2
	move.b	#$0,(a0)
	lsl.w	#$8,d2
	move.b	(a0),d2
	move.b	#$40,(a0)
	swap	d2
	cmp.w	d0,d1
	bne.s	loc_1FD712
	cmp.w	d1,d2
	beq.s	loc_1FD6F8
	andi.w	#$F,d2
	bne.s	loc_1FD712
	lsl.b	#$2,d0
	lsl.w	#$2,d0
	ror.w	#$8,d0
	ror.b	#$2,d0
	andi.w	#$FF,d0
	swap	d2
	andi.w	#$F00,d2
	or.w	d2,d0
	not.w	d0
	andi.l	#$4FFF,d0
	move.w	#$0,($A11100).l
	rts
loc_1FD6F8:
	lsl.b	#$2,d0
	lsl.w	#$2,d0
	ror.w	#$8,d0
	ror.b	#$2,d0
	andi.l	#$FF,d0
	not.b	d0
	move.w	#$0,($A11100).l
	rts
loc_1FD712:
	move.w	#$8000,d0
	move.w	#$0,($A11100).l
	rts
