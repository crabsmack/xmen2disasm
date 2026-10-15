; ---------------------------------------------------------------------------
; BabyBio_LevelInit - BabyBio: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_LevelInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	BabyBio_Reset(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
