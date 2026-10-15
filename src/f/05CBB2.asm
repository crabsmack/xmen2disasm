; ---------------------------------------------------------------------------
; Tusk_AtkSpawnTusketteBoth - TUSK attack step: spawn a kind-2 TUSKETTE, then a kind-3 one after 30 frames
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: next Tusk_AtkSpawnTuskette3
; ---------------------------------------------------------------------------
Tusk_AtkSpawnTusketteBoth:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	sub.l	#$1000,d1
	move.l	d1,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$D8A(a5)	; -> Tuskette_Spawn
	movea.l	d0,a3
	lea.l	Tusk_AtkSpawnTuskette3(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$1E,$6C(a4)
	moveq	#$0,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
