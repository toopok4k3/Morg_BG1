BEGIN k4morg

IF ~NumTimesTalkedTo(0)~ takehand
  SAY @0
  IF ~~ THEN REPLY @21 GOTO use_your_own
  IF ~~ THEN REPLY @22 GOTO take_hand
END

IF ~~ use_your_own
  SAY @1
  IF ~~ THEN REPLY @23 GOTO take_hand
  IF ~~ THEN REPLY @24 GOTO on_your_own
END

IF ~~ take_hand
  SAY @2
  IF ~~ THEN DO ~SetGlobal("k4takehand","LOCALS",1)
ReallyForceSpellRES("SPIN106A",LastTalkedToBy)
WAIT(3)
Dialogue(LastTalkedToBy)~ EXIT
END

IF ~Global("k4takehand","LOCALS",1)
Allegiance(myself, NEUTRAL)~ after_shake
  SAY @3
=
@4
  IF ~~ THEN REPLY @25 DO ~SetGlobal("k4takehand","LOCALS",0)~ GOTO wtf
  IF ~~ THEN REPLY @26 DO ~SetGlobal("k4takehand","LOCALS",0)~ GOTO wtf
  IF ~~ THEN REPLY @27 DO ~SetGlobal("k4takehand","LOCALS",0)~ GOTO kill
END

IF ~~ kill
  SAY @5
  IF ~~ THEN DO ~ReallyForceSpellRES("SPIN118",Myself)
EscapeArea()~ EXIT
END

IF ~~ on_your_own
  SAY @6
=
@7
  IF ~~ THEN REPLY @28 GOTO explain_more
  IF ~~ THEN REPLY @29 GOTO join_me
  IF ~~ THEN REPLY @30 GOTO nothxbye
END

IF ~~ wtf
  SAY @8
=
@7
  IF ~~ THEN REPLY @28 GOTO explain_more
  IF ~~ THEN REPLY @29 GOTO join_me
  IF ~~ THEN REPLY @30 GOTO nothxbye
END

IF ~~ explain_more
  SAY @9
=
@10
=
@11
    IF ~~ THEN REPLY @31 GOTO join_me
END

IF ~~ join_me
  SAY @12
    IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ nothxbye
  SAY @13
    IF ~~ THEN DO ~EscapeAreaMove("AR2300", 1330, 2200, 12)~ EXIT
END

BEGIN k4morgP

IF ~Global("KickedOut","LOCALS",0)~ kickout
  SAY @14
  ++ @32 DO ~SetGlobal("KickedOut","LOCALS",1)~ GOTO farewell
  ++ @33 + nowait
END

IF ~~ nowait
  SAY @15
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ farewell
  SAY @16
  IF ~~ THEN DO ~LeaveParty()
EscapeAreaMove("AR2300", 1330, 2200, 12)~ EXIT
END

IF ~Global("KickedOut","LOCALS",1)~ saveme
  SAY @17
  ++ @34 + joinagain
  ++ @35 + anotherround
  ++ @36 + koboldkiss
END

IF ~~ joinagain
  SAY @18
  IF ~~ THEN DO ~SetGlobal("KickedOut","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ anotherround
  SAY @19
  IF ~~ THEN EXIT
END

IF ~~ koboldkiss
  SAY @20
  IF ~~ THEN EXIT
END