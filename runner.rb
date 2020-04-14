require 'listen'
pid = fork { exec("rails s -p3000") }
listener = Listen.to('app/concepts/', only: /\.rb$/) do |modified, added, removed|
  puts "modified absolute path: #{modified}"
  puts "added absolute path: #{added}"
  puts "removed absolute path: #{removed}"
  Process.kill("HUP", pid)
  pid = fork { exec("rails s -p3000") }
end
listener.start # not blocking
sleep