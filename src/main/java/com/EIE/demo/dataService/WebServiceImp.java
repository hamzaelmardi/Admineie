package com.EIE.demo.dataService;

import com.EIE.demo.model.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.io.FileSystemResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;

//
@Service
public class WebServiceImp implements WebService {
	
	@Value("${url}")
	private String urlRest;



	@Override
	public Compte getCompteConnected() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name=auth.getName();
		final String uri = urlRest+"/SelectOneUser/"+name;
		RestTemplate restTemplate = new RestTemplate();
		Compte  result = restTemplate.getForObject(uri, Compte.class);
		return result;
	}



	@Override
	public void addNumNotification(Notification nt,String text) {
		final String uris = urlRest + "/addNumNotifcationRest/"+text;
		RestTemplate restTemplate = new RestTemplate();

		restTemplate.postForLocation(uris, nt, Notification.class);
		
	}
	
	@Override
	public void addSociete(Societe nt, int secteur) {
		final String uris = urlRest + "/addSocieteRest/"+secteur;
		RestTemplate restTemplate = new RestTemplate();

		restTemplate.postForLocation(uris, nt, Societe.class);
		
	}
	
	@Override
	public void changertatutDemande(DemandeInformation nt, int statut) {
		final String uris = urlRest + "/changeStatutRest/"+statut;
		RestTemplate restTemplate = new RestTemplate();

		restTemplate.postForLocation(uris, nt, DemandeInformation.class);
		
	}
	
	@Override
	public void addDemandeInformation(DemandeInformation nt, int categorie) {
		final String uris = urlRest + "/addDemandeInformationRest/"+categorie;
		RestTemplate restTemplate = new RestTemplate();

		restTemplate.postForLocation(uris, nt, DemandeInformation.class);
		
	}
	
