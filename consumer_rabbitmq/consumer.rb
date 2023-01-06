require 'bunny'
require 'time'

conn = Bunny.new hostname: 'rabbitmq'
conn.start

ch = conn.create_channel
ch.confirm_select

q  = ch.queue('example_test_queue')

q.subscribe(manual_ack: true) do |delivery_info, metadata, payload|
  diff = 1000 * (Time.now.to_f - Time.parse(payload).to_f)
  p "Difference in miliseconds: #{diff.to_i}"
  ch.ack(delivery_info.delivery_tag)
end

loop do
  sleep 10
  p "Still alive"
end

ch.close
conn.close