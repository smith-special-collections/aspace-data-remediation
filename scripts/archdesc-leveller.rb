#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/mnsss292*.xml'].reject { |fname| File.basename(fname) == 'mnsss292.xml' }.each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  xml.at_xpath('//archdesc')['level'] = 'recordgrp'

  File.open("out/#{File.basename(fname)}", 'w') do |f|
    f.write xml.to_s
  end
end
