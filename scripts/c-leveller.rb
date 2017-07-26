#!/usr/bin/env ruby
require 'nokogiri'

i = "00" # i is skipped
c_xpath = 12.times.map do "//c#{i.succ!}" end.join('|')

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath(c_xpath).each do |c|
    if !c['level'] || c['level'] == 'unspecified' || (c['level'] == 'otherlevel' && c['otherlevel'] == 'unspecified')
      c['level'] = 'file'
      c.delete 'otherlevel'
      write_me = true
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
