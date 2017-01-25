package com.foshan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.LearningMaterialsDao;
import com.foshan.entity.LearningMaterials;
@Service(value="learningMaterialsService")
@Transactional(value="dataSourceTransactionManager")
public class LearningMaterialsServiceImpl implements LearningMaterialsService{
	@Resource(name="learningMaterialsDao")
	private LearningMaterialsDao learningMaterialsDao;
	@Override
	public void addLearningMaterials(LearningMaterials learningMaterials) {
		// TODO Auto-generated method stub
		learningMaterialsDao.addLearningMaterials(learningMaterials);
	}

	@Override
	public LearningMaterials findById(int id) {
		// TODO Auto-generated method stub
		return learningMaterialsDao.findById(id);
		
	}

	@Override
	public List<LearningMaterials> findAllLearningMaterials(int page,int pageSize,String grade,String courseName,String searchFile) {
		// TODO Auto-generated method stub
		int start=(page-1)*pageSize;
		//int end=page*pageSize-1;
		return learningMaterialsDao.findAllLearningMaterials(start,pageSize);
	}

	@Override
	public void deleteByIds(int... ids) {
		// TODO Auto-generated method stub
		for (int id : ids) {
			learningMaterialsDao.deleteByIds(id);
		}
	}

	@Override
	public List<LearningMaterials> findLearningMaterialsByFileName(
			String fileName) {
		// TODO Auto-generated method stub
		return learningMaterialsDao.findLearningMaterialsByFileName(fileName);
	}

	@Override
	public void update(LearningMaterials learningMaterials) {
		// TODO Auto-generated method stub
		learningMaterialsDao.update(learningMaterials);
	}

}
