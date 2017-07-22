#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  indices = xml.xpath('//archdesc//index')
  if indices.length > 0
    File.open("indices/#{File.basename(fname)[/.*(?=\.xml)/]}.indices", 'w') do |f|
      f.write indices.to_s
    end

    indices.remove

    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
