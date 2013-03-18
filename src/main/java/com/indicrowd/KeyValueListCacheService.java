package com.indicrowd;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.thoughtworks.xstream.XStream;

/**
 * key-value 혹은 key-list 캐시 여기서는 Redis를 사용 (Jedis)
 * 
 * 데이터 형태는 json을 사용합니다. (xstream)
 * 
 * @author 심영재
 */
@Service
public class KeyValueListCacheService {

	private Jedis jedis;
	
	private String redisHost;
	private String redisAuth;
	
	private void initJedis() {
		jedis = new Jedis(redisHost);
		jedis.auth(redisAuth);
		//jedis.flushDB();
	}
	
	@Value("#{storeConfig.redisHost}")
	public void setRedisHost(String redisHost) {
		this.redisHost = redisHost;
		if (this.redisHost != null && this.redisAuth != null) {
			initJedis();
		}
	}
	
	@Value("#{storeConfig.redisAuth}")
	public void setRedisAuth(String redisAuth) {
		this.redisAuth = redisAuth;
		if (this.redisHost != null && this.redisAuth != null) {
			initJedis();
		}
	}

	// private final static int COMMON_EXPIRE_SECOND = 60; // 테스트용 1분
	private final static int COMMON_EXPIRE_SECOND = 7 * 24 * 60 * 60; // 1주일 정도 캐시에 저장해둔다.

	// private final static long MAX_LIST_SIZE = 100; // 테스트용 100개
	private final static long MAX_LIST_SIZE = 3000; // 한 목록에 최대로 저장할 수 있는 갯수

	private XStream xstreamDropRoot = XStreamJsonSingleton.getDropRootInstance();

	public void set(String key, Object object) {

		// 깔끔하게 캐시에 저장!!
		// System.out.println(xstream.toXML(object));
		// 저장하는 순간 expire 시간 재생성
		jedis.setex(key, COMMON_EXPIRE_SECOND, xstreamDropRoot.toXML(object));

	}

	public Set<String> getSetByKey(String key) {
		return jedis.smembers(key);
	}

	public void addSetElement(String key, String targetKey) {
		//System.out.println("sadd:" + key + "," + targetKey);
		jedis.sadd(key, targetKey);
		jedis.expire(key, COMMON_EXPIRE_SECOND);
	}

	public void removeSetElement(String key, String targetKey) {
		//System.out.println("srem:" + key + "," + targetKey);
		jedis.srem(key, targetKey);
		jedis.expire(key, COMMON_EXPIRE_SECOND);
	}

	public void removeOrderedSetElement(String key, String targetKey) {
		//System.out.println("zrem:" + key + "," + targetKey);
		jedis.zrem(key, targetKey);
		jedis.expire(key, COMMON_EXPIRE_SECOND);
	}

	public void addIndex(String key, Long score, String targetKey) {
		// 읽어오는 순간 expire 시간 재생성
		jedis.expire(key, COMMON_EXPIRE_SECOND);
		jedis.zadd(key, score, targetKey);
		long count = jedis.zcard(key);
		if (count > MAX_LIST_SIZE) { // 갯수가 최대값보다 크면
			// 마지막 값을 삭제
			jedis.zremrangeByRank(targetKey, 0, 0);
		}
	}

	public void removeIndex(String key, String targetKey) {
		jedis.zrem(key, targetKey);
	}

	public Set<String> getIndexes(String key) {

		// 읽어오는 순간 expire 시간 재생성
		jedis.expire(key, COMMON_EXPIRE_SECOND);

		// class java.util.LinkedHashSet 이기 때문에 순서대로 가져온다.
		return jedis.zrange(key, 0, -1);
	}

	// JSON 반환
	public List<String> list(String key, Long beforeScore, int count, Map<String, Integer> emptyValueIndexMap) {

		// 읽어오는 순간 expire 시간 재생성
		jedis.expire(key, COMMON_EXPIRE_SECOND);

		// class java.util.LinkedHashSet 이기 때문에 순서대로 가져온다.
		Set<String> keySet = jedis.zrangeByScore(key, "(" + Long.toString(beforeScore), "+inf", 0, count);

		if (keySet.size() > 0) {
			String[] keySets = keySet.toArray(new String[] {});
			List<String> jsonList = jedis.mget(keySets);

			// 순서 반대로.
			Collections.reverse(jsonList);
			return jsonList;
		}
		return new ArrayList<>();
	}
	
	// JSON 반환
	public List<String> listDesc(String key, Long beforeScore, int count, Map<String, Integer> emptyValueIndexMap) {

		// 읽어오는 순간 expire 시간 재생성
		jedis.expire(key, COMMON_EXPIRE_SECOND);

		// class java.util.LinkedHashSet 이기 때문에 순서대로 가져온다.
		Set<String> keySet = jedis.zrevrangeByScore(key, "+inf", "(" + Long.toString(beforeScore), 0, count);

		return getCachedList(keySet, emptyValueIndexMap);
	}

	// JSON 반환
	public List<String> getCachedList(Set<String> keySet, Map<String, Integer> emptyValueIndexMap) {
		if (keySet.size() > 0) {
			String[] keySets = keySet.toArray(new String[] {});
			List<String> jsonList = jedis.mget(keySets);

			// 순서 반대로.
			Collections.reverse(jsonList);
			return jsonList;
		}
		return new ArrayList<>();
	}

	// JSON 반환
	public String get(String key) {
		if (key == null) {
			return null;
		}
		// 읽어오는 순간 expire 시간 재생성
		jedis.expire(key, COMMON_EXPIRE_SECOND);
		return jedis.get(key);
	}

	public void delete(String key) {
		jedis.del(key);
	}

}
