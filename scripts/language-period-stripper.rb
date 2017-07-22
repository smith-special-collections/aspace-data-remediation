#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath('//langmaterial/language').each do |lang|

    if lang.content.strip[/\A[A-Z][a-z]+\.\z/]
      lang.content = lang.content.strip[0..-2]
      write_me
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end

end
