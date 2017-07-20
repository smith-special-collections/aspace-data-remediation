#!/usr/bin/env ruby
require 'nokogiri'
Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  heads = '/ead/archdesc/bioghist/head|' <<
          '/ead/archdesc/scopecontent/head|' <<
          '/ead/archdesc/arrangement/head'
  if xml.xpath(heads).length > 0
    xml.xpath(heads).remove
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
