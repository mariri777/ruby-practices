#!/usr/bin/env ruby

require 'optparse'
require 'date'

options = { year: Date.today.year, month: Date.today.month }
opt = OptionParser.new

opt.on('-y YEAR', Integer) do |year|
  if (1970..2100).cover?(year)
    options[:year] = year
  else
    puts "指定範囲外です"
  end
end

opt.on('-m MONTH', Integer) do |month|
  if (1..12).cover?(month)
    options[:month] = month
  else
    puts "指定範囲外です"
  end
end

opt.parse!(ARGV)

first_day = Date.new(options[:year], options[:month], 1)
last_day = Date.new(options[:year], options[:month], -1)

puts "      #{options[:month]}月 #{options[:year]}"
puts "日 月 火 水 木 金 土"

first_day.wday.times { print "   " }

(first_day..last_day).each do |date|
  print format("%2d ", date.day)
  if date.wday == 6
    puts ""
  end
end
