; ---------------------------------------------------------------------------
; CloneA2_LoadResources - load the two CloneA2 graphics/resource sets into -$1A7E and -$1A88
; In:  none
; Out: none
; Evidence: sub_1F62C0(jt $3982 data, 1) -> -$1A7E, sub_1F62C0(jt $3662 data, 3) -> -$1A88 (same call shape as the actor ClassInit resource loads); called from CloneA2_InstallHooks
; ---------------------------------------------------------------------------
CloneA2_LoadResources:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3982(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A7E(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A88(a5)
	unlk	a6
	rts
