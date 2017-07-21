#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  xml.xpath('//lb').each do |lb|
    lb.replace(Nokogiri::XML::Text.new(" ", xml))
  end

  File.open("out/#{File.basename(fname)}", 'w') do |f|
    f.write xml.to_s
  end
end
