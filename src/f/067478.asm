; ---------------------------------------------------------------------------
; PlayerSelect_PlayPickAnim_part2 - part 2 of PlayerSelect_PlayPickAnim: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of PlayerSelect_PlayPickAnim
; Out: continues in PlayerSelect_PlayPickAnim
; Evidence: only reached by branches from PlayerSelect_PlayPickAnim
; ---------------------------------------------------------------------------
PlayerSelect_PlayPickAnim_part2:
	lea.l	$49F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$4AA2(a5),a0
	movea.l	$2(a0),a4
	addq.w	#$8,a7
	bra.s	PlayerSelect_PlayPickAnim_part3
loc_067492:
	lea.l	$4882(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$4902(a5),a0
	movea.l	$2(a0),a4
	addq.w	#$8,a7
	bra.s	PlayerSelect_PlayPickAnim_part3
loc_0674AC:
	lea.l	$448A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$44C2(a5),a0
	movea.l	$2(a0),a4
	addq.w	#$8,a7
	bra.s	PlayerSelect_PlayPickAnim_part3
loc_0674C6:
	lea.l	$4572(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$45CA(a5),a0
	movea.l	$2(a0),a4
	addq.w	#$8,a7
	bra.s	PlayerSelect_PlayPickAnim_part3
loc_0674E0:
	lea.l	$439A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$43D2(a5),a0
	movea.l	$2(a0),a4
	addq.w	#$8,a7
	bra.s	PlayerSelect_PlayPickAnim_part3
loc_0674FA:
	lea.l	$466A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$0,d0
	movea.l	d0,a4
	addq.w	#$8,a7