//	@Override
//	public void addDemandeInformationDoc(DemandeInformation nt) {
//		final String uris = urlRest + "/addDemandeInformationDocRest";
//		RestTemplate restTemplate = new RestTemplate();
//
//		restTemplate.postForLocation(uris, nt, DemandeInformation.class);
//		
//	}
	
	@Override
	public void addDocInfo( MultipartFile[] fileToUpload,int id,int check) {
		final String uris = urlRest + "/addDemandeInformationDocRest/"+id+"/"+check;
		 MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
	      bodyMap.add("file", new FileSystemResource(convert(fileToUpload[0])));
	      HttpHeaders headers = new HttpHeaders();
	      headers.setContentType(MediaType.MULTIPART_FORM_DATA);
	      HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
	      RestTemplate restTemplate = new RestTemplate();
	      ResponseEntity<String> response = restTemplate.exchange(uris,
	              HttpMethod.POST, requestEntity, String.class);
		
	}

	@Override
	public void addDocInfoRegion( MultipartFile[] fileToUpload,int id,int idRegion) {
		final String uris = urlRest + "/addRegionDocRest/"+id+"/"+idRegion;
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		bodyMap.add("file", new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);

	}
	
	@Override
	public void addDocAut( MultipartFile[] fileToUpload,int id,int check) {
		final String uris = urlRest + "/addDocAutRest/"+id+"/"+check;
		 MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
	      bodyMap.add("file", new FileSystemResource(convert(fileToUpload[0])));
	      HttpHeaders headers = new HttpHeaders();
	      headers.setContentType(MediaType.MULTIPART_FORM_DATA);
	      HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
	      RestTemplate restTemplate = new RestTemplate();
	      ResponseEntity<String> response = restTemplate.exchange(uris,
	              HttpMethod.POST, requestEntity, String.class);
		
	}
	public static File convert(MultipartFile file)
	  {    
	    File convFile = new File(file.getOriginalFilename());
	    try {
	        convFile.createNewFile();
	          FileOutputStream fos = new FileOutputStream(convFile); 
	            fos.write(file.getBytes());
	            fos.close(); 
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } 

	    return convFile;
	 }

	@Override
	public void verifierCompte(int id) {
		final String uris = urlRest + "/verifiedCompteRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris,  Societe.class);

	}
	@Override
	public String autologin2(String j_name, String j_pass) {
		final String uris = urlRest + "/login2/"+j_name+"/"+j_pass;
		RestTemplate restTemplate = new RestTemplate();
		String response = restTemplate.getForObject(uris, String.class);
		return response;
	}

	@Override
	public Compte chackmail(String email) {
		final String uris = urlRest + "/SelectOneUser/"+email;
		RestTemplate restTemplate = new RestTemplate();
		Compte response = restTemplate.getForObject(uris, Compte.class);
		return response;
	}


	@Override
	public DocImport[] listDocImport() {

		final String uri = urlRest + "/listDocRest";
		RestTemplate restTemplate = new RestTemplate();
		DocImport[] resultat = restTemplate.getForObject(uri, DocImport[].class);

		return resultat;
	}
	
	@Override
	public ListDocNotif[] listDocNotif(int id) {

		final String uri = urlRest + "/listDocNotifRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ListDocNotif[] resultat = restTemplate.getForObject(uri, ListDocNotif[].class);

		return resultat;
	}


    @Override
	public Notification findByIdnotif(int idNotif) {
		final String uris = urlRest + "/findByIdnotifRest/"+idNotif;
		RestTemplate restTemplate = new RestTemplate();
		Notification response = restTemplate.getForObject(uris, Notification.class);
		return response;
	}


	@Override
	public Object[] tronsaction(String opiration, String table,String filter) {

		final String uri = urlRest + "/TransactionInTable/"+opiration+"/"+table+"/"+filter;
		RestTemplate restTemplate = new RestTemplate();
		Object[] resultat = restTemplate.getForObject(uri, Object[].class);

		return resultat;
	}

	@Override
	public String addObject(Object nt, String table) {
		final String uris = urlRest + "/add_object/"+table;
		RestTemplate restTemplate = new RestTemplate();

		URI test = restTemplate.postForLocation(uris, nt, Object.class);
		String tt = test.getPath().split("/")[1];
		 tt = test.getPath().split("/")[2];
		return tt;


	}

	@Override
	public String UpdatePassword(int id,String passe,String password){
		final String uris = urlRest + "/updatepasswordRest/"+id+"/"+passe;
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		bodyMap.add("password", password );
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> response = restTemplate.exchange(uris,
					HttpMethod.POST, requestEntity, String.class);
			return "OK";

		} catch (Exception e) {
			return "le lien est expiré";
		}

	}


	@Override
	public String UpdatePassword2(int id,String password){
		final String uris = urlRest + "/updatepasswordRest2/"+id;
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		bodyMap.add("password", password );
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> response = restTemplate.exchange(uris,
					HttpMethod.POST, requestEntity, String.class);
			return "OK";

		} catch (Exception e) {
			return "le lien est expiré";
		}

	}

	@Override
	public String updateObject(Object nt, String table,String id) {
		final String uris = urlRest + "/update_object/"+table+"/"+id;
		RestTemplate restTemplate = new RestTemplate();

		URI test = restTemplate.postForLocation(uris, nt, Object.class);
		String tt = test.getPath().split("/")[1];
		 tt = test.getPath().split("/")[2];
		return tt;


	}

	@Override
	public ResponseEntity<RestResponsePage<Notification>> getListNotiifcationByCompte(Pageable page, int compteId) {
		final String uri = urlRest+"/getListeNotificationByCompte/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Notification>> responseType = new ParameterizedTypeReference<RestResponsePage<Notification>>() { };

		ResponseEntity<RestResponsePage<Notification>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}
	
	@Override
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompte(Pageable page, int compteId) {
		final String uri = urlRest+"/getListeDemandeInformationByCompte/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<DemandeInformation>> responseType = new ParameterizedTypeReference<RestResponsePage<DemandeInformation>>() { };

		ResponseEntity<RestResponsePage<DemandeInformation>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}
	
	@Override
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompteStatut(Pageable page, int compteId,int statut) {
		final String uri = urlRest+"/getListeDemandeInformationByCompteStatut/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId+"/"+statut;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<DemandeInformation>> responseType = new ParameterizedTypeReference<RestResponsePage<DemandeInformation>>() { };

		ResponseEntity<RestResponsePage<DemandeInformation>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}

	@Override
	public Notification getNotiifcationByNum(String num) {


		final String uri = urlRest+"/getNotByNum/"+num;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}
	@Override
	public DemandeInformation getDemandeInfoByNum(String num) {


		final String uri = urlRest+"/getDemandeInfoByNum/"+num;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}
	
	@Override
	public DemandeInformation getDemandeInfoById(int id) {


		final String uri = urlRest+"/getDemandeInfoByIdRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public Notification getNotiifcationById(int id) {


		final String uri = urlRest+"/getNotById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}
	
	@Override
	public Region getRegion(int id) {


		final String uri = urlRest+"/getRegionId/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Region  result = restTemplate.getForObject(uri, Region.class);
		return result;
	}


	@Override
	public ResponseEntity<RestResponsePage<Questions>> getListQuestions(Pageable page) {
		final String uri = urlRest+"/getListQuestions/"+page.getPageNumber()+"/"+page.getPageSize();
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Questions>> responseType = new ParameterizedTypeReference<RestResponsePage<Questions>>() { };
		ResponseEntity<RestResponsePage<Questions>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}


	@Override
	public void saveQuestion(Questions question) {
		final String uris = urlRest + "/saveQuestion";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, question, Questions.class);
	}

	@Override
	public Questions getQuestionById(int id) {
		final String uri = urlRest+"/getquestionbyId/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Questions  result = restTemplate.getForObject(uri, Questions.class);
		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<Questions>> getListQuestionsLikeTitle(String rech,PageRequest page) {
		final String uri = urlRest+"/getListquestionsliketitle/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+rech;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Questions>> responseType = new ParameterizedTypeReference<RestResponsePage<Questions>>() { };
		ResponseEntity<RestResponsePage<Questions>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<Reponse>> getListReponseByIdQuestion(int id, PageRequest page) {
		final String uri = urlRest+"/getListReponseByIdQuestion/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Reponse>> responseType = new ParameterizedTypeReference<RestResponsePage<Reponse>>() { };
		ResponseEntity<RestResponsePage<Reponse>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}

	@Override
	public void saveReponse(Reponse r,int id) {
		final String uris = urlRest + "/saveReponse/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, r, Reponse.class);
	}

	@Override
	public void deleteReponse(int id_ques, int idrep) {
		final String uris = urlRest + "/deleteReponse/"+idrep+"/"+id_ques;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris, Reponse.class);
	}

	@Override
	public Reponse getReponseById(int id) {
		final String uri = urlRest+"/getReponseById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Reponse  result = restTemplate.getForObject(uri, Reponse.class);
		return result;
	}

//autorisation@2020
//	admin_auto


}
