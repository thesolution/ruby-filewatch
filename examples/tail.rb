require "rubygems"
require "filewatch/tail"
require "filewatch/buftok"

tail = FileWatch::Tail.new
ARGV.each do |path|
  tail.tail(path)
end

b = FileWatch::BufferedTokenizer.new
tail.subscribe do |path, data|
  b.extract(data).each do |line|
    p path => line
  end
end

