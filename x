
J4B Schedule
============
 
 6 u5 SE  SSR  = 6 u4 SE  SSR + Security fixes + SE license

 6 u5 J4B SSR  = 6 u4 SE  SSR + Security fixes 
                              + AU/SSV off 
                              + j4b license 
                              + escalation fixes from earlier revisions.
 ---
 
 5.0 u15 SE  SSR  = 5.0 u14 SE  SSR + Security fixes + SE license

 5.0 u15 J4B SSR  = 5.0 u14 SE  SSR + Security fixes 
                                    + AU/SSV off 
                                    + j4b license 
                                    + escalation fixes from earlier revisions. 

 Revs -> 5.0 u15 J4B Revisions 
                                     
 5.0 u16 J4B SSR  = 5.0 u15 SE  SSR + Security fixes  
                                    + AU/SSV off 
                                    + j4b license 
                                    + escalation fixes from earlier revisions.
 ---
 
 1.4.2_17 SE  SSR  = 1.4.2_16 SE  SSR + Security fixes + SE license

 1.4.2_17 J4B SSR  = 1.4.2_16 SE  SSR + Security fixes  
                                      + AU/SSV off 
                                      + j4b license 
                                      + escalation fixes from earlier revisions.
 REVs -> 1.4.2_17 J4B Revisions  
   
 1.4.2_18 J4B SSR  = 1.4.2_17 SE  SSR + Security fixes  
                                      + AU/SSV off 
                                      + j4b license 
                                      + escalation fixes from earlier revisions. 
 ---

 1.3.1_22 SE/J4B = (sec fixes + escalation fixes)
  
 REVs -> via v1.3.1_nn deliverable as required/requested

 ---

 STATUS: Unresolved
  - Need Tracy to sketch out draft schedule for 6, 5, 4, and 3.



J4B Product RFEs
================
 
 1) Version String (Product Name) RFE
    - CR# 6651966
    - http://monaco.sfbay/detail.jsf?cr=6651966
    - Working with Kumar Srinivasan
    - Web-rev
      http://javaweb.sfbay.sun.com/~ksrini/webrevs/j2se-tools/webrev.j2se.6651966/
    - STATUS: Unresolved
      - Awaiting CCC approval... Kumar driving this.
      - Kannan working on back port.


 2) AU/SSV-Off RFE
    - CR# 6649884
    - http://monaco.sfbay/detail.jsf?cr=6649884
    - Working with Andy Herrick, Joe Kowalski, and Kannan
    - Web-rev
      http://web-east.east/www/webrevs/ah22606/1.6.0_10/6649884/deploy/
    - STATUS: Unresolved
      - Change worked out for 6 
      - Back port work is being worked by Kannan.
      - Need to work through some aspects of the deployment
        model post a j4b world with AU-OFF and SSV-ON.
      - Questions posed to Andy/Joe in a different email thread
        ** Need response ASAP.

 3) License Change RFE
    - CR# 6652052
    - http://monaco.sfbay/detail.jsf?cr=6652052
    - Working with Abhijit.
    - Web-rev TBD.
    - STATUS: Unresolved
      - Abhjit has some changes for license selection
        ... he is checking/syncing with Joe/Andy.

 4) Makefile Changes for SE and J4B build/deliverables
    - Need: CR / RFE?
    - STATUS: Unresolved
      - Joe/Andy working this 
        ... need more status...?
 

J4B Bundle Names
================
 
 We will take the existing name in use (jre/jdk) and
 add '4b' as appropriate.
 
 e.g., 
  
  jre4b-1_5_0_17-ea-bin-b01-linux-amd64-08_jan_2008-rpm.bin
  jdk4b-1_5_0_17-ea-bin-b01-linux-amd64-08_jan_2008-rpm.bin

 The Solaris Patches/packages will *only* be in the j4b form.
  - on 6,5,4,3
  
 STATUS: Resolved
  - We will add “4b”


J4B EOL Notices
===============

 Needed for Java SE 1.4.2 and 5.0
 
 STATUS: Unresolved
  - Need to work with Bill/Tracy. 


J4B Product Documentation
=========================

 J4B Product Docs BOM

  Needed:

   - Changes to product name ->
      “Java (TM) Platform, Standard Edition for Business”
   - A mechanism to pick/or-compose the right SE and J4B doc(s)
     at build/staging time
   - Plans for handling each element of the BOM
   - localized into Japanese as appropriate

 * Dynamic content

    - Buglist
        - Will be generated at each Update and Revision cycle

    - System Configs
        - Will need to be an additive component to the
                  Java SE SysConfigs
        - Will be added to with the introduction of new
                  J4B platform support

    - Release Notes (provided on the web only)
        - Need to work out plan...? Does this hold the buglist?
        - Will be generated at each Update and Revision cycle

    - Readme Files for JDK and JRE (provided in the product
          bundles and on the web)
        - Will be generated at each Update and Revision cycle

    - Documentation Bundle (provided as a download AND on the web)
        - Not sure what this is?
                - If it’s the API, see below...

 * Almost Static :-) - Very rare change

    - manpages  (part of the product bundle)

    - messages  (part of the product bundle)
        - Need to decide what has to be done

 * Static

    - Not to be touched:-
        - the API      (part of the product bundle)
            - since this is still Java SE - and will remain.


 STATUS: Unresolved
  - Need to work out BOM, required edits, etc.
  - Working with Joann/Jacob/Roger.

 
J4B Product Localization
========================

 Simship or 30+ repost, what’s the plan? = simship
 
 STATUS: Unresolved
  - Need to work out a plan here -> Schedule


J4B Product License
===================

 Need J4B license for FCS, 
  ? what about one set for pre FCS (EA)
 
 Localized licenses = yes, to meet simship requirement.

 May not have a license file (English) until 2/4 or 2/11

 STATUS: Unresolved
  - Working with Melissa/Bill/Roger/Brenda, etc to get license.

J4B Product Name
================
 
 There are 2 approved names (full version, and abbreviation):

 Java (TM) Platform, Standard Edition for Business
   
   or,  abbreviated as:

   Java SE for Business.

 (if you are writing out the full name - do NOT drop the term 'platform').

 STATUS: Resolved 
  - Marketing/Branding have named the product.
