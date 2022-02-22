package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.ByteArrayInputStream;

@Controller
public class DocumentController {

    @Autowired
    private ReunionRepository reunionRepository;

    @Autowired
    private DocumentImortationDechet documentImortationDechet;

    @Autowired
    private DocumentDechetCTRepository documentDechetCTRepository;

    @Autowired
    private DocumentTransactionD documentTransactionD;

    @Autowired
    private DocumentExportationD documentExportationD;

    @Autowired
    private DocumentDechetNdRepository documentDechetNdRepository;

    @Autowired
    private WebService web;

    @Autowired
    private DemandeInformationRepository demandeRepository;
    

    @Autowired
    private NotificationRepository notifRepo;

    @Autowired
    private EntrepriseValOuTraitRepo entrepriseValOuTraitRepo;

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private DocumentEieRepository  documentEieRepository;

    @Value("${urls}")
    private String urls;

    @GetMapping("/api/demande_print/{idNotif}")
    public ResponseEntity<InputStreamResource> demande_print(@PathVariable int idNotif) throws Exception{

        DemandeInformation drt=demandeRepository.getOne(idNotif);

        HttpHeaders headers = new HttpHeaders();
//        headers.add("Content-Disposition", "inline; filename=testx.pdf");
        headers.add("Content-Disposition", "attachment; filename="+drt.getNum_demande()+".pdf");



DocumentEIE d = documentEieRepository.getDocumentEIE();
//Object[] date=web.tronsaction("select"," date_reunion from reunion"," demande_information_id ="+idNotif+" and (reporte is null)");
        String dr = "";
        String nom = "";

        try {
            Reunion r = reunionRepository.getByProjet(idNotif);
            if(r!=null){
                dr = r.getDate_reunion();
                nom= r.getNom_fr();
            }
        }catch (Exception e){

        }

        ByteArrayInputStream bis ;
        if(drt.getType().equals("NT")){
           bis= GeneratePDF.generateDocumentNotice(d,drt,dr,nom,urls);
        }
        else{
            bis= GeneratePDF.generateDocumentEIE(d,drt,dr,nom,urls);
        }

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));


    }

    @GetMapping("/downloadRecuDepo/{idNotif}")
    public ResponseEntity<InputStreamResource> generateRecuDepoDossier(@PathVariable int idNotif) throws Exception{

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=recuDepositiondossir.docx");

        Notification n = notifRepo.findById(idNotif).orElse(null);
        //User u = userRepo.findById(n.getUser_id()).orElse(null);
        EntrepriseValOuTrait e = entrepriseValOuTraitRepo.findentrepriseByIdNotif(idNotif);
        User u = userRepo.getOne(1);
        ByteArrayInputStream bis = GenerateWordDocuments.generateRecuDepoNotification(n,u,e);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));
    }

    @GetMapping("/api/download")
    public ResponseEntity<InputStreamResource> demande() throws Exception{

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=examen.docx");

     //   DemandeInformation d = demandeRepository.findById(id).orElse(null);
        ByteArrayInputStream bis = MonDocument.generateExamDocument();

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));

    }

    @GetMapping("/api/download_decision/{id_dmd}")
    public ResponseEntity<InputStreamResource> demande(@PathVariable int id_dmd) throws Exception{
        String dr = "";

        DemandeInformation drt=demandeRepository.getOne(id_dmd);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=décision.pdf");
        try {
            Reunion r = reunionRepository.getByProjet(id_dmd);
            if(r!=null){
                dr = r.getDate_reunion();
            }
        }catch (Exception e){

        }
        //   DemandeInformation d = demandeRepository.findById(id).orElse(null);
        ByteArrayInputStream bis = GeneratePDF.generateDecision(drt,dr,urls);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));

    }


    ///////////Mes Document ////////////////////////////
    /*@GetMapping("/api/downloadDocumentImportDechetND")
    public ResponseEntity<InputStreamResource> DownloadDocumentImportDechetNd() throws Exception{
     *//*   HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=DocumentImportDechetNonDengereux.pdf");

        DocumentDechetND d = documentDechetNdRepository.getDocumentDechetND();

        //ByteArrayInputStream bis = GeneratePDF.generateDocumentImportationDechetND(d);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));*//*

    }
*/


    /*@GetMapping("/api/downloadDocumentTr")
    public ResponseEntity<InputStreamResource> DownloadDocumentTransit() throws Exception{
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=DocumentTransit.pdf");

        DocumentTransaction d = documentTransactionD.getDocumentTransactionD();

        ByteArrayInputStream bis = GeneratePDF.generateDocumentTransaction(d);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));

    }*/

    /*@GetMapping("/api/downloadDocumentExportation")
    public ResponseEntity<InputStreamResource> DownloadDocumentExportation() throws Exception{
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=DocumentExportation.pdf");

        DocumentExportaltion d = documentExportationD.getDocumentExportationD();

        ByteArrayInputStream bis = GeneratePDF.generateDocumentExportation(d);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));

    }*/

   /* @GetMapping("/api/downloadDocumentCollecte")
    public ResponseEntity<InputStreamResource> downloadDocumentCollecte() throws Exception{
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=DocumentCollecte.pdf");

        DocumentDechetCT d = documentDechetCTRepository.getDocumentDechetCT();

        ByteArrayInputStream bis = GeneratePDF.generateDocumentCT(d);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(bis));

    }*/


}
