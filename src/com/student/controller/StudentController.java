package com.student.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.student.bean.Student;
import com.student.service.StudentService;

@Controller
public class StudentController {

	private static StudentService getService() {
		StudentService service = new StudentService();
		return service;
	}

	private static StudentService service = getService();

	@RequestMapping(value = "/goToAllStudent")
	public String getAllStudent(Model model) {
		StudentService service = new StudentService();
		List<Student> studentList = service.getAllStudent();
		model.addAttribute("stuList", studentList);
		return "student";

	}

	@RequestMapping(value = "/goToSelectStudent")
	public String goToSelectPage(Model model) {
		StudentService service = new StudentService();
		List<Student> studentList = service.getAllStudent();
		model.addAttribute("stuList", studentList);
		return "select";

	}

	@RequestMapping(value = "/getStudentById")
	public String getStudentById(String id, Model model) {
		model.addAttribute("stuList", service.getStudentById(id));
		return "select";
	}

	@RequestMapping(value = "/getStudentByName")
	public String getStudentByName(String name, Model model) {
		model.addAttribute("stuList", service.getStudentByName(name));
		return "select";

	}

	// 削除
	@RequestMapping(value = "/goToDeleteStudent")
	public String goToDeletePage(Model model) {
		model.addAttribute("stuList", service.getAllStudent());
		return "delete";

	}

	@RequestMapping(value = "/goToDeleteStudentById")

	public String deleteStudentById(String id, Model model) {
		service.deleteStudentById(id);
		model.addAttribute("stuList", service.getAllStudent());
		return "delete";
	}

	// 新規
	@RequestMapping(value = "/goToAddPage")
	public String goToAddPage(Model model) {
		model.addAttribute("stuList", service.getAllStudent());
		return "addstudent";
	}

	@RequestMapping(value = "/goToAddStudent")
	public String addstudent(String name, String birthday, String age, String score, String classid, Model model) {
		service.addStudent(name, birthday, age, score, classid);
		model.addAttribute("stuList", service.getAllStudent());
		return "addstudent";

	}
	//更新
	@RequestMapping(value = "/goToUpdateStudent")
	public String goToUpdatePage(Model model) {
		model.addAttribute("stuList",service.getAllStudent());
		return "update";
	}

	@RequestMapping(value = "/getUpDateStudent")
	public String upDateStudent(String id,String name,String birthday,String age, String score,String classid,Model model) {

		service.getUpDateStudent(id, name, birthday, age, score, classid);
		model.addAttribute("stuList", service.getAllStudent());
		return "update";
	}

	//郵便番号で住所を追加
	@RequestMapping(value="/addStudentAddress")
	public String addStudentAddress(Model model,String addr11,String id) {

		service.goToAddStudentAddress(addr11, id);
		model.addAttribute("stuList", service.getAllStudent());
		return "update";

	}




















}
