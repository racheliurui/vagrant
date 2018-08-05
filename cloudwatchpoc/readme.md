
mkdir .aws
# prepare file

curl -o AmazonCloudWatchAgent.zip https://s3.amazonaws.com/amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip
sudo yum -y install zip unzip
unzip AmazonCloudWatchAgent.zip
sudo yum -y install amazon-cloudwatch-agent.rpm

sudo systemctl enable amazon-cloudwatch-agent
sudo systemctl list-unit-files --type service

sudo journalctl -u amazon-cloudwatch-agent.service -b
# start the agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:/home/vagrant/.aws/agentconfig.json -s

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m onPremise -a status

Debug reference
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/troubleshooting-CloudWatch-Agent.html


```
[vagrant@localhost ~]$ tail /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log
}]]
2018-08-05T11:35:16Z D! cloudwatch: Get Full dimensionList [[{
  Name: "host",
  Value: "localhost.localdomain"
}]]
2018-08-05T11:35:16Z D! cloudwatch: Get Full dimensionList [[{
  Name: "host",
  Value: "localhost.localdomain"
}]]
2018-08-05T11:35:16Z D! Output [cloudwatch] wrote batch of 5 metrics in 175.516µs
```

https://github.com/aws/aws-sdk-js/issues/527

sudo systemctl enable ntpd
sudo /usr/sbin/ntpdate pool.ntp.org
