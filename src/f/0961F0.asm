; ---------------------------------------------------------------------------
; XClone_StatePodWaitOpen - XCLONE entrance: when the pod has opened, play its closing animation (sound $F2)
; In:  8(a6) = this
; Out: d0
; Evidence: BioBalls_IsDone(pod) -> Obj_SetAnim(pod, Tbl_BioBallsAnim (jt $32F2)), pod state BioBalls_ActClearAnim; next XClone_StateEmerge
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StatePodWaitOpen:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_096220
	clr.w	$6C(a4)
	lea.l	XClone_StatePodWaitOpen(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_096266
loc_096220:
	clr.b	$96(a3)
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$32F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$3362(a5),a0
	move.l	a0,$5C(a3)
	move.w	#$FF,$6C(a3)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	XClone_StateEmerge(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_096266:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
