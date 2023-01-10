require 'kafka'
require 'time'
require 'faker'

kafka = Kafka.new(['kafka:9092'], client_id: 'example-aplication')

(1..).each do |i|
  kafka.deliver_message({ time: Time.now,
                          author: Faker::Name.name,
                          message: Faker::Lorem.sentence,
                          kind: 'post'
                        }.to_json, topic: 'example_test_topic')

  p "Message #{Time.now.utc.strftime("%M:%S")}"

  sleep 3
end

# producer = kafka.producer
# producer.produce("Message 1", topic: 'example_test_topic')
# producer.deliver_messages

puts "Done"
