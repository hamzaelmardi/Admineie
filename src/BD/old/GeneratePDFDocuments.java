package com.EIE.demo.web;

import com.EIE.demo.model.Entreprise;
import com.EIE.demo.model.ImportateurNotifiant;
import com.EIE.demo.model.Notification;
import com.EIE.demo.model.Transporteur;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GeneratePDFDocuments {


    public static ByteArrayInputStream generateDocumentDeNotification(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Document de notification pour les mouvement des dechets ..... vers l'installation de traitement ou d'elimination ");
        headerPar.setFont(font);
        headerPar.setSpacingAfter(2);


        //Declaring Table
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);

        //Paragraph ==========================
        Paragraph par1=new Paragraph(16);

        par1.setFont(font);
        par1.add(new Phrase("1.Importateur- Destinataire : ",fontbold));
        par1.add(Chunk.NEWLINE);
        //========
        String nom_importateur =ns.getImportateur().getNom_fr()==null?"":ns.getImportateur().getNom_fr();
        String adresse_importateur =ns.getImportateur().getAdresse_fr()==null?"":ns.getImportateur().getAdresse_fr();
        String persone_a_contacte_importateur = "PERSONNE A CONTACTER Importateur";
        String tele_importateur =ns.getImportateur().getTel()==null?"":ns.getImportateur().getTel();
        String fax_importateur =ns.getImportateur().getFax()==null?"":ns.getImportateur().getFax();
        String email_importateur =ns.getImportateur().getMail()==null?"":ns.getImportateur().getMail();

        par1.add("Nom : ");
//        par1.add("NOM");
        par1.add(nom_importateur);
        par1.add(Chunk.NEWLINE);

        par1.add("Adresse : ");
        par1.add(adresse_importateur);
//        par1.add("ADRESSE");
        par1.add(Chunk.NEWLINE);

        par1.add("Personne a contacter : ");
        par1.add(persone_a_contacte_importateur);
        par1.add(Chunk.NEWLINE);

        par1.add("Tel : ");
        par1.add(tele_importateur);
//        par1.add("TELEPHONE");
        par1.add(Chunk.NEWLINE);

        par1.add("Fax : ");
        par1.add(fax_importateur);
//        par1.add("FAX");
        par1.add(Chunk.NEWLINE);

        par1.add("Mail : ");
        par1.add(email_importateur);
//        par1.add("MAIL");
        par1.add(Chunk.NEWLINE);

        PdfPCell cellMerged = new PdfPCell();
        cellMerged.addElement(par1);
        cellMerged.setRowspan(3);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par2=new Paragraph(13);
        par2.setFont(font);
        //========
        String numero_notification=ns.getNum_notification()==null?"":ns.getNum_notification();

        String elimination="je le trouve pas";
        boolean isElimination=elimination.equalsIgnoreCase("traitement");

        //========

        par2.add(new Phrase("2.No. de notification : ",fontbold));
        par2.add(numero_notification);
        par2.add(Chunk.NEWLINE);

        //Add Here Condition for checking the boxes

        par2.add("Notification consernant :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("A.i) Expedition unique  :");
        par2.add(checkedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Expedition multiples:");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("B.i) Elimination             :");
        par2.add(isElimination?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Valorisation              :");
        par2.add(isElimination?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        PdfPCell cell = new PdfPCell();
        cell.addElement(par2);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par3=new Paragraph(13);
        //========
        String nombre_expedition_prevu="66";
        //========

        par3.add(new Phrase("3.Nombre total d'éxpeditions prévues : ",fontbold));
        par3.add(nombre_expedition_prevu);

        par3.setSpacingAfter(7);

        cell = new PdfPCell();
        cell.addElement(par3);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par4=new Paragraph(13);
        par4.setFont(font);
        par4.setSpacingAfter(7);
        //========
        String quantite_en_tonne="1500";
        String quantite_en_m2="5900";
        //========

        par4.add(new Phrase("4.Quantité total prévue : ",fontbold));
        par4.add(Chunk.NEWLINE);
        par4.add("Mg/Tonnes : ");
        par4.add(quantite_en_tonne);
        par4.add(Chunk.NEWLINE);
        par4.add("m3 : ");
        par4.add(quantite_en_m2);

        cell = new PdfPCell();
        cell.addElement(par4);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par5=new Paragraph(13);
        par5.setFont(font);
        par5.setSpacingAfter(7);
        //========
        String premier_depart=ns.getPremier()==null?"":ns.getPremier();
        String dernier_depart=ns.getDernier()==null?"":ns.getDernier();
        //========

        par5.add(new Phrase("5.Période prévue des expéditions",fontbold));
        par5.add(Chunk.NEWLINE);
        par5.add("premier départ : ");
        par5.add(premier_depart);
        par5.add("    ");
        par5.add("Dernier départ : ");
        par5.add(dernier_depart);

        cell = new PdfPCell();
        cell.addElement(par5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par6=new Paragraph(13);
        par6.setFont(font);
        par6.setSpacingAfter(7);
        //========
        String type_conditionnement="je le touve pas";
        String prescription="je le touve pas";
        //boolean isPrescription=prescription.equalsIgnoreCase("oui");

        //========

        par6.add(new Phrase("6.Type(s) de conditionnnement(3) : ",fontbold));
        par6.add(type_conditionnement);
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase("Prescriptions spéciales de manutention : ",fontbold));
        par6.add(oui);
       // par6.add(isPrescription?checkedChunk:uncheckedChunk);
        par6.add("il n y a pas");
        par6.add("      ");
        par6.add(non);
        //par6.add(isPrescription?uncheckedChunk:checkedChunk);
        par6.add("il n y a pas");

        cell = new PdfPCell();
        cell.addElement(par6);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par7=new Paragraph(13);
        par7.setFont(font);
        par7.setSpacingAfter(7);
        //========
        String nom_transporteur =ns.getTransporteur().get(0).getNom_fr()==null?"":ns.getTransporteur().get(0).getNom_fr();
        String adresse_transporteur =ns.getTransporteur().get(0).getAdresse_fr()==null?"":ns.getTransporteur().get(0).getAdresse_fr();
        String persone_a_contacte_transporteur = "PERSONNE A CONTACTER Transporteur";
        String tele_transporteur =ns.getTransporteur().get(0).getTel()==null?"":ns.getTransporteur().get(0).getTel();
        String fax_transporteur =ns.getTransporteur().get(0).getFax()==null?"":ns.getTransporteur().get(0).getFax();
        String email_transporteur =ns.getTransporteur().get(0).getMail()==null?"":ns.getTransporteur().get(0).getMail();
        //String moyen_de_transporteur =ns.getTransporteur().get(0).getMoyenTransport().getNom_fr()==null?"":ns.getTransporteur().get(0).getMoyenTransport().getNom_fr();
        String moyen_de_transporteur ="";
        //========

        par7.add(new Phrase("7.Transporteur(s) prévu :",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("Nom : ");
        par7.add(nom_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(adresse_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(persone_a_contacte_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Tel : ");
        par7.add(tele_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Fax : ");
        par7.add(fax_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Mail : ");
        par7.add(email_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Moyen de transport (5) : ");
        par7.add(moyen_de_transporteur);
        par7.add(Chunk.NEWLINE);

        cellMerged =new PdfPCell();
        cellMerged.setRowspan(2);
        cellMerged.addElement(par7);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par8=new Paragraph(13);
        par8.setFont(font);
        par8.setSpacingAfter(7);
        //========


        //========

        par8.add(new Phrase("10.Opérations d'élimination / Valorisation",fontbold));
        par8.add(Chunk.NEWLINE);
        par8.add("Code D (1)/Code R (2) : ");
        par8.add(" ---------------------- ");

        cell = new PdfPCell();
        cell.addElement(par8);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par9=new Paragraph(13);
        par9.setFont(font);
        par9.setSpacingAfter(7);
        //========


        //========


        par9.add(new Phrase("11.Dénomination et composition des déchets",fontbold));

        cell = new PdfPCell();
        cell.addElement(par9);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(7);
        //========
        //String nom_producteur =ns.getProducteur().getNom_fr()==null?"":ns.getProducteur().getNom_fr();
        String nom_producteur ="";
        //String adresse_producteur =ns.getProducteur().getAdresse_fr()==null?"":ns.getProducteur().getAdresse_fr();
        String adresse_producteur ="";
        String persone_a_contacte_producteur ="PERSONNE A CONTACTER Producteur";
        //String tele_producteur =ns.getProducteur().getTel()==null?"":ns.getProducteur().getTel();
        String tele_producteur ="";
        //String fax_producteur =ns.getProducteur().getFax()==null?"":ns.getProducteur().getFax();
        String fax_producteur ="";
        //String mail_producteur =ns.getProducteur().getMail()==null?"":ns.getProducteur().getMail();
        String mail_producteur ="";
        //String lieu_procede_producteur =ns.getProducteur().getLieu_fr()==null?"":ns.getProducteur().getLieu_fr();
        String lieu_procede_producteur ="";

        //========


        par10.add(new Phrase("8.Producteur(s) des déchets",fontbold));
        par10.add(Chunk.NEWLINE);

        par10.add("Nom : ");
        par10.add(nom_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Adresse : ");
        par10.add(adresse_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Personne a contacter : ");
        par10.add(persone_a_contacte_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Tel : ");
        par10.add(tele_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Fax : ");
        par10.add(fax_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Mail : ");
        par10.add(mail_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Lieu et procede de production : ");
        par10.add(lieu_procede_producteur);
        par10.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par10);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(7);
        //========
        String carateristiques_physique="je le trouve pas";
        //========

        par11.add(new Phrase("12.Caractéristiques physique (6) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add(carateristiques_physique);

        cell = new PdfPCell();
        cell.addElement(par11);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par12=new Paragraph(13);
        par12.setFont(font);
        par12.setSpacingAfter(7);

        String nom_entreprise= ns.getImportateur().getNom_fr()==null?"":ns.getImportateur().getNom_fr();
        String address_entreprise= ns.getImportateur().getAdresse_fr()==null?"":ns.getImportateur().getAdresse_fr();


        if(isElimination){
            par12.add(new Phrase("9. Installation d'élimination ",fontbold));
            //AddCondition to check or no
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  ",fontbold));
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
        }else{
            par12.add(new Phrase("9. Installation d'élimination ",fontbold));
            //AddCondition to check or no
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  ",fontbold));
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
        }


        par12.add("Nom : ");
        par12.add(nom_entreprise);
        par12.add(Chunk.NEWLINE);

        par12.add("Adresse : ");
        par12.add(address_entreprise);
        par12.add(Chunk.NEWLINE);

        par12.add("Personne a contacter : ");
        par12.add("PERSONNE A CONTACTER Entreprise Val Ou trait");
        par12.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par12);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par13=new Paragraph(13);
        par13.setFont(font);
        par13.setSpacingAfter(7);
        //========
        String code_National=ns.getCode().getId_code()==0?"":String.valueOf(ns.getCode().getId_code());
        //========

        par13.add(new Phrase("13.Identifications des déchets",fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add("Convention de Bale.Annex 8(ou 9 s'il y a lieu) : ");
        par13.add("CONV. BALE");
        par13.add(Chunk.NEWLINE);
        par13.add("Code National(Catalogue Marocain des déchets) : ");
        par13.add(code_National);
        par13.add(Chunk.NEWLINE);
        par13.add("Code H : ");
        par13.add("CODE H");
        par13.add(Chunk.NEWLINE);
        par13.add("Code(s) des douanes (SH) : ");
        par13.add("CODE DES DOUANES");
        par13.add(Chunk.NEWLINE);
        par13.add("Autre (preciser) : ");
        par13.add("AUTRE");

        cell = new PdfPCell();
        cell.addElement(par13);
        table.addCell(cell);

        Paragraph par14=new Paragraph(13);
        par14.setFont(font);
        par14.setSpacingAfter(7);

        par14.add(new Phrase("Nom de la zone franche d'expédition",fontbold));

        cell = new PdfPCell();
        cell.addElement(par14);
        table.addCell(cell);

        Paragraph par15=new Paragraph(13);
        par15.setFont(font);
        par15.setSpacingAfter(7);
        //========
        String nom_zone_franche=ns.getZonneFranche().getNom_fr()==null?"":ns.getZonneFranche().getNom_fr();
        String nom_destination=ns.getDestination_final()==null?"":ns.getDestination_final();
        //========

        par15.add(new Phrase("Nom de la destination finale",fontbold));

        cell = new PdfPCell();
        cell.addElement(par15);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase( nom_zone_franche ) );
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(nom_destination));
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(7);
        //========
        String bureau_douane="bureau douane n'existe pas";
        //========



        par18.add(new Phrase("14.Bureau de douane d'entrée :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par18);
        table.addCell(cellMerged);

        cellMerged = new PdfPCell(new Phrase(bureau_douane));
        cellMerged.setColspan(2);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par20=new Paragraph(11);
        par20.setFont(font);
        par20.setSpacingAfter(7);
        par20.add(new Phrase("15.Declaration de l'importateur/producteur : ",fontbold));
        par20.add(Chunk.NEWLINE);
        par20.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                  " Je certifie également que le mouvement des déchets sera couvert par toutes les assurances ou " +
                  "garanties financières éventuellement requises notamment l'assurance de transport des déchets dangereuses.");
        par20.add(Chunk.NEWLINE);

        par20.add("Nom : ");
        par20.add(nom_importateur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(new Date().toString());
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add("SIGNATURE");
        par20.add(new Chunk(glue));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par20);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par21=new Paragraph(13);
        par21.setFont(font);
        par21.setSpacingAfter(7);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("RESERVE AUX AUTORITES COMPETANTES",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par21);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par22=new Paragraph(13);
        par22.setFont(font);
        par22.setSpacingAfter(7);
        //========
        String notification_recu="date recu n'existe pas";


        //========


        par22.add(new Phrase("16.Accusé de réception delivré par le Département de l'Environement",fontbold));
        par22.add(Chunk.NEWLINE);

        par22.add("Notification reçue le : ");
        par22.add(notification_recu);
        par22.add(Chunk.NEWLINE);

        par22.add("Accusé de réception transmis le : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de l'autorité compétente  : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);
        par22.add("cachet et/ou signature  : ");
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
//        par23.setSpacingAfter(7);

        par23.add(new Phrase("17.Consentement écrit au mouvement accorde par le departement de l'environement",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement accordé le : ");
        par23.add("DATE ------");
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement valable du : ");
        par23.add("DATE1 ");
        par23.add("au : ");
        par23.add("DATE2 ");
        par23.add(Chunk.NEWLINE);

        par23.add("Conditions particulières : ");
        par23.add(oui);
        //Add Condition to check to uncheck
        par23.add(checkedChunk);
        par23.add("      ");
        par23.add(non);
        //Here Also
        par23.add(uncheckedChunk);
        par23.add(Chunk.NEWLINE);
        par23.add("Nom de l'autorité compétente  : ");
        par23.add(" ------------- ");
        par23.add(Chunk.NEWLINE);
        par23.add("cachet et/ou signature  : ");
        par23.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par23);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par24=new Paragraph(13);
        par24.setSpacingAfter(7);
        par24.add(new Phrase("18.Conditions particulieresau consentement ou raisons de l'objection :",fontbold));

//Testing before adding to the document
//        Chunk oui = new Chunk("Oui : ",font);
//        par24.add(oui);
//        par24.add(checkedChunk);
//
//        Chunk non = new Chunk("Non : ",font);
//        par24.add(non);
//        par24.add(uncheckedChunk);


        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par24);
        table.addCell(cellMerged);

        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }


    public static ByteArrayInputStream generateDocumentDeMouvement2(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy");
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(Font.FontFamily.TIMES_ROMAN,14.0f);
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph();
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add(new Phrase("Document de mouvements des déchets . . . . . . . vers L’installation de traitement ou d’élimination.",fontH1));
        headerPar.setSpacingAfter(7);
        headerPar.setExtraParagraphSpace(12);

        //Declaring Table
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);

        //Paragraph ====

        Paragraph par1= new Paragraph();
        par1.setFont(font);
        par1.setSpacingAfter(5);
        //=========
        String numero_notification=ns.getNum_notification().equals("")?"......":ns.getNum_notification();
        String numero_serie=(ns.getSerie()==null||ns.getSerie().equals(""))?".......":ns.getSerie();
        //=========
        par1.add(new Phrase("1. Correspondant à la notification No. : ",fontbold));
        par1.add(numero_notification);
        par1.add(Chunk.TABBING);
        par1.add(Chunk.TABBING);
        par1.add(new Phrase("2. No. De série de l'expédition/nombre total d'expéditions : ",fontbold));
        par1.add(numero_serie);

        PdfPCell cell=new PdfPCell();
        cell.addElement(par1);
        cell.setPaddingTop(-2);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par2=new Paragraph(12);
        par2.setFont(font);
        par2.setSpacingAfter(3);
        //========
        String nom_importateur = "NOM IMPORTATEUR";
        String adresse_importateur = "ADRESSE IMPORTATEUR";
        String persone_a_contacte_importateur ="PERSONE A CONTACTER importateur";
        String tele_importateur = "TELE IMPORTATEUR";
        String fax_importateur = "FAX IMPORTATEUR";
        String email_importateur = "EMAIL IMPORTATEUR";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant np = ns.getImportateur();
            nom_importateur =np.getNom_fr();
            adresse_importateur = np.getAdresse_fr();
            persone_a_contacte_importateur = np.getContact_fr();
            tele_importateur = np.getTel();
            fax_importateur = np.getFax();
            email_importateur = np.getMail();
        }
        //========

        par2.add(new Phrase("3. Importateur – Notifiant :  ",fontbold));
        par2.add(Chunk.NEWLINE);

        par2.add("Nom : ");
        par2.add(nom_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Adresse : ");
        par2.add(adresse_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Personne a contacter : ");
        par2.add(persone_a_contacte_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Tel : ");
        par2.add(tele_importateur);
        par2.add(new Chunk(glue));

        par2.add("Fax : ");
        par2.add(fax_importateur);
        par2.add(new Chunk(glue));

        par2.add("Mail : ");
        par2.add(email_importateur);
        par2.add(new Chunk(glue));

        cell=new PdfPCell();
        cell.addElement(par2);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par3=new Paragraph(12);
        par3.setFont(font);
        par3.setSpacingAfter(5);
        //========
        String quantite_en_tonne="0000";//ns.getQuantite()==null?"1500":ns.getQuantite();
        String quantite_en_m3="0000";//ns.getQuantite()==null?"5900":ns.getQuantite();
        String unite = " -- ";
        if(ns.getQuantite()!=null){
            unite = ns.getUnite()!=null?ns.getUnite().getNom_fr():"";
            quantite_en_tonne = ns.getQuantite();
            quantite_en_m3 = ns.getQuantite_reel();
        }
        //========
        par3.add(new Phrase("4. Quantité réelle : ",fontbold));
        par3.add(Chunk.TABBING);
        par3.add(unite+"Mg (tonnes) : "+quantite_en_tonne);
        par3.add(quantite_en_tonne);
        par3.add(Chunk.TABBING);
        par3.add(Chunk.TABBING);
        par3.add("m3 : ");
        par3.add(quantite_en_m3);

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par4=new Paragraph(12);
        par4.setFont(font);
        par4.setSpacingAfter(5);
        //========
        String date_reelle_expedition="-- / -- / --";

        if(ns.getDate_reel()!=null){
            date_reelle_expedition =  df.format(ns.getDate_reel());
        }

        //========

        par4.add(new Phrase("5. Date réelle de l'expédition : ",fontbold));
        par4.add(date_reelle_expedition);

        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setPaddingTop(-2);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(3);
        //========
        String condit_type="Type conditionnement";//ns.getConditionement()==null?"Types":ns.getConditionement();
        String nombre_colis="0";
        if(ns.getTypeconditionnement()!=null){
            condit_type = ns.getTypeconditionnement().getNom_fr();
            nombre_colis = ns.getNbr_colis();
        }
        boolean isprescription=true;//ns.getPrescription().equalsIgnoreCase("oui");

        //========
        par5.add(new Phrase("6. Conditionnement",fontbold));
        par5.add(Chunk.TABBING);
        par5.add("Type(s)  (3) : ");
        par5.add(condit_type);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add("Nombre de colis :");
        par5.add(nombre_colis);
        par5.add(Chunk.NEWLINE);
        par5.add(new Phrase("Prescriptions particulières de manutention (2) :",fontbold));
        par5.add(Chunk.TABBING);
        par5.add(oui);
        par5.add(isprescription?checkedChunk:uncheckedChunk);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add(non);
        par5.add(isprescription?uncheckedChunk:checkedChunk);

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par6=new Paragraph(12);
        par6.setFont(font);
        par6.setSpacingAfter(3);
        //========
        String nom_transporteur1 ="NOM transporteur1";
        String adresse_transporteur1 ="ADRESSE transporteur1";
        String persone_a_contacte_transporteur1 ="PERSONE transporteur1";
        String tele_transporteur1 ="TELE transporteur1";
        String fax_transporteur1 ="FAX transporteur1";
        String email_transporteur1 ="EMAIL transporteur1";

        if(ns.getTransporteurOne()!=null){
            Transporteur ww = ns.getTransporteurOne();
            nom_transporteur1 = ww.getNom_fr();
            adresse_transporteur1 =ww.getAdresse_fr();
            tele_transporteur1 =ww.getTel();
            fax_transporteur1 =ww.getFax();
            email_transporteur1 =ww.getMail();
        }
        //========

        par6.add(new Phrase("7. a) 1er transporteur  : ",fontbold));
        par6.add(Chunk.NEWLINE);

        par6.add("Nom : ");
        par6.add(nom_transporteur1);
        par6.add(Chunk.NEWLINE);

        par6.add("Adresse : ");
        par6.add(adresse_transporteur1);
        par6.add(Chunk.NEWLINE);

        par6.add("Personne a contacter : ");
        par6.add(persone_a_contacte_transporteur1);
        par6.add(Chunk.NEWLINE);

        par6.add("Tel : ");
        par6.add(tele_transporteur1);
        par6.add(Chunk.NEWLINE);

        par6.add("Fax : ");
        par6.add(fax_transporteur1);
        par6.add(Chunk.NEWLINE);

        par6.add("Mail : ");
        par6.add(email_transporteur1);
        par6.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par7=new Paragraph(12);
        par7.setFont(font);
        par7.setSpacingAfter(3);
        //========
        String nom_transporteur2 ="NOM transporteur2";
        String adresse_transporteur2 ="ADRESSE transporteur2";
        String persone_a_contacte_transporteur2 ="PERSONE transporteur2";
        String tele_transporteur2 ="TELE transporteur2";
        String fax_transporteur2 ="FAX transporteur2";
        String email_transporteur2 ="EMAIL transporteur2";
        //========

        par7.add(new Phrase("7. b) 2ème transporteur : ",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("Nom : ");
        par7.add(nom_transporteur2);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(adresse_transporteur2);
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(persone_a_contacte_transporteur2);
        par7.add(Chunk.NEWLINE);

        par7.add("Tel : ");
        par7.add(tele_transporteur2);
        par7.add(Chunk.NEWLINE);

        par7.add("Fax : ");
        par7.add(fax_transporteur2);
        par7.add(Chunk.NEWLINE);

        par7.add("Mail : ");
        par7.add(email_transporteur2);
        par7.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par7);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par8=new Paragraph(12);
        par8.setFont(font);
        par8.setSpacingAfter(3);
        //========
        String nom_transporteur3 ="NOM transporteur3";
        String adresse_transporteur3 ="ADRESSE transporteur3";
        String persone_a_contacte_transporteur3 ="PERSONE transporteur3";
        String tele_transporteur3 ="TELE transporteur3";
        String fax_transporteur3 ="FAX transporteur3";
        String email_transporteur3 ="EMAIL transporteur3";
        //========

        par8.add(new Phrase("7. c) Dernier transporteur : ",fontbold));
        par8.add(Chunk.NEWLINE);

        par8.add("Nom : ");
        par8.add(nom_transporteur3);
        par8.add(Chunk.NEWLINE);

        par8.add("Adresse : ");
        par8.add(adresse_transporteur3);
        par8.add(Chunk.NEWLINE);

        par8.add("Personne a contacter : ");
        par8.add(persone_a_contacte_transporteur3);
        par8.add(Chunk.NEWLINE);

        par8.add("Tel : ");
        par8.add(tele_transporteur3);
        par8.add(Chunk.NEWLINE);

        par8.add("Fax : ");
        par8.add(fax_transporteur3);
        par8.add(Chunk.NEWLINE);

        par8.add("Mail : ");
        par8.add(email_transporteur3);
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par9=new Paragraph();
        par9.setSpacingAfter(4);
        par9.add(new Phrase(" - - - - - - A remplir par le représentant du transporteur - - - - - -",fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        cell=new PdfPCell();
        cell.setPaddingTop(-6);
        cell.addElement(par9);
//        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(4);
        //========

        String date_prise_charge1= ns.getTransporteurOne()!=null?df.format(ns.getTransporteurOne().getDate_pris_charge()):"YYYY/MM/DD";
        String signature1="SIGNATURE 1";
        //========

        par10.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add("Date de la prise en charge : ");
        par10.add(date_prise_charge1);
        par10.add(Chunk.NEWLINE);
        par10.add("Signature : ");
        par10.add(signature1);

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(4);
        //========
        String date_prise_charge2=ns.getTransporteurOne()!=null?df.format(ns.getTransporteurOne().getDate_pris_charge()):"YYYY/MM/DD";
        String signature2="SIGNATURE 2";
        //========

        par11.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add("Date de la prise en charge : ");
        par11.add(date_prise_charge2);
        par11.add(Chunk.NEWLINE);
        par11.add("Signature : ");
        par11.add(signature2);

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par12=new Paragraph(12);
        par12.setFont(font);
        par12.setSpacingAfter(4);
        //========
        String date_prise_charge3=ns.getTransporteurOne()!=null?df.format(ns.getTransporteurOne().getDate_pris_charge()):"YYYY/MM/DD";
        String signature3="SIGNATURE 3";
        //========

        par12.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par12.add(Chunk.NEWLINE);
        par12.add("Date de la prise en charge : ");
        par12.add(date_prise_charge3);
        par12.add(Chunk.NEWLINE);
        par12.add("Signature : ");
        par12.add(signature3);

        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par13=new Paragraph(12);
        par13.setFont(font);
        par13.setSpacingAfter(4);
        //=======
        String nom_producteur ="NOM producteur";
        String adresse_producteur ="ADRESSE producteur";
        String persone_a_contacte_producteur ="PERSONE producteur";
        String tele_producteur ="TELE producteur";
        String fax_producteur ="FAX producteur";
        String email_producteur ="EMAIL producteur";
        String lieu_production ="LIEU PROD";

        if(ns.getProducteur()!=null){
            nom_producteur =ns.getProducteur().getNom_fr();
            adresse_producteur =ns.getProducteur().getAdresse_fr();
            tele_producteur =ns.getProducteur().getTel();
            fax_producteur =ns.getProducteur().getFax();
            email_producteur =ns.getProducteur().getMail();
            lieu_production =ns.getProducteur().getLieu_fr();
        }
        //=======

        par13.add(new Phrase("8. Producteur(s) des déchets : ",fontbold));
        par13.add(Chunk.NEWLINE);

        par13.add("Nom : ");
        par13.add(nom_producteur);
        par13.add(Chunk.NEWLINE);

        par13.add("Adresse : ");
        par13.add(adresse_producteur);
        par13.add(Chunk.NEWLINE);

        par13.add("Personne a contacter : ");
        par13.add(persone_a_contacte_producteur);
        par13.add(Chunk.NEWLINE);

        par13.add("Tel : ");
        par13.add(tele_producteur);
        par13.add(Chunk.TABBING);

        par13.add("Fax : ");
        par13.add(fax_producteur);
        par13.add(Chunk.TABBING);
        par13.add(Chunk.NEWLINE);

        par13.add("Mail : ");
        par13.add(email_producteur);
        par13.add(Chunk.NEWLINE);


        par13.add("Lieu de production (2) : ");
        par13.add(lieu_production);
        par13.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par13);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par14=new Paragraph(12);
        par14.setFont(font);
        par14.setSpacingAfter(4);
        //=======
        String denomination_dechets=" ----------- ";
        //=======

        par14.add(new Phrase("11. Dénomination et composition des déchets  : ",fontbold));
        par14.add(Chunk.NEWLINE);
        par14.add(denomination_dechets);

        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par15=new Paragraph(12);
        par15.setFont(font);
        par15.setSpacingAfter(4);
        //=======
        String caracteristique_physique = ns.getCaracteristquePhysique()==null?"  -------------- ":ns.getCaracteristquePhysique().getNom_fr();
        //=======

        par15.add(new Phrase("12. Caractéristiques physiques (6) :",fontbold));
        par15.add(Chunk.NEWLINE);
        par15.add(caracteristique_physique);

        cell = new PdfPCell();
        cell.addElement(par15);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);
//Paragraph ====
        Paragraph par16=new Paragraph(12);
        par16.setFont(font);
        par16.setSpacingAfter(5);

        par16.add(new Phrase("9. Installation d'élimination :  ",fontbold));
        par16.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("ou",fontbold));
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("de valorisation (2):   ",fontbold));
        par16.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.NEWLINE);

        par16.add("Nom : ");
        par16.add(nom_producteur);
        par16.add(Chunk.NEWLINE);

        par16.add("Adresse : ");
        par16.add(adresse_producteur);
        par16.add(Chunk.NEWLINE);

        par16.add("Personne a contacter : ");
        par16.add(persone_a_contacte_producteur);
        par16.add(Chunk.NEWLINE);

        par16.add("Tél : ");
        par16.add(tele_producteur);
        par16.add(Chunk.TABBING);

        par16.add("Fax : ");
        par16.add(fax_producteur);
        par16.add(Chunk.TABBING);
        par16.add(Chunk.NEWLINE);

        par16.add("Mail : ");
        par16.add(email_producteur);
        par16.add(Chunk.NEWLINE);

        par16.add("Lieu effectif de l'élimination/valorisation : ");
        par16.add(lieu_production);
        par16.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par16);
        cell.setPaddingTop(-2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par17=new Paragraph(15);
        par17.setFont(font);
        par17.setSpacingAfter(4);
        //========
        String code_National="CODE NATIONAL";
        //========

        par17.add(new Phrase("13. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par17.add(Chunk.NEWLINE);
        par17.add("Convention de Bale.Annex 8(ou 9 s'il y a lieu) : ");
        par17.add("CONV. BALE");
        par17.add(Chunk.NEWLINE);
        par17.add("Code National(Catalogue Marocain des déchets) : ");
        par17.add(code_National);
        par17.add(Chunk.NEWLINE);
        par17.add("Code H : ");
        par17.add("CODE H");
        par17.add(Chunk.NEWLINE);
        par17.add("Code(s) des douanes (SH) : ");
        par17.add("CODE DES DOUANES");
        par17.add(Chunk.NEWLINE);
        par17.add("Autre (preciser) : ");
        par17.add("AUTRE");

        cell = new PdfPCell();
        cell.addElement(par17);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(4);
        //=======
        String operation = ns.getOperation();

        //=======
        par18.add(new Phrase("10. Opération d'élimination/valorisation",fontbold));
        par18.add(Chunk.NEWLINE);
        par18.add("Code D (1)  / R (2) : ");
        par18.add(operation);

        cell = new PdfPCell();
        cell.addElement(par18);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par19=new Paragraph(13);
        par19.setFont(font);
        par19.setSpacingAfter(4);
        //=======

        String nom_declaration="NOM DECLARATION";
        String date_declaration="DATE DECLARATION";
        String signature_declaration="SIGNATURE declaration";
        //=======

        par19.add(new Phrase("14. Déclaration de l'importateur / producteur  : ",fontbold));

        par19.add(Chunk.NEWLINE);
        par19.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement des déchets sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises notamment l'assurance de transport des déchets dangereuses.");
        par19.add(Chunk.NEWLINE);

        par19.add("Nom : ");
        par19.add(nom_declaration);
        par19.add(new Chunk(glue));
        par19.add("Date : ");
        par19.add(date_declaration);
        par19.add(new Chunk(glue));
        par19.add("Signature : ");
        par19.add(signature_declaration);
        par19.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par19);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par20=new Paragraph(12);
        par20.setFont(font);
        par20.setSpacingAfter(4);
        //=======
        String expedition_nom=ns.getExpedition()==null?"NOM expedition":ns.getExpedition();
        String expedition_date= "DATE expedition";
        String expedition_signature="SIGNATURE expedition";
        //=======

        par20.add(new Phrase("15. Expédition reçue l’installation de valorisation/élimination : ",fontbold));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom : ");
        par20.add(expedition_nom);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(expedition_date);
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(expedition_signature);
        par20.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par20);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par21=new Paragraph(12);
        par21.setSpacingAfter(4);
        cell.setPaddingTop(-10.0f);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("A REMPLIR PAR L'INSTALLATION D'ELIMINATION / VALORISATION",fontbold));

        cell = new PdfPCell();
        cell.addElement(par21);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par22=new Paragraph(12);
        par22.setFont(font);
        par22.setSpacingAfter(4);
        //========
        String date_reception=ns.getDateD();
        String date_approx_elim_ou_val=ns.getDateF();
        String nom_entreprise="NOM ENTREPRISE";
        String date_entreprise="DATE";
        String signature_entreprise="SIGNATURE ENTREPRISE";
        //========

        par22.add(new Phrase("16. Expédition reçue à l'installation d'élimination ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("ou",fontbold));
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("de valorisation (2):   ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Date de reception : ");
        par22.add(date_reception);
        par22.add(Chunk.TABBING);
        par22.add("Acceptée : ");
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add("Rejetée* : ");
        par22.add(checkedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Quantité reçue : ");
        par22.add("Tonnes : ");
        par22.add(quantite_en_tonne);
        par22.add(Chunk.TABBING);
        par22.add("m3 : ");
        par22.add(quantite_en_m3);
        par22.add(Chunk.NEWLINE);
        par22.add("* contacter immédiatement les autorités compétentes");
        par22.add(Chunk.NEWLINE);

        par22.add("Date approximative d'élimination/valorisation :");
        par22.add(date_approx_elim_ou_val);
        par22.add(Chunk.NEWLINE);

        par22.add("Opération d'élimination/valorisation (1 et 2) :");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom : ");
        par22.add(nom_entreprise);
        par22.add(Chunk.NEWLINE);

        par22.add("Date : ");
        par22.add(date_entreprise);
        par22.add(Chunk.NEWLINE);

        par22.add("Signature : ");
        par22.add(signature_entreprise);
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
        //========
        String nom_17=ns.getEliminateur()==null?"NOM":ns.getEliminateur().getNom_fr();
        String date_17="2020/12/32";
        String signature_17="SIGNATURE";
        //========

        par23.add(new Phrase("17. Je soussigné certifie que l'élimination/la valorisation des déchets décrits ci-dessus a été effectuée.",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Nom : ");
        par23.add(nom_17);
        par23.add(Chunk.NEWLINE);

        par23.add("Date : ");
        par23.add(date_17);
        par23.add(Chunk.NEWLINE);

        par23.add("Signature et cachet : ");
        par23.add(signature_17);
        par23.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //empty Cell

        cell = new PdfPCell(new Phrase("\n"));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(6);
        table.addCell(cell);



        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add(new Phrase("18. Zone Franche d’importation ou Bureau de douane d’entrée",fontbold));
        par24.add(Chunk.NEWLINE);
        par24.add("Les déchets décrits dans ce document de mouvement ont quitté la Zone Franche le : ");
        par24.add(Chunk.NEWLINE);
        par24.add("Signature : ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);
        par24.add("Cachet : ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);


        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }


    public static ByteArrayInputStream generate9arar() throws DocumentException {

        String IMAGE = "resources/images/berlin2013.jpg";
        String DEST = "results/images/background_transparent.pdf";

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(Font.FontFamily.TIMES_ROMAN,14.0f);
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());


        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }


}
