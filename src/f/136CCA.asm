; ---------------------------------------------------------------------------
; Hornet_StateShotRecover - Hornet state: back to the idle animation and wait +$A2 before the next shot
; In:  8(a6) = this
; Out: d0 = flags & 8 (unused)
; Evidence: Obj_ChangeAnim(Tbl_HornetAnimIdle); +$6C = +$A2 (immediate when -1), +$5C = Hornet_StateShotLoop
; ---------------------------------------------------------------------------
Hornet_StateShotRecover:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$37CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	moveq	#-$1,d0
	cmp.w	$A2(a4),d0
	addq.w	#$8,a7
	bne.s	loc_136CFE
	lea.l	Hornet_StateShotLoop(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Hornet_StateShotLoop(pc)
	addq.w	#$4,a7
	bra.s	loc_136D12
loc_136CFE:
	move.w	$A2(a4),$6C(a4)
	lea.l	Hornet_StateShotLoop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136D12:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
