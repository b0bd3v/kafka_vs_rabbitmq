require 'kafka'
require 'time'

kafka = Kafka.new(['kafka:9092'], client_id: 'example-aplication')

(1..).each do |i|
  kafka.deliver_message("#{Time.now}", topic: 'example_test_topic')
  p "Message #{Time.now.utc.strftime("%M:%S")}"
  sleep 3
end

# producer = kafka.producer
# producer.produce("Message 1", topic: 'example_test_topic')
# producer.deliver_messages

puts "Done"
