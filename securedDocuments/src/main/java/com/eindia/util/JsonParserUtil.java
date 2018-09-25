package com.eindia.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonParserUtil {

	private static final Gson GSON = new GsonBuilder().create();

	public static <T> T fromJson(String json, Class<T> clazz) {
		return GSON.fromJson(json, clazz);
	}

	public static <T> String toJson(Object object) {
		return GSON.toJson(object);
	}

}
