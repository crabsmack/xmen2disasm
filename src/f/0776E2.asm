; ---------------------------------------------------------------------------
; CloneA1_RunScene - scene function for 'CloneA1 Factory_Floor_1': set up the stage, parallax, a 60-frame timer, music $5E, run the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Scroll_SetParallax(jt $7737C); Timer_Create(sub_15B0D0, $3C, sub_077256, 1); sub_0C1478($5E) / sub_0C14B4 around level loop sub_1FA6FE
; ---------------------------------------------------------------------------
CloneA1_RunScene:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	CloneA1_EmptyStub(pc)
	jsr	CloneA1_LoadLevel(pc)
	jsr	CloneA1_InstallHooks(pc)
	lea.l	$10B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	move.w	#$A,-$BD8(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$10AA(a5)
	moveq	#$3C,d1
	move.l	d1,-(a7)
	pea.l	$3F32(a5)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	moveq	#$5E,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> sub_0C1478
	jsr	$5002(a5)	; -> Level_Run
	jsr	$2332(a5)	; -> sub_0C14B4
	movea.l	-$4(a6),a4
	unlk	a6
	rts
