package com.foshan.dao;

import java.util.List;

import com.foshan.entity.LearningMaterials;

public interface LearningMaterialsDao {
	void addLearningMaterials(LearningMaterials learningMaterials);
	LearningMaterials findById(Integer id);
	List<LearningMaterials> findAllLearningMaterials(int start,int pageSize);
	void deleteByIds(Integer...ids);
	List<LearningMaterials> findLearningMaterialsByFileName(String fileName);
	void update(LearningMaterials learningMaterials);
	List<LearningMaterials> findLearningMaterials(String grade,String courseName,int start,int pageSize);
}
