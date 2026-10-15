; ---------------------------------------------------------------------------
; Apocalypse_StateLunge - APOCALYPSE: lunge 60 px forward and 80 px down with its attack animation and sound $E8
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Obj_ChangeAnim jt $BD2; Apocalypse_MoveTo(x +/- $3C00, y + $5000, +$9F); next Apocalypse_StateLungeEnd when the animation ends
; ---------------------------------------------------------------------------
Apocalypse_StateLunge:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_04C04A
	move.w	#$C400,d0
	bra.s	loc_04C04E
loc_04C04A:
	move.w	#$3C00,d0
loc_04C04E:
	ext.l	d0
	move.l	d0,d6
	add.l	$8(a4),d6
	move.l	$C(a4),d7
	add.l	#$5000,d7
	lea.l	$9D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($E8).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E8).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$0,d0
	move.b	$9F(a4),d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	Apocalypse_MoveTo(pc)
	lea.l	$20(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	Apocalypse_StateLungeEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
