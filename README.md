# Kafka VS Rabbit MQ

How to run producer and consumer

## Rabbit MQ
```shell
docker-compose up producer_rabbitmq
```

```shell
docker-compose up consumer_rabbitmq
```

## Kafka
```shell
docker-compose up producer_kafka
```

```shell
docker-compose up consumer_kafka
```

## Managment

### Rabbit MQ 
You can access http://localhost:15672/

### Kafka
Start the container
```shell
docker-compose up kafka-manager
```
And you can access in http://localhost:9000/



