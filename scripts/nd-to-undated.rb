#!/usr/bin/env ruby
require 'nokogiri'

Dir['eads/*.xml'].each do |fname|
  xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

  write_me = false
  xml.xpath("//unitdate").each do |ud|
    if ud.content[/(?<=\W|\b)n\.?d\.?(?=\W|\b)/i]
      ud.content = ud.content.gsub(/(?<=\A|\W)n\.?d\.?(?=\z|\W)/i, 'undated')
      write_me = true
    end
    if ud.content[/other undated/i]
      write_me = true
      ud.content = ud.content.gsub(/other undated/i, 'undated')
    end
  end

  if write_me
    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
