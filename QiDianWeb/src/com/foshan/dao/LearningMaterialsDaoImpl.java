package com.foshan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.LearningMaterials;
import com.foshan.mapper.LearningMaterialsMapper;
@Repository(value="learningMaterialsDao")
public class LearningMaterialsDaoImpl extends BaseDaoSupport<LearningMaterials> implements LearningMaterialsDao{
	@Resource(name="learningMaterialsMapper")
	private LearningMaterialsMapper learningMaterialsMapper;
	@Override
	public void addLearningMaterials(LearningMaterials learningMaterials) {
		// TODO Auto-generated method stub
		learningMaterialsMapper.addLearningMaterials(learningMaterials);
	}

	@Override
	public LearningMaterials findById(Integer id) {
		// TODO Auto-generated method stub
		return learningMaterialsMapper.findById(id);
	}

	@Override
	public List<LearningMaterials> findAllLearningMaterials(int start,int pageSize) {
		// TODO Auto-generated method stub
		return learningMaterialsMapper.findAllLearningMaterials(start,pageSize);
	}

	@Override
	public void deleteByIds(Integer... ids) {
		// TODO Auto-generated method stub
		learningMaterialsMapper.deleteByIds(ids);
	}

	@Override
	public List<LearningMaterials> findLearningMaterialsByFileName(
			String fileName) {
		// TODO Auto-generated method stub
		return learningMaterialsMapper.findLearningMaterialsByFileName(fileName);
	}

	@Override
	public void update(LearningMaterials learningMaterials) {
		// TODO Auto-generated method stub
		learningMaterialsMapper.update(learningMaterials);
	}

	@Override
	public List<LearningMaterials> findLearningMaterials(String grade,
			String courseName,int start,int pageSize) {
		// TODO Auto-generated method stub
		return learningMaterialsMapper.findLearningMaterials(grade,courseName,start,pageSize);
	}

}
