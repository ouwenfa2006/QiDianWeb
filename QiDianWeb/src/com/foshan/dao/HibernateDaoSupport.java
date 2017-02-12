package com.foshan.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

/*import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;*/
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
/*@Repository("baseDaoSupport")*/
public class HibernateDaoSupport{
	/*private static final long serialVersionUID = 1L;
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	@Override
	public void addObject(Class entityName, Object t) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(entityName.getName(), t);
	
	}

	@Override
	public void deleteObject(Class entityName, Serializable id) {
		// TODO Auto-generated method stub
		Object entity=findObject(entityName, id);
		hibernateTemplate.delete(entityName.getName(), entity);
	}

	@Override
	public void updateOBject(Class entityName, Object t) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(entityName.getName(), t);
	}

	@Override
	public Object findObject(Class entityName, Serializable id) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(entityName.getName(), id);
	}

	@Override
	public List findAllByProperties(Class entityName, Criterion... criterions) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria=DetachedCriteria.forClass(entityName);
			for (Criterion criterion : criterions) {
				criteria.add(criterion);
			}
		return hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public List findAllByProperties(Class entityName, Integer pageIndex,
			Integer pageSize, Criterion... criterions) {
		DetachedCriteria criteria=DetachedCriteria.forClass(entityName);
		for (Criterion criterion : criterions) {
			criteria.add(criterion);
		}
		Integer firstResult=(pageIndex-1)*pageSize;
		return hibernateTemplate.findByCriteria(criteria, firstResult, pageSize);
	}
	@Override
	public int getMaxPage(Class entityName, int pageSize,
			Criterion... criterions) {
		List list=findAllByProperties(entityName, criterions);
		if(list.size()%pageSize==0){
			return list.size()/pageSize;
		}
		return list.size()/pageSize+1;
	}
	@Override
	public int getMaxPage(List list,int pageSize) {
		if(list.size()%pageSize==0){
			return list.size()/pageSize;
		}
		return list.size()/pageSize+1;
	}
	@Override
	public List findAll(Class entityName, List<Criterion> list,
			Integer pageIndex, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(entityName);
		for (Criterion criterion : list) {
			criteria.add(criterion);
		}
		Integer firstResult=(pageIndex-1)*pageSize;
		return hibernateTemplate.findByCriteria(criteria, firstResult, pageSize);
	}
	@Override
	public int getRowCount(Class entityClass,Criterion... criterions) {
		// TODO Auto-generated method stub
		
		DetachedCriteria criteria=DetachedCriteria.forClass(entityClass);
		for (Criterion criterion : criterions) {
			criteria.add(criterion);
		}
		criteria.setProjection(Projections.rowCount());
		
		return (int) hibernateTemplate.findByCriteria(criteria).get(0);
	}
	@Override
	public List findAllByProperties(Class entityClass, int page, int pageSize,
			Criteria criteria) {
		// TODO Auto-generated method stub
		int firstResult=(page-1)*pageSize;
		DetachedCriteria criteria2=(DetachedCriteria) criteria;
		return hibernateTemplate.findByCriteria(criteria2, firstResult, pageSize);
	}*/
	
}