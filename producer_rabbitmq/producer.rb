require 'bunny'
require 'time'

conn = Bunny.new hostname: 'rabbitmq'
conn.start

channel = conn.create_channel
channel.confirm_select

queue = channel.queue('example_test_queue')

loop do
  queue.publish(Time.now.to_s)
  p "Message sent #{Time.now.utc.strftime("%M:%S")}"
  sleep 3
end

channel.wait_for_confirms

puts "Done"

channel.close
conn.close