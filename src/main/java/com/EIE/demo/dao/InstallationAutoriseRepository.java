package com.EIE.demo.dao;

import com.EIE.demo.model.InstallationAutorise;
import com.EIE.demo.model.LieuElimination;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public
interface InstallationAutoriseRepository extends JpaRepository<InstallationAutorise, Integer> {

    @Query("select n from InstallationAutorise n where n.deleteDateTime is null")
    public Page<InstallationAutorise> getInstallationPage(Pageable p);

    @Query("from InstallationAutorise  where deleteDateTime is null order by id_installation_autorise DESC  ")
    InstallationAutorise[] getInstallationAutoriseArr();
}
