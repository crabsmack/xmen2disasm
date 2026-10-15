; ---------------------------------------------------------------------------
; Magneto_FrameInBank - frame number within its Magneto sprite bank
; In:  8(a6) = word frame
; Out: d0 = frame (- $40 or - $60), $FF kept
; Evidence: companion of Magneto_FrameBank
; ---------------------------------------------------------------------------
Magneto_FrameInBank:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	cmpi.w	#$FF,d7
	bne.s	loc_159A1C
	move.w	#$FF,d0
	bra.s	loc_159A3E
loc_159A1C:
	cmpi.w	#$60,d7
	blt.s	loc_159A2C
	ext.l	d7
	move.l	d7,d0
	moveq	#$60,d1
	sub.l	d1,d0
	bra.s	loc_159A3E
loc_159A2C:
	cmpi.w	#$40,d7
	blt.s	loc_159A3C
	ext.l	d7
	move.l	d7,d0
	moveq	#$40,d1
	sub.l	d1,d0
	bra.s	loc_159A3E
loc_159A3C:
	move.w	d7,d0
loc_159A3E:
	move.l	-$4(a6),d7
	unlk	a6
	rts
