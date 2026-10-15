; ---------------------------------------------------------------------------
; SyncActor_LevelInit - SyncActor: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_LevelInit:
	link.w	a6,#$0
	tst.l	-$1CA6(a5)
	bne.s	loc_119D6E
	moveq	#$64,d0
	move.l	d0,-(a7)
	lea.l	$2EC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2EC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,-$1CA6(a5)
	addq.w	#$8,a7
loc_119D6E:
	unlk	a6
	rts
