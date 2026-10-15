; ---------------------------------------------------------------------------
; Actor_StateHurt - default hurt state (+$60): when health is gone start falling dead, else return to the default state
; In:  8(a6) = this
; Out: none
; Evidence: health +$68 <= 0: health 0, Obj_Detach, accel 0/100, +6 |= $80 (no collision), state Actor_StateFallDead; else +$5C = +$64; installed by Actor_Init
; ---------------------------------------------------------------------------
Actor_StateHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$68(a4)
	bgt.s	loc_15DB18
	clr.w	$68(a4)
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	clr.w	$1E(a4)
	move.w	#$64,$20(a4)
	ori.w	#$80,$6(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Actor_StateFallDead(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_15DB1E
loc_15DB18:
	move.l	$64(a4),$5C(a4)
loc_15DB1E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
