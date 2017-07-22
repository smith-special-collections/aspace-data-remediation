#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath('//ref[./*]').each do |ref|
    ref.xpath('./*').each do |subel|
      subel.replace(Nokogiri::XML::Text.new(subel.content, xml))
    end
    write_me = true
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
