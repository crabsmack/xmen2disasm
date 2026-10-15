; ---------------------------------------------------------------------------
; Game_AttractDemoNightcrawler - attract demo 0: Nightcrawler in scene -$3B56 with demo input jt $3E9A
; In:  none
; Out: none
; Evidence: case 0 of the g_SceneIndex == -1 switch in Game_SceneLoop; resets demo counter -$3B90; loads class jt $2BA2 (Nightcrawler) then falls into Game_PlayAttractDemo
; ---------------------------------------------------------------------------
Game_AttractDemoNightcrawler:
	clr.w	-$3B90(a5)
loc_005E52:
	moveq	#$0,d7
	move.b	-$3B56(a5),d7
	tst.l	d7
	lea.l	$3E9A(a5),a0
	movea.l	$2(a0),a3
	lea.l	$2BA2(a5),a0
	movea.l	$2(a0),a4
	bra.s	Game_PlayAttractDemo
