#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  xml.at_xpath('/ead/eadheader/profiledesc/langusage').content = 'Finding aid written in English.'

  File.open("out/#{File.basename(fname)}", 'w') do |f|
    f.write xml.to_s
  end
end
