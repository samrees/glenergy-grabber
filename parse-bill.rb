#!/usr/bin/env ruby

require 'poppler'

document = Poppler::Document.new(ENV['GLE_BILL'])
data = document[0].get_text
kwh = data.scan(/(?<=Total Energy Use\nThis Month\n)(\d+)/)[0][0]
dollars = data.scan(/(?<=TOTAL\nAUTOPAY AMOUNT\n)([\d\.$]+)/)[0][0]
puts dollars + "," + kwh

exit 0
