package com.indicrowd;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.collections.MapConverter;
import com.thoughtworks.xstream.io.ExtendedHierarchicalStreamWriterHelper;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.mapper.Mapper;

public class CustomMapConverter extends MapConverter {

	public CustomMapConverter(Mapper mapper) {
		super(mapper);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public boolean canConvert(Class type) {
		return type.equals(HashMap.class) || type.equals(Hashtable.class) || type.getName().equals("java.util.LinkedHashMap") || type.getName().equals("java.util.concurrent.ConcurrentHashMap") || type.getName().equals("sun.font.AttributeMap");
	}

	@Override
	@SuppressWarnings("unchecked")
	public void marshal(Object source, HierarchicalStreamWriter writer, MarshallingContext context) {
		Map<String, Object> map = (Map<String, Object>) source;
		for (Iterator<Entry<String, Object>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
			Entry<String, Object> entry = (Entry<String, Object>) iterator.next();

			ExtendedHierarchicalStreamWriterHelper.startNode(writer, mapper().serializedClass(Entry.class), entry.getClass());

			writeItem("@map", context, writer);
			writeItem(entry.getKey(), context, writer);
			writeItem(entry.getValue(), context, writer);

			writer.endNode();
		}
	}

}
