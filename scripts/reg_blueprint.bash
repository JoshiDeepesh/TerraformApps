#!/bin/bash
#register ambari blueprint

if [ $# -eq 1 ]; then
echo "Nodes Not Supported"

elif [ $# -eq 2 ]; then

curl --silent -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/blueprints/multi-node --data '{"host_groups":[{"name" : "host_group_1","components" : [{"name" : "YARN_CLIENT"},{"name" : "HDFS_CLIENT"},{"name" : "METRICS_MONITOR"},{"name" : "NAMENODE"},{"name" : "ACTIVITY_ANALYZER"},{"name" : "ACTIVITY_EXPLORER"},{"name" : "APP_TIMELINE_SERVER"},{"name" : "HST_AGENT"},{"name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_SERVER"},{"name" : "AMBARI_SERVER"},{"name" : "OOZIE_CLIENT"},{"name" : "METRICS_COLLECTOR"},{"name" : "METRICS_GRAFANA"},{"name" : "RESOURCEMANAGER"}],"cardinality" : "1"},{"name" : "slave1","components" : [{"name" : "DATANODE"},{"name" : "HDFS_CLIENT"},{"name":"PIG"},{"name" : "NODEMANAGER"},{"name" : "YARN_CLIENT"},{ "name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_CLIENT"},{"name":"HIVE_CLIENT"},{"name":"SPARK_CLIENT"},{"name":"HIVE_METASTORE"},{"name":"HIVE_SERVER"},{"name":"MYSQL_SERVER"},{"name" : "TEZ_CLIENT"},{"name":"WEBHCAT_SERVER"},{"name" : "SQOOP"},{"name" : "HST_AGENT"},{"name" : "SLIDER"},{"name" : "HST_SERVER"},{"name":"HCAT"},{"name" : "SPARK2_CLIENT"},{"name" : "SPARK2_JOBHISTORYSERVER"},{"name" : "SPARK_JOBHISTORYSERVER"}],"cardinality" : "1"}],"Blueprints" : {"blueprint_name" : "multi-node","stack_name" : "HDP","stack_version" :"2.6"},"configurations":[{"hive-site":{"properties":{"javax.jdo.option.ConnectionPassword":"hive"}}},{"activity-zeppelin-shiro":{"properties":{"users.admin":"admin"}}},{"oozie-site":{"properties":{"oozie.service.JPAService.jdbc.password":"oozie"}}},{"ams-grafana-env":{"properties":{"metrics_grafana_password":"grafana"}}}]}'

curl --silent -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/clusters/multi-node --data '{"blueprint":"multi-node","host_groups":[{"name":"host_group_1","hosts":[{"fqdn":"'$1'"}]},{"name":"slave1","hosts":[{"fqdn":"'$2'"}]}]}'


elif [ $# -eq 3 ]; then

curl --silent -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/blueprints/multi-node --data '{"host_groups":[{"name" : "host_group_1","components" : [{"name" : "YARN_CLIENT"},{"name" : "HDFS_CLIENT"},{"name" : "METRICS_MONITOR"},{"name" : "NAMENODE"},{"name" : "ACTIVITY_ANALYZER"},{"name" : "ACTIVITY_EXPLORER"},{"name" : "HST_AGENT"},{"name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_SERVER"},{"name" : "AMBARI_SERVER"},{"name" : "OOZIE_CLIENT"},{"name" : "METRICS_COLLECTOR"},{"name" : "METRICS_GRAFANA"}],"cardinality" : "1"},{"name" : "slave1","components" : [{"name" : "DATANODE"},{"name" : "HDFS_CLIENT"},{"name":"PIG"},{"name" : "NODEMANAGER"},{"name" : "YARN_CLIENT"},{ "name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_CLIENT"},{"name":"HIVE_CLIENT"},{"name" : "SPARK_CLIENT"},{"name":"HIVE_METASTORE"},{"name":"HIVE_SERVER"},{"name":"MYSQL_SERVER"},{"name" : "TEZ_CLIENT"},{"name":"WEBHCAT_SERVER"},{"name" : "SQOOP"},{"name" : "HST_AGENT"},{"name" : "SLIDER"},{"name" : "HST_SERVER"},{"name" : "SPARK2_CLIENT"},{"name" : "SPARK2_JOBHISTORYSERVER"},{"name" : "SPARK_JOBHISTORYSERVER"}],"cardinality" : "1"},{"name" : "slave2","components" : [{"name" : "SECONDARY_NAMENODE"},{"name" : "HDFS_CLIENT"},{"name":"PIG"},{"name" : "NODEMANAGER"},{"name" : "YARN_CLIENT"},{ "name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_CLIENT"},{"name" : "SPARK_CLIENT"},{"name" : "OOZIE_SERVER"},{"name" : "APP_TIMELINE_SERVER"},{"name":"HCAT"},{"name" : "HISTORYSERVER"},{"name" : "SPARK2_CLIENT"},{"name" : "SPARK2_THRIFTSERVER"},{"name" : "HST_AGENT"},{"name" : "OOZIE_CLIENT"},{"name" : "DATANODE"},{"name" : "SPARK_THRIFTSERVER"},{"name" : "HIVE_CLIENT"},{"name" : "RESOURCEMANAGER"}],"cardinality" : "1"}],"Blueprints" : {"blueprint_name" : "multi-node","stack_name" : "HDP","stack_version" :"2.6"},"configurations":[{"hive-site":{"properties":{"javax.jdo.option.ConnectionPassword":"hive"}}},{"activity-zeppelin-shiro":{"properties":{"users.admin":"admin"}}},{"oozie-site":{"properties":{"oozie.service.JPAService.jdbc.password":"oozie"}}},{"ams-grafana-env":{"properties":{"metrics_grafana_password":"grafana"}}}]}'

#Add no. registered fqdn's

curl --silent -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/clusters/multi-node --data '{"blueprint":"multi-node","host_groups":[{"name":"host_group_1","hosts":[{"fqdn":"'$1'"}]},{"name":"slave1","hosts":[{"fqdn":"'$2'"}]},{"name":"slave2","hosts":[{"fqdn":"'$3'"}]}]}'

elif [ $# -eq 4 ]; then

curl --silent -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/blueprints/multi-node --data '{"host_groups":[{"name" : "host_group_1","components" : [{"name" : "YARN_CLIENT"},{"name" : "HDFS_CLIENT"},{"name" : "METRICS_MONITOR"},{"name" : "NAMENODE"},{"name" : "ACTIVITY_ANALYZER"},{"name" : "ACTIVITY_EXPLORER"},{"name" : "HST_AGENT"},{"name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_SERVER"},{"name" : "AMBARI_SERVER"},{"name" : "OOZIE_CLIENT"},{"name" : "METRICS_COLLECTOR"},{"name" : "METRICS_GRAFANA"}],"cardinality" : "1"},{"name" : "slave1","components" : [{"name" : "DATANODE"},{"name" : "HDFS_CLIENT"},{"name":"PIG"},{"name" : "NODEMANAGER"},{"name" : "YARN_CLIENT"},{ "name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_CLIENT"},{"name":"HIVE_CLIENT"},{"name" : "SPARK_CLIENT"},{"name":"HIVE_METASTORE"},{"name":"HIVE_SERVER"},{"name":"MYSQL_SERVER"},{"name" : "TEZ_CLIENT"},{"name":"WEBHCAT_SERVER"},{"name" : "SQOOP"},{"name" : "HST_AGENT"},{"name" : "SLIDER"},{"name" : "HST_SERVER"},{"name" : "SPARK2_CLIENT"},{"name" : "SPARK2_JOBHISTORYSERVER"},{"name" : "SPARK_JOBHISTORYSERVER"}],"cardinality" : "1"},{"name" : "slave2","components" : [{"name" : "SECONDARY_NAMENODE"},{"name" : "HDFS_CLIENT"},{"name":"PIG"},{"name" : "NODEMANAGER"},{"name" : "YARN_CLIENT"},{ "name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_CLIENT"},{"name" : "SPARK_CLIENT"},{"name" : "OOZIE_SERVER"},{"name" : "APP_TIMELINE_SERVER"},{"name":"HCAT"},{"name" : "HISTORYSERVER"},{"name" : "SPARK2_CLIENT"},{"name" : "SPARK2_THRIFTSERVER"},{"name" : "HST_AGENT"},{"name" : "OOZIE_CLIENT"},{"name" : "DATANODE"},{"name" : "SPARK_THRIFTSERVER"},{"name" : "HIVE_CLIENT"},{"name" : "RESOURCEMANAGER"}],"cardinality" : "1"},{"name" : "slave3","components" : [{"name" : "HDFS_CLIENT"},{"name":"PIG"},{"name" : "NODEMANAGER"},{"name" : "YARN_CLIENT"},{ "name" : "MAPREDUCE2_CLIENT"},{"name" : "ZOOKEEPER_CLIENT"},{"name" : "SPARK_CLIENT"},{"name":"HCAT"},{"name" : "SPARK2_CLIENT"},{"name" : "SPARK2_THRIFTSERVER"},{"name" : "HST_AGENT"},{"name" : "OOZIE_CLIENT"},{"name" : "DATANODE"},{"name" : "SPARK_THRIFTSERVER"},{"name" : "HIVE_CLIENT"}],"cardinality" : "1"}],"Blueprints" : {"blueprint_name" : "multi-node","stack_name" : "HDP","stack_version" :"2.6"},"configurations":[{"hive-site":{"properties":{"javax.jdo.option.ConnectionPassword":"hive"}}},{"activity-zeppelin-shiro":{"properties":{"users.admin":"admin"}}},{"oozie-site":{"properties":{"oozie.service.JPAService.jdbc.password":"oozie"}}},{"ams-grafana-env":{"properties":{"metrics_grafana_password":"grafana"}}}]}'

#Add no. registered fqdn's

curl --silent -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/clusters/multi-node --data '{"blueprint":"multi-node","host_groups":[{"name":"host_group_1","hosts":[{"fqdn":"'$1'"}]},{"name":"slave1","hosts":[{"fqdn":"'$2'"}]},{"name":"slave2","hosts":[{"fqdn":"'$3'"}]},{"name":"slave3","hosts":[{"fqdn":"'$4'"}]}]}'

else
echo "NODES not supported"
fi

