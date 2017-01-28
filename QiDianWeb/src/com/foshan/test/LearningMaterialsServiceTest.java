package com.foshan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.LearningMaterials;
import com.foshan.service.LearningMaterialsService;

public class LearningMaterialsServiceTest {
	private static ApplicationContext applicationContext;
	private static LearningMaterialsService learningMaterialsService;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		learningMaterialsService=applicationContext.getBean("learningMaterialsService",LearningMaterialsService.class);
	}
	public static void test_addObjectMethod(){
		System.out.println(learningMaterialsService);
		LearningMaterials learningMaterials=new LearningMaterials();
		learningMaterials.setAbsoulteFileName("/QiDianWeb/src/com/foshan/service/LearningMaterialsServiceImpl.java");
		learningMaterials.setCourseName("java");
		learningMaterials.setFileName("learningMaterials");
		learningMaterials.setPath("/QiDianWeb/src/com/foshan/service/");
		learningMaterialsService.addLearningMaterials(learningMaterials);
	}
	public static void test_findById(){
		LearningMaterials learningMaterials=learningMaterialsService.findById(2);
		System.out.println(learningMaterials.getUploadUser().getUserId());
		System.out.println(learningMaterials.getUploadUser().getUserName());
	}
	public static void test_findAll(){
//		List<LearningMaterials> learningMaterials=learningMaterialsService.findAllLearningMaterials(2,3);
//		for (LearningMaterials learningMaterials2 : learningMaterials) {
//			System.out.println(learningMaterials2.getId());
//		}
	}
	public static void test_findByFileName(){
		List<LearningMaterials> learningMaterials=learningMaterialsService.findLearningMaterialsByFileName("数学");
		
		for (LearningMaterials learningMaterials2 : learningMaterials) {
			System.out.println(learningMaterials2.getlId());
			System.out.println(learningMaterials2.getFileName());
		}
	}
	public static void test_findAllLearningMaterials(){
//		List<LearningMaterials> learningMaterials=learningMaterialsService.findAllLearningMaterials();
//		for (LearningMaterials learningMaterials2 : learningMaterials) {
//			System.out.println(learningMaterials2.getFileName());
//			System.out.println(learningMaterials2.getUploadUser().getId());
//			System.out.println(learningMaterials2.getUploadUser().getUserName());
//		
//		}
	}
	public static void test_findByGradeAndCourseName(){
		List<LearningMaterials> learningMaterials=learningMaterialsService.findAllLearningMaterials(1, 10, "初三", "数学");
		for (LearningMaterials learningMaterials2 : learningMaterials) {
			System.out.println(learningMaterials2.getFileName());
		}
	}
	public static void main(String[] args) {
		//test_findAllLearningMaterials();
		test_findByFileName();
		//test_findByGradeAndCourseName();
	}
}
