; ---------------------------------------------------------------------------
; XPlayer_DropThrough - XPLAYER slot +$86: drop down through a thin floor (Down + jump)
; In:  8(a6) = player
; Out: none
; Evidence: Cam_CommitLook, Obj_Detach, $1F6EC4; draw layer +$42 - 1 and y += $25 px; +$90 |= 8; jump sound; SetFrame(char +$29); only when the floor's byte 2 > 0
; ---------------------------------------------------------------------------
XPlayer_DropThrough:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	g_Camera(a5),-(a7)
	jsr	$3EAA(a5)	; -> Cam_CommitLook
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.l	a4,-(a7)
	jsr	$4EE2(a5)	; -> Seg_AlignObjVelocity
	moveq	#$0,d0
	move.b	$42(a4),d0
	tst.l	d0
	lea.l	$C(a7),a7
	bls.s	loc_1F23AE
	subq.b	#$1,$42(a4)
	addi.l	#$2500,$C(a4)
loc_1F23AE:
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.b	#$1,g_CamModeSwitched(a5)
	ori.l	#$8,$90(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d1
	move.b	$2D(a0),d1
	cmpi.w	#$FF,d1
	addq.w	#$4,a7
	beq.s	loc_1F23FC
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2D(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2D(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F23FC:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$29(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
