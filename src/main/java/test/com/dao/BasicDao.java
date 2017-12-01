package test.com.dao;

import org.hibernate.Session;

import java.util.List;

public interface BasicDao<T> {
    /**
     * @return current Hibernate Session
     */
    Session getCurrentSession();

    /**
     * Create test.com.entity at database
     *
     * @param entity - current test.com.entity for creation
     * @return created test.com.entity
     */
    T create(T entity);

    /**
     * Find test.com.entity at database
     *
     * @param id = uniq id at db for specific test.com.entity
     * @return test.com.entity
     */
    T getById(long id);

    /**
     * Delete test.com.entity from DB
     *
     * @param entity = uniq test.com.entity from DB
     * @return deleted test.com.entity
     */
    T delete(T entity);

    /**
     * Receive all entities by specific type
     *
     * @return list from test.com.entity
     */
    List<T> getList();

    /**
     * Update specify test.com.entity
     *
     * @param entity = test.com.entity for update
     * @return updated test.com.entity
     */
    T update(T entity);
}
