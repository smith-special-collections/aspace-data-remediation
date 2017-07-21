#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath('//unittitle').each do |ut|
    last_node = ut.at_xpath('(./node())[last()]')
    if last_node && last_node.is_a?(Nokogiri::XML::Text) && last_node.to_s[/\A,\s*\z/]
      last_node.remove
      write_me = true
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
