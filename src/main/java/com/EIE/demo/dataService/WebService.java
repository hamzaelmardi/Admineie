package com.EIE.demo.dataService;

import com.EIE.demo.model.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface WebService {

    
	public Compte getCompteConnected();
	public void addNumNotification(Notification nt,String text);
	public void addSociete(Societe nt, int secteur);
	public void changertatutDemande(DemandeInformation nt, int statut);
	public void addDemandeInformation(DemandeInformation nt, int categorie);
	public void addDocInfo( MultipartFile[] fileToUpload , int id,int check);
	public void addDocInfoRegion(MultipartFile[] fileToUpload, int id, int idRegion);
	public void addDocAut( MultipartFile[] fileToUpload , int id,int check);
//	public void addDemandeInformationDoc(DemandeInformation nt);
	public void verifierCompte(int nt);
	public Compte chackmail(String email);
	String UpdatePassword(int id,String passe,String password);
	String UpdatePassword2(int id,String password);

	public String autologin2(String j_name, String j_pass);
	public Object[] tronsaction(String opiration, String table,String filter);
//	public Object[] addObject(Object obje);
	public String addObject(Object nt, String table);
	public String updateObject(Object nt, String table,String id);
	public ResponseEntity<RestResponsePage<Notification>> getListNotiifcationByCompte(Pageable page, int compteId);
	public Notification getNotiifcationByNum(String Num);
	public DemandeInformation getDemandeInfoByNum(String Num);
	public Notification getNotiifcationById(int id);
	public Region getRegion(int id);
	public DemandeInformation getDemandeInfoById(int id);
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompte(Pageable page, int compteId);
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompteStatut(Pageable page, int compteId,int statut);
	public DocImport[] listDocImport();
	public ListDocNotif[] listDocNotif(int id);
	public ResponseEntity<RestResponsePage<Questions>> getListQuestions(Pageable page);
	public ResponseEntity<RestResponsePage<Questions>> getListQuestionsLikeTitle(String rech,PageRequest pageRequest);
	public void saveQuestion(Questions question);
	public Questions getQuestionById(int id);
    Notification findByIdnotif(int idNotif);


	ResponseEntity<RestResponsePage<Reponse>> getListReponseByIdQuestion(int id, PageRequest pageRequest);

	public void saveReponse(Reponse r,int id);
	public void deleteReponse(int id_ques, int idrep);
	public Reponse getReponseById(int id);
}
