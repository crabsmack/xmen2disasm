; ---------------------------------------------------------------------------
; Game_AttractDemoCyclops - attract demo 1: Cyclops in scene -$3B74 with demo input jt $3E92
; In:  none
; Out: none
; Evidence: case 1 of the attract switch in Game_SceneLoop; class jt $2BCA = Cyclops (Player_CharIndexOf index 1)
; ---------------------------------------------------------------------------
Game_AttractDemoCyclops:
	moveq	#$0,d7
	move.b	-$3B74(a5),d7
	tst.l	d7
	lea.l	$3E92(a5),a0
	movea.l	$2(a0),a3
	lea.l	$2BCA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Game_PlayAttractDemo
Game_AttractDemoPsylocke:
	moveq	#$0,d7
	move.b	-$3B4C(a5),d7
	tst.l	d7
	lea.l	$3E8A(a5),a0
	movea.l	$2(a0),a3
	lea.l	$2BAA(a5),a0
	movea.l	$2(a0),a4
	bra.s	Game_PlayAttractDemo
Game_AttractDemoBeast:
	moveq	#$0,d7
	move.b	-$3B72(a5),d7
	tst.l	d7
	lea.l	$3E82(a5),a0
	movea.l	$2(a0),a3
	lea.l	$2B9A(a5),a0
	movea.l	$2(a0),a4
