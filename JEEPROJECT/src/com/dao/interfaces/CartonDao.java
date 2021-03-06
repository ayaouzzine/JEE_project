package com.dao.interfaces;

import java.sql.SQLException;
import java.util.List;

import com.bean.Carton;


public interface CartonDao {

	public int getIdByType(String type);
	public List<Carton> findAll () throws SQLException;
	public int updateCarton(Carton carton) throws SQLException;
	public int deleteCarton(int id_carton) throws SQLException;
	public float getPriceByType(String type);
}