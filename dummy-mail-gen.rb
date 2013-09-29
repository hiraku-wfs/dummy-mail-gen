#!/usr/bin/env ruby
require 'mail'

def make_mail
  mail = Mail.new do
    from    'hogehoge@example.com'
    to      'you@test.example.com'
    subject 'This is a test email'
    body    "Body!\r\n"
  end
  return mail
end

def make_maildir(year, month, num)
  dir = year + month
  if !Dir.exist?(dir) then
    Dir.mkdir(dir, 0775)
  end

  num.times {
    mail = make_mail
    mail.date = DateTime.new(year.to_i, month.to_i, 1, 0, 0, 0)
    mail_str = mail.to_s
    # use UNIX-time and Message-ID for filename
    File.write("#{dir}/#{mail.date.strftime('%s')}-#{mail.message_id}",
               mail_str)
  }
end

def make_maildirs_range(year_st, month_st, year_ed, month_ed, num)
  year = year_st
  month = month_st
  while (year + month) <= (year_ed + month_ed)
    make_maildir(year, month, num)
    if (month != "12") then
      month = month.succ
    else
      year = year.succ
      month = "01"
    end
  end
end

exit 1 if ARGV.size != 5
year_st = ARGV.shift
month_st = ARGV.shift
year_ed = ARGV.shift
month_ed = ARGV.shift
num = ARGV.shift.to_i
make_maildirs_range(year_st, month_st, year_ed, month_ed, num)
