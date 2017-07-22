#!/usr/bin/env ruby
require 'nokogiri'

i = "00"
c_xpath = 12.times.map do "//c#{i.succ!}" end.join("|")

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath(c_xpath).each do |c|
    c.xpath('./did/note//ref').each do |ref|
      ref.replace Nokogiri::XML::Text.new(ref.content, xml)
      write_me = true
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end

end
