require 'kafka'
require 'time'
require 'date'

kafka = Kafka.new(["kafka:9092"], client_id: 'example-aplication')

consumer = kafka.consumer(group_id: 'example-group-id')

consumer.subscribe('example_test_topic')

trap("TERM") { consumer.stop }

consumer.each_message do |message|
  diff = 1000 * (Time.now.to_f - Time.parse(message.value).to_f)
  p "Difference in miliseconds: #{diff.to_i}"
end