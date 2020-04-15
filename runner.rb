require 'listen'
pid = fork { exec("rails s -p3000") }
listener = Listen.to('app/', only: /\.rb$/) do |modified, added, removed|
  puts "Restarting........"
  Process.kill("HUP", pid)
  pid = fork { exec("rails s -p3000") }
end
listener.start # not blocking
sleep