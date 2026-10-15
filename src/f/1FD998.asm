; ---------------------------------------------------------------------------
; Pal_StartFade - start a palette fade from a given level (in from 0 upward, or out from a non-zero level downward)
; In:  8(a6) = word: start level (0 = fade in, else fade out)   $C(a6) = word: palette line or -1 for all   $10(a6) = pointer: fade table
; Out: none
; Evidence: timer -$7C4 = 0, delay -$3A04 = 4, level -$7BC, direction -$7BA = (level == 0), line -$7BE, table -$7C2; applies the first step (Pal_ApplyFade) and sets active byte -$3A02(a5); Pal_Update advances it
; ---------------------------------------------------------------------------
Pal_StartFade:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	clr.w	-$7C4(a5)
	move.w	#$4,-$3A04(a5)
	move.w	d7,-$7BC(a5)
	move.b	#$1,-$7BA(a5)
	tst.w	d7
	beq.s	loc_1FD9BE
	clr.b	-$7BA(a5)
loc_1FD9BE:
	move.w	$E(a6),-$7BE(a5)
	move.l	$10(a6),-$7C2(a5)
	move.l	-$7C2(a5),-(a7)
	move.w	-$7BC(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Pal_ApplyFade(pc)
	move.b	#$1,-$3A02(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
