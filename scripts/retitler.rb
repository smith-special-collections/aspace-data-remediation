#!/usr/bin/env ruby
require 'nokogiri'
require 'csv'

ead_title_map = CSV.open('scripts/ssc_resource_titles.csv')
                .reject {|row| row.first.nil? }
                .map {|row| row.take(2)}
                .to_h

Dir['eads/*.xml'].each do |fname|
  eadid = File.basename(fname)[/^.*(?=\.xml)/]
  if ead_title_map.key? eadid
    xml = Nokogiri.XML(IO.read(fname), nil, 'utf-8')

    xml.at_xpath('/ead/archdesc/did/unittitle').content = ead_title_map[eadid]

    File.open("out/#{File.basename(fname)}", 'w') do |f|
      f.write xml.to_s
    end
  end
end
