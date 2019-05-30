package com.student.service;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.student.bean.Student;
import com.student.dao.StudentDao;

public class StudentService {

	private static StudentDao getDao() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		StudentDao dao = (StudentDao) context.getBean("StuDao");
		return dao;

	}

	private static StudentDao dao = getDao();

	public List<Student> getAllStudent() {
		StudentDao dao = getDao();
		List<Student> studentList = dao.getAllStudent();
		return studentList;

	}
	// ID探す

	public List<Student> getStudentById(String id) {
		id = id.trim();
		int stuId = Integer.valueOf(id);
		StudentDao dao = getDao();
		return dao.queryById(stuId);

	}

	// 名前探す
	public List<Student> getStudentByName(String name) {

		name = name.trim();

		return dao.queryByName(name);

	}

	// 成績 转换 valueOf
	// public List<Student> getStudentByScore(String score){
	// score = score.trim();
	// return dao.queryByScore(Double.valueOf(score));

	// }

	// IDで情報を削除
	public void deleteStudentById(String id) {
		int stuId = Integer.valueOf(id.trim());
		dao.deleteStudentById(stuId);
	}

	// 学生情報を新規する
	public void addStudent(String name, String birthday, String age, String score, String classid) {
		Student student = new Student();
		student.setName(name.trim());
		student.setBirthday(birthday.trim());
		student.setAge(Integer.valueOf(age.trim()));
		student.setScore(Double.valueOf(score.trim()));
		student.setClassid(Integer.valueOf(classid.trim()));

		dao.addStudent(student);

	}

	// 更新
	public void getUpDateStudent(String id, String name, String birthday, String age, String score, String classid) {
		Student student = new Student();
		student.setId(Integer.valueOf(id.trim()));
		student.setName(name.trim());
		student.setBirthday(birthday.trim());
		student.setAge(Integer.valueOf(age.trim()));
		student.setScore(Double.valueOf(score.trim()));
		student.setClassid(Integer.valueOf(classid.trim()));

		dao.upDateStudent(student);

	}

	//郵便番号で住所を追加
	public void goToAddStudentAddress(String addr11,String id) {
		int stuId = Integer.valueOf(id.trim());
		String address = addr11.trim();
		dao.addStudentAddress(stuId, address);
	}

}
