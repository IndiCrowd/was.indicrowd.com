package com.indicrowd;

import java.sql.Timestamp;
import java.util.Date;

import com.thoughtworks.xstream.converters.basic.AbstractSingleValueConverter;

public class CustomDateConvert extends AbstractSingleValueConverter {

	@Override
	@SuppressWarnings("rawtypes")
	public boolean canConvert(Class type) {
		return type.equals(Date.class) || type.equals(java.sql.Date.class) || type.equals(Timestamp.class);
	}

	@Override
	public Object fromString(String str) {
		return null;
	}

	@Override
	public String toString(Object o) {
		if (o instanceof Date) {
			return Long.toString(((Date) o).getTime());
		} else if (o instanceof java.sql.Date) {
			return Long.toString(((java.sql.Date) o).getTime());
		} else if (o instanceof Timestamp) {
			return Long.toString(((Timestamp) o).getTime());
		}
		return o.toString();
    }

}