#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  daos = xml.xpath('//bioghist//dao')
  if daos.length > 0
    File.open("daos/#{File.basename(fname)[/.*(?=\.xml)/]}.daos", 'w') do |f|
      f.write daos.to_s
    end

    daos.remove

    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
