; ---------------------------------------------------------------------------
; Wolverine_GroundSpecial - WOLVERINE slot +$DE: ground special: leaping forward slash
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: Obj_Detach, vy -$300, gravity $3F, vx +/-$396; health <= $700 -> sound $88 + animation jt $45A2 data, else $8A + $45AA; delay 20, next Wolverine_LeapSlashEnd
; ---------------------------------------------------------------------------
Wolverine_GroundSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.w	#$FD00,$18(a4)
	move.w	#$3F,$20(a4)
	move.w	#$396,$22(a4)
	clr.w	$1E(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_197708
	move.l	#$FFFFFC6A,d0
	bra.s	loc_19770E
loc_197708:
	move.l	#$396,d0
loc_19770E:
	move.w	d0,$16(a4)
	cmpi.w	#$701,$68(a4)
	addq.w	#$4,a7
	blt.s	loc_197740
	pea.l	($8A).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($8A).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$43AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	bra.s	loc_197762
loc_197740:
	pea.l	($88).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($88).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$43A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
loc_197762:
	move.w	#$14,$6C(a4)
	lea.l	Wolverine_LeapSlashEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
