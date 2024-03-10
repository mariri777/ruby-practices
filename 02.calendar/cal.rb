#!/usr/bin/env ruby

require 'optparse'
require 'date'
options = { year: Date.today.year, month: Date.today.month }
opt = OptionParser.new

opt.on('-y YEAR', Integer) do |year|
  if (1970..2100).cover?(year)
    options[:year] = year
  else
    warn '年の指定が範囲外です'
    exit 1
  end
end

opt.on('-m MONTH', Integer) do |month|
  if (1..12).cover?(month)
    options[:month] = month
  else
    warn '月の指定が範囲外です'
    exit 1
  end
end

opt.parse!(ARGV)

first_day = Date.new(options[:year], options[:month], 1)
last_day = Date.new(options[:year], options[:month], -1)

puts "      #{options[:month]}月 #{options[:year]}"
puts '日 月 火 水 木 金 土'

first_day.wday.times { print '   ' }

(first_day..last_day).each do |date|
  print date.day.to_s.rjust(2, ' ').ljust(3)
  puts if date.saturday?
end

puts
