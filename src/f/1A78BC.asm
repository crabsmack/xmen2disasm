; ---------------------------------------------------------------------------
; sub_1A78BC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A78BC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$3C,$6A(a4)
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1A791A
	movea.l	$8C(a4),a0
	move.b	$3(a0),$70(a4)
	pea.l	($CA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($CA).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$44B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	clr.w	$12(a4)
	lea.l	$10(a7),a7
	move.w	#$2,$6C(a4)
	lea.l	sub_1A7848(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A795A
loc_1A791A:
	movea.l	$8C(a4),a0
	move.b	$1(a0),$70(a4)
	pea.l	($86).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($86).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$44AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1A77F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A795A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
