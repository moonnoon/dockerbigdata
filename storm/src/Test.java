/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package storm.starter;

import backtype.storm.Config;
import backtype.storm.LocalCluster;
import backtype.storm.StormSubmitter;
import backtype.storm.task.OutputCollector;
import backtype.storm.task.TopologyContext;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.topology.TopologyBuilder;
import backtype.storm.topology.base.BaseRichBolt;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Tuple;
import backtype.storm.tuple.Values;
import backtype.storm.utils.Utils;
import backtype.storm.spout.*;

import storm.kafka.*;


import java.util.Map;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.TreeMap;
import java.util.Comparator;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.net.InetAddress;

/**
 * This is a basic example of a Storm topology.
 */
public class Test {

	public static class MyBolt extends BaseRichBolt {
		OutputCollector _collector;
		static TopIP ip = new TopIP();

		@Override
		public void prepare(Map conf, TopologyContext context, OutputCollector collector) {
			_collector = collector;
		}

		@Override
		public void execute(Tuple tuple) {
			//_collector.emit(tuple, new Values(
			//			"================ " + tuple.getValues() + " ============="));
			//_collector.ack(tuple);
			ip.putIP(ip.getIPFromString(tuple.getString(0)));
			if (tuple.getString(0).compareTo("q") == 0) {
				ip.noMore();
			}
		}

		@Override
		public void declareOutputFields(OutputFieldsDeclarer declarer) {
			declarer.declare(new Fields("message"));
		}


	}

	public static class TopIP {
		private Map<String, Integer> map;
		private boolean more;

		public TopIP() {
			map = new HashMap<String, Integer>();
			more = true;
		}
		public void putIP(String ip) {
			if (map.containsKey(ip)) {
				map.put(ip, map.get(ip) + 1);
			} else {
				if (ip != null) 
					map.put(ip, 1);
			}
		}
		public String getIPFromString(String str) {
			String regex = "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}";
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(str);
			if(m.find()) {
				return m.group();
			}
			return null;
		}
		public Map<String, Integer> getTopIP() {
			TreeMap<String, Integer> tmap = new TreeMap<String, Integer>(new ValueComparator(map));
			tmap.putAll(map);
			return tmap;
		}
		public void noMore() {
			more = false;
		}
		public boolean isMore() {
			return more;
		}

		class ValueComparator implements Comparator<String> {
			Map<String, Integer> base;
			public ValueComparator(Map<String, Integer> base) {
				this.base = base;
			}
			public int compare(String a, String b) {
				if (base.get(a) >= base.get(b)) {
					return -1;
				} else {
					return 1;
				}
			}
		}
	}

	public static void main(String[] args) throws Exception {
		TopologyBuilder builder = new TopologyBuilder();

		BrokerHosts hosts = new ZkHosts(InetAddress.getByName("zookeeper").getHostAddress() 
				+ ":2181");
		SpoutConfig spoutConfig = new SpoutConfig(
				hosts,
				"test",
				"/kafkastorm",
				"discovery");
		//spoutConfig.scheme = new RawMultiScheme();
		spoutConfig.scheme = new SchemeAsMultiScheme(new StringScheme());

		builder.setSpout("kafka", new KafkaSpout(spoutConfig));
		builder.setBolt("bolt", new MyBolt()).shuffleGrouping("kafka");

		Config conf = new Config();
		conf.setDebug(true);

		LocalCluster cluster = new LocalCluster();
		cluster.submitTopology("test", conf, builder.createTopology());

		while(MyBolt.ip.isMore()) {
			Utils.sleep(4000);
		}
		cluster.killTopology("test");
		cluster.shutdown();
		for(Entry<String, Integer> entry: MyBolt.ip.getTopIP().entrySet()) {
			System.out.println(entry.getKey() + "\t:"+entry.getValue());
		}
	}
}
