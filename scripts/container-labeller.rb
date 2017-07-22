#!/usr/bin/env ruby
require 'nokogiri'

i = "01" # i is skipped
c_xpath = 11.times.map do "//c#{i.succ!}" end.join('|')

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath(c_xpath).each do |c|
    c.xpath('./did/container').each do |container|
      if !container['label'] || container['label'] == 'unspecified'
        container['label'] = 'mixed materials'
        write_me = true
      end
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
