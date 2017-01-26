package com.foshan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.foshan.entity.LearningMaterials;

public interface LearningMaterialsMapper {
	void addLearningMaterials(LearningMaterials learningMaterials);
	LearningMaterials findById(int id);
	List<LearningMaterials> findAllLearningMaterials(@Param("start")int start,@Param("pageSize")int pageSize);
	void deleteByIds(int...ids);
	List<LearningMaterials> findLearningMaterialsByFileName(String fileName);
	void update(LearningMaterials learningMaterials);
	List<LearningMaterials> findLearningMaterials(@Param("grade")String grade,@Param("courseName")String courseName,@Param("start")int start,@Param("pageSize")int pageSize);
}
