; ---------------------------------------------------------------------------
; sub_0B0538	[jt 906]
; ---------------------------------------------------------------------------
sub_0B0538:
	link.w	a6,#$0
	jsr	sub_0B0520(pc)
	jsr	sub_0B0484(pc)
	jsr	sub_0B050A(pc)
	jsr	sub_0B03A2(pc)
	jsr	$1BFA(a5)	; -> sub_0AD420
	jsr	sub_0B0468(pc)
	jsr	sub_0B02EC(pc)
	jsr	sub_0B0408(pc)
	jsr	$1C1A(a5)	; -> sub_0AD7E4
	jsr	sub_0B0528(pc)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	jsr	$5002(a5)	; -> Level_Run
	jsr	$5242(a5)	; -> Snd_StopAll
	unlk	a6
	rts
