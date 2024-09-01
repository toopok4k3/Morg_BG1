BEGIN ~k4lokir~

IF ~NumTimesTalkedTo(0)~ hail
  SAY ~Even a deaf greybeard child would have heard yer loud footstomps. Come lad's, let's silence 'em for eternity.~
    IF ~~ THEN DO ~Shout(99)
Enemy()~ EXIT
END
