package com.indicrowd;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.hibernate.converter.HibernatePersistentCollectionConverter;
import com.thoughtworks.xstream.hibernate.converter.HibernatePersistentMapConverter;
import com.thoughtworks.xstream.hibernate.converter.HibernatePersistentSortedMapConverter;
import com.thoughtworks.xstream.hibernate.converter.HibernatePersistentSortedSetConverter;
import com.thoughtworks.xstream.hibernate.converter.HibernateProxyConverter;
import com.thoughtworks.xstream.hibernate.mapper.HibernateMapper;
import com.thoughtworks.xstream.io.json.JsonHierarchicalStreamDriver;
import com.thoughtworks.xstream.mapper.MapperWrapper;

public class XStreamJsonSingleton {

	private static XStream xstream;
	private static XStream xstreamDropRoot;

	private XStreamJsonSingleton() {
		// not use.
	}

	public static XStream getInstance() {

		if (xstream == null) {
			xstream = new XStream(new JsonHierarchicalStreamDriver()) {

				protected MapperWrapper wrapMapper(final MapperWrapper next) {
					return new HibernateMapper(next);
				}

			};
			xstream.registerConverter(new HibernateProxyConverter());
			xstream.registerConverter(new HibernatePersistentCollectionConverter(xstream.getMapper()));
			xstream.registerConverter(new HibernatePersistentMapConverter(xstream.getMapper()));
			xstream.registerConverter(new HibernatePersistentSortedMapConverter(xstream.getMapper()));
			xstream.registerConverter(new HibernatePersistentSortedSetConverter(xstream.getMapper()));
			xstream.registerConverter(new CustomMapConverter(xstream.getMapper()));
			xstream.registerConverter(new CustomDateConvert());
		}

		return xstream;
	}

	public static XStream getDropRootInstance() {

		if (xstreamDropRoot == null) {
			xstreamDropRoot = new XStream(new JsonDropRootHierarchicalStreamDriver()) {

				protected MapperWrapper wrapMapper(final MapperWrapper next) {
					return new HibernateMapper(next);
				}

			};
			xstreamDropRoot.registerConverter(new HibernateProxyConverter());
			xstreamDropRoot.registerConverter(new HibernatePersistentCollectionConverter(xstreamDropRoot.getMapper()));
			xstreamDropRoot.registerConverter(new HibernatePersistentMapConverter(xstreamDropRoot.getMapper()));
			xstreamDropRoot.registerConverter(new HibernatePersistentSortedMapConverter(xstreamDropRoot.getMapper()));
			xstreamDropRoot.registerConverter(new HibernatePersistentSortedSetConverter(xstreamDropRoot.getMapper()));
			xstreamDropRoot.registerConverter(new CustomMapConverter(xstreamDropRoot.getMapper()));
			xstreamDropRoot.registerConverter(new CustomDateConvert());
		}

		return xstreamDropRoot;
	}

}
