; ---------------------------------------------------------------------------
; DropBomb_StateDrop - DROPBOMB state: start falling (gravity +$20 = $3C, falling animation)
; In:  8(a6) = this
; Out: d0
; Evidence: sets y acceleration +$20 = $3C, sub_1F6296(this, Tbl_DropBombAnimFall), handler := DropBomb_StateFall
; Found: link-after-rts
; ---------------------------------------------------------------------------
DropBomb_StateDrop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$3C,$20(a4)
	lea.l	$119A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	DropBomb_StateFall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
