; ---------------------------------------------------------------------------
; SyncActor_ClassInit - create the BBOARD switch board g_BBoard (100 entries) if there is none yet (static, class slot 22, +$5E; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: BBOARD descriptor slot +$0A New(desc, 100); method 22 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_ClassInit:
	link.w	a6,#$0
	tst.l	g_BBoard(a5)
	bne.s	loc_119D6E
	moveq	#$64,d0
	move.l	d0,-(a7)
	lea.l	$2EC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2EC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_BBoard(a5)
	addq.w	#$8,a7
loc_119D6E:
	unlk	a6
	rts
