package com.student.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.student.bean.Student;
import com.student.mapper.StudentMapper;

public class StudentDao {

	private JdbcTemplate jbdcTemplate;

	public void setJdbcTemplate(JdbcTemplate jbdcTemplate) {
		this.jbdcTemplate = jbdcTemplate;

	}

	public List<Student> getAllStudent() {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = new ArrayList<>();
		studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;

	}
//�T��
	public List<Student> queryById(int stuId) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone WHERE id = "+ stuId +"";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;

	}

	public List<Student> queryByName(String name) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone WHERE name='"+ name +"'";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}

	public List<Student> queryByBrithday(String birthday) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}

	public List<Student> queryByAge(int age) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}

	public List<Student> queryByScore(Double score) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}

	public List<Student> queryByClassid(int classid) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}

	public List<Student> queryByAddress(String address) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}

	public List<Student> queryByTeachername(String teachername) {
		String sql = "SELECT id,name,birthday,age,score,classid,address,teachername FROM studentone";
		List<Student> studentList = jbdcTemplate.query(sql, new StudentMapper());
		return studentList;
	}
//削除
	public void deleteStudentById(int stuId) {
		String sql = "DELETE from studentone WHERE id=?";
		jbdcTemplate.update(sql, stuId);

	}
//新規
	public void addStudent(Student student) {
		String sql = "INSERT INTO studentone(id,name,birthday,age,score,classid) VALUE(0,?,?,?,?,?)";
		jbdcTemplate.update(sql,student.getName(),student.getBirthday(),student.getAge(),student.getScore(),student.getClassid());
	}
	//更新
	public void upDateStudent(Student student) {
	   String sql = "UPDATE studentone SET name=?,birthday=?,age=?,score=?,classid=?,address=?,teachername=? WHERE id=?";
	   jbdcTemplate.update(sql,student.getName(),student.getBirthday(),student.getAge(),student.getScore(),student.getClassid(),
			   student.getAddress(),student.getTeachername(),student.getId());

	}
//郵便番号で住所追加
	public void addStudentAddress(int stuId,String address) {
         String sql = "UPDATE studentone SET address=? WHERE id=?";
         jbdcTemplate.update(sql, address, stuId);

	}




}
