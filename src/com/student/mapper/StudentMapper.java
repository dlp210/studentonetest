package com.student.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.el.parser.ParseException;
import org.springframework.jdbc.core.RowMapper;

import com.student.bean.Student;

public class StudentMapper implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO �����������ꂽ���\�b�h�E�X�^�u

		Student student = new Student();
		student.setId(rs.getInt("id"));
		student.setName(rs.getString("name"));
		student.setBirthday(getStringBirthday(rs.getString("birthday")));
		student.setAge(rs.getInt("age"));
		student.setScore(rs.getDouble("score"));
		student.setClassid(rs.getShort("classid"));
		student.setAddress(rs.getString("address"));
		student.setTeachername(rs.getString("teachername"));

		return student;
	}

	private String getStringBirthday(String birthday) {
		SimpleDateFormat fommter = new SimpleDateFormat("yyyy-mm-dd");
		Date date = new Date();
		String strBirthday = "";

		try {

			date = fommter.parse(birthday);
			strBirthday = new SimpleDateFormat("yyyy-mm-dd").format(date);

		} catch (java.text.ParseException e) {
			// TODO �����������ꂽ catch �u���b�N
			e.printStackTrace();
		}

		return strBirthday;

	}

}
