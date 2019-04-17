package com.test.dao;

import com.test.model.Student;
/**
 * DAO½Ó¿Ú
 * @author lenov
 *
 */
public interface UserDAO {
	void save(Student student);
	void delete(String name);
	void update(String id, String field, String value);
}
