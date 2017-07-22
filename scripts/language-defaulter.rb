#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath('//langmaterial').each do |lm|
    if !lm.at_xpath('./language') && lm.content[/\AEnglish\.?\z/]
      lm.content = ''
      lm.add_child(Nokogiri::XML::DocumentFragment.new(xml, %q|<language langcode="eng">English</language>|))
      write_me = true
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end

end
