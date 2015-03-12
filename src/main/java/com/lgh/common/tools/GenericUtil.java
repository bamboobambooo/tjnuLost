package com.lgh.common.tools;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class GenericUtil {
	@SuppressWarnings("unchecked")
	public static Class<? extends Object> getSuperGenericClass(
			Class<? extends Object> clazz) {
		Type genericSuperclass = clazz.getGenericSuperclass();
		Type[] params = ((ParameterizedType) genericSuperclass)
				.getActualTypeArguments();
		return (Class<? extends Object>) params[0];
	}
	
	/*解决BaseDao中 GenericUtil.getSuperGenericClass(this.getClass()) 报错*/

	/**
	 * 通过反射,获得定义Class时声明的父类的范型参数的类型. 如public BookManager extends
	 * GenricManager<Book>
	 * 
	 * @param clazz
	 *            The class to introspect
	 * @return the first generic declaration, or <code>Object.class</code> if
	 *         cannot be determined
	 */
	public static Class<? extends Object> getSuperClassGenricType(Class<? extends Object> clazz) {
		return getSuperClassGenricType(clazz, 0);
	}

	/**
	 * 通过反射,获得定义Class时声明的父类的范型参数的类型. 如public BookManager extends
	 * GenricManager<Book>
	 * 
	 * @param clazz
	 *            clazz The class to introspect
	 * @param index
	 *            the Index of the generic ddeclaration,start from 0.
	 */
	@SuppressWarnings("unchecked")
	public static Class<? extends Object> getSuperClassGenricType(Class<? extends Object> clazz, int index)
			throws IndexOutOfBoundsException {

		Type genType = clazz.getGenericSuperclass();

		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}

		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

		if (index >= params.length || index < 0) {
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class<? extends Object>) params[index];
	}

}
