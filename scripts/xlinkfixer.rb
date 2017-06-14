#!/usr/bin/env ruby
require 'nokogiri'
attr_mapping = {
  "onrequest" => "onRequest",
  "onload" => "onLoad"
}
Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')
  xml.root['xmlns:xlink'] = 'http://www.w3.org/TR/xlink/'
  xml = Nokogiri.XML(xml.to_s)
  xml.xpath('//*[@actuate]').each do |el|
    val = el['actuate']
    if attr_mapping.keys.include? val
      el['actuate'] = attr_mapping[val]
    end

  end

  File.open("out/#{File.basename(fname)}", 'w') do |f|
    f.write xml.to_s
  end

end
