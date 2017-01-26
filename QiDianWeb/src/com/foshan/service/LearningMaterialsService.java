package com.foshan.service;

import java.util.List;

import com.foshan.entity.LearningMaterials;
/**
 * 上传学习资料业务类
 * @author Administrator
 *
 */
public interface LearningMaterialsService {
	void addLearningMaterials(LearningMaterials learningMaterials);
	LearningMaterials findById(int id);
	List<LearningMaterials> findAllLearningMaterials(int page,int pageSize,String grade,String courseName);
	void deleteByIds(int...ids);
	List<LearningMaterials> findLearningMaterialsByFileName(String fileName);
	void update(LearningMaterials learningMaterials);
}
