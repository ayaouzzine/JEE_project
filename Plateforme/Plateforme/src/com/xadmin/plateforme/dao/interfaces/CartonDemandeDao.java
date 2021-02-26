package com.xadmin.plateforme.dao.interfaces;

import java.sql.SQLException;
import java.util.List;

import com.xadmin.plateforme.bean.CartonDemande;
import com.xadmin.plateform.classesneeded.LigneDemandeSpec;

public interface CartonDemandeDao {

	 public List<LigneDemandeSpec> findCartonDemande(int id_demande) throws SQLException;
	 public int addCartonDemande(CartonDemande cd) throws SQLException;
	 public boolean updateCartonDemande(CartonDemande cd) throws SQLException;
	 public boolean deleteCartonDemande(CartonDemande cd) throws SQLException; 
}