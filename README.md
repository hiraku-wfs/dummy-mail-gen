dummy-mail-gen
==============

Dummy mail generator which saves the mails into monthly directories

#Usage

    ./dummy-mail-gen.rb year_begin month_begin year_end month_end num_mail_per_month

example:
The following command line generates 100 mails per month since April,2012 until March,2013.

    $ ./dummy-mail-gen.rb 2012 04 2013 03 100
    $ ls
    201204  201206  201208  201210  201212  201302  dummy-mail-gen.rb
    201205  201207  201209  201211  201301  201303
    $ ls 201204
    1333238400-524838f14e985_1ed47d90248067e@localhost.localdomain.mail
    1333238400-524838f151966_1ed47d90248074@localhost.localdomain.mail
    1333238400-524838f154013_1ed47d90248086d@localhost.localdomain.mail
    ...

The filename of each mail is consist of UNIX-time and Message-ID of the mail.
