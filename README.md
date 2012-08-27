ToXMPP
======

ToXMPP is a simple script that forwards text from STDIN or file(s) to a Google talk user. 

https://github.com/spartango/ToXmpp

Usage
-----

First, add your google talk username and password to toxmpp.rb (lines 7 & 8)

> bundle install 

To install dependencies. Then,

> ruby toxmpp.rb recipient@domain [files]

Will send the contents of the file(s) to the recipient

> tail -f file | ruby toxmpp.rb recipient@domain

Will cause toXMPP to get its input from STDIN, continuing to send text line by line.

...

Did I mention you can get realtime logfile alerts this way? You can even filter by level! e.g.

> tail -f log.log | grep [error] | ruby toxmpp.rb recipient@domain

Related
-------

ToXMPP uses XMPP4r (http://home.gna.org/xmpp4r/)

ToXMPP works excellently with Malcolm chatrooms (https://github.com/spartango/Malcolm-bot) 
as well as XMPP-bridged Hubot installations. 

Authors
-------

Anand Gupta (https://github.com/spartango)
