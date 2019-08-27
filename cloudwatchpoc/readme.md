
# start the agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:/home/vagrant/.aws/agentconfig.json -s

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m onPremise -a status


## reset the system time

If your vagrant host machine was wake up from sleep, the running vagrant VM's datetime might be out of sync.
This will cause the handshaking with cw failed. (security token time issue)

https://github.com/aws/aws-sdk-js/issues/527
sudo yum install -y ntp
sudo systemctl enable ntpd
sudo /usr/sbin/ntpdate pool.ntp.org


## Change the config

__host machine ./.aws/agentconfig.json is mounted as /root/.aws/agentconfig.json__

* Step 1, modify ./.aws/agentconfig.json (host machine)
* Step 2, in VM, run below command

```shell
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a stop
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:/root/.aws/agentconfig.json -s
```

## put log file

__host machine ./testLog is mounted as /vagrant/testLog__

drop the file, modify the config and then restart.


# CloudWatch Agent troubleshooting

tail -f  /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Agent-Configuration-File-Details.html
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/troubleshooting-CloudWatch-Agent.html


# pricing analysis


Section 1, Cloudwatch

* 0.3 per metrics per month ------ for example, cpu usage can be one metric, error log from application log can be one metric
* 3 per dashboard per month ---- based on metric, not mandatory
* 0.1 per alarm (5 min check) ---  per alarm definition
   0.3 per alarm (1 min check) --- more expensive for high density monitor
* logs
  0.67/GB per month for ingested log
    *  depending how many logs we want to be monitored by CloudWatch per month, thereâ€™s a configuration to set auto expire after defined time period
    * if logs are huge might think about automatically archive into S3.
  storage 0.033/GB per month  ----- long term log retention (?)

Section 2, SNS

And, for alarm part, currently making use of SNS topic,

To publish alarm to SNS*

* First 1 million Amazon SNS requests per month are free
* Subscribe the notification using email, first 1k email /month is free, after that $2 per month for 100,000


# Todo list

Integrate with SLACK
