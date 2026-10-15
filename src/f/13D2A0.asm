; ---------------------------------------------------------------------------
; Ninja_StateNextStep - NINJA default state (+$5C/+$64 from Init): advance its AI script to the next step after 60 frames
; In:  8(a6) = this
; Out: none
; Evidence: script +$96 index/+$98 table: index += 1 (wraps at the count), +$5C = thunk table + 2 + 4*index, +$6C = 60; null script -> +$64
; ---------------------------------------------------------------------------
Ninja_StateNextStep:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_13D2BE
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_13D2EC
loc_13D2BE:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D2D2
	clr.w	$96(a4)
loc_13D2D2:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_13D2EC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
