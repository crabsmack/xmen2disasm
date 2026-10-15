; ---------------------------------------------------------------------------
; Nem_BuildCodeTable - build the 256-entry code lookup table for Nem_Decode from (code length, value) byte pairs
; In:  8(a6) = pair list ($FF terminated)   $C(a6) = 256-word table
; Out: d0 = pointer past the list
; Evidence: each pair fills 2^(8-len) consecutive words with (len << 8 | value); callers Spr_PreloadTiles, sub_1F5612, sub_1FBE96, sub_1FD72C
; ---------------------------------------------------------------------------
Nem_BuildCodeTable:
	movea.l	$4(a7),a0
	movea.l	$8(a7),a1
loc_15F5D2:
	moveq	#$0,d2
	move.b	(a0)+,d2
	cmpi.b	#$FF,d2
	beq.s	loc_15F5F8
	move.w	d2,d1
	lsl.w	#$8,d1
	move.b	(a0)+,d1
	moveq	#$8,d0
	sub.w	d2,d0
	beq.s	loc_15F5F0
	move.w	d0,d2
	moveq	#$1,d0
	lsl.w	d2,d0
	subq.w	#$1,d0
loc_15F5F0:
	move.w	d1,(a1)+
	dbra	d0,loc_15F5F0
	bra.s	loc_15F5D2
loc_15F5F8:
	move.l	a0,d0
	rts
