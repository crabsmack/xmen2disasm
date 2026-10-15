; ---------------------------------------------------------------------------
; BaniMazaA2_RunScene - scene function for 'BaniMazaA2 ApocalypseBoss': set up the stage, start the sprite timer, run the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Timer_Create/Timer_Start(BaniMazaA2_AnimSprite); level loop Level_Run
; ---------------------------------------------------------------------------
BaniMazaA2_RunScene:
	link.w	a6,#$FDE8
	movem.l	a3-a4,-(a7)
	lea.l	-$218(a6),a3
	jsr	BaniMazaA2_CallEmptyStub(pc)
	jsr	BaniMazaA2_LoadLevel(pc)
	jsr	BaniMazaA2_PlacePlayers(pc)
	jsr	BaniMazaA2_InitCamera(pc)
	jsr	BaniMazaA2_ResetCounters(pc)
	jsr	BaniMazaA2_InitSprite(pc)
	move.l	a3,-(a7)
	jsr	sub_0472CC(pc)
	addq.w	#$4,a7
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	BaniMazaA2_AnimSprite(pc)
	moveq	#$A,d1
	move.l	d1,-(a7)
	pea.l	$3F32(a5)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_04796C
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_04796C:
	jsr	$5002(a5)	; -> Level_Run
	movem.l	-$220(a6),a3-a4
	unlk	a6
	rts
