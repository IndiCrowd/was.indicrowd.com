package com.indicrowd;

import java.io.Writer;

import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.json.JsonHierarchicalStreamDriver;
import com.thoughtworks.xstream.io.json.JsonWriter;

public class JsonDropRootHierarchicalStreamDriver extends JsonHierarchicalStreamDriver {

	@Override
	public HierarchicalStreamWriter createWriter(Writer writer) {
		return new JsonWriter(writer, JsonWriter.DROP_ROOT_MODE);
	}

}
