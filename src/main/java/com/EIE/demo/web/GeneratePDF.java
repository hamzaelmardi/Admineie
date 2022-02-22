package com.EIE.demo.web;

import com.EIE.demo.model.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.springframework.beans.factory.annotation.Value;
/*import com.spire.pdf.PdfDocument;
import com.sun.javafx.binding.StringFormatter;
import com.spire.pdf.*;*/
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;


public class GeneratePDF {


    // fonction pour changer la direction du texte séparé par des espaces
	static String RTL_LTR(String Nom_Fr){
		String[] str = Nom_Fr.split(" ");
        String[] str2 = Nom_Fr.split(" ");
        for(int i=1; i<=str.length; i++)
        	str2[i-1] = str[str.length-i];
	    return String.join(" ", str2);
	}



    private static void addFooter(PdfWriter writer, Image img){

        //DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        PdfPTable footer = new PdfPTable(1);
        // set defaults
        footer.setWidthPercentage(100);
        footer.setTotalWidth(800);
        footer.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        footer.setLockedWidth(true);
        footer.getDefaultCell().setFixedHeight(90);

        // add copyright
        footer.addCell(img);
       /* PdfPCell cell = new PdfPCell();
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);

        cell.addElement(new Phrase("Date Impression : "+String.valueOf(dateFormat.format(new Date()))));
        cell.setPaddingRight(40);
        footer.addCell(cell);*/
        // write page
        PdfContentByte canvas = writer.getDirectContent();
        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
        footer.writeSelectedRows(0, -1, 34, 90, canvas);
        canvas.endMarkedContentSequence();
    }
    private static void addFooterTransit(PdfWriter writer, Image img){

        //DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        PdfPTable footer = new PdfPTable(1);
        // set defaults
        footer.setWidthPercentage(100);
        footer.setTotalWidth(800);
        footer.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        footer.setLockedWidth(true);
        footer.setHorizontalAlignment(Element.ALIGN_RIGHT);
        footer.getDefaultCell().setFixedHeight(90);

        // add copyright
        footer.addCell(img);
       /* PdfPCell cell = new PdfPCell();
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);

        cell.addElement(new Phrase("Date Impression : "+String.valueOf(dateFormat.format(new Date()))));
        cell.setPaddingRight(40);
        footer.addCell(cell);*/
        // write page
        PdfContentByte canvas = writer.getDirectContent();
        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
        footer.writeSelectedRows(0, -1, 480, 90, canvas);
        canvas.endMarkedContentSequence();
    }
    private static void addFooterDetail(PdfWriter writer){

        Font fontFooter=new Font(Font.FontFamily.TIMES_ROMAN,8);

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException | DocumentException e) {
            e.printStackTrace();
        }

        Font fontAr = new Font(base, 8.0f);

        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        PdfPTable footer = new PdfPTable(3);
        footer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        // set defaults
        footer.setWidthPercentage(90);
        footer.setTotalWidth(550);
        footer.setLockedWidth(true);

        PdfPCell cells = new PdfPCell();
        Paragraph pf = new Paragraph();
        pf.setFont(fontFooter);
        cells.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cells.setColspan(3);
        pf.setAlignment(Element.ALIGN_LEFT);
        cells.setBorder(Rectangle.NO_BORDER);
        pf.add("Document généré depuis le portail https://e-services.environnement.gov.ma le "+dateFormat.format(new Date()));
        cells.addElement(pf);
        cells.setPaddingBottom(10);
        footer.addCell(cells);

        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.TOP);
        cell.addElement(new Phrase("9, Avenue Al Araar, Secteur 16, Hay Riad - Rabat\nTél: 0537 570 470    Fax: 537 570 472",fontFooter));

        PdfPCell cell1 = new PdfPCell();
        Paragraph p = new Paragraph();
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell1.setBorder(Rectangle.TOP);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        p.add(new Phrase("www.environnement.gov.ma", fontFooter));
        p.setAlignment(Element.ALIGN_CENTER);
        cell1.addElement(p);

        PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.TOP);
        cell2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell2.addElement(new Phrase("9 شارع العرعار، قطاع 16، حي الرياض - الرباط\n"+"الهاتف : 0537570470 " + "الفاكس : 0537570472 ",fontAr));

        // add copyright
        footer.addCell(cell2);
        footer.addCell(cell1);
        footer.addCell(cell);

       /* PdfPCell cell = new PdfPCell();
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);

        cell.addElement(new Phrase("Date Impression : "+String.valueOf(dateFormat.format(new Date()))));
        cell.setPaddingRight(40);
        footer.addCell(cell);*/
        // write page
        PdfContentByte canvas = writer.getDirectContent();
        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
        footer.writeSelectedRows(0, -1, 25, 90, canvas);
        canvas.endMarkedContentSequence();
    }

    private static void pageNumber(PdfWriter writer , String pageNumber){

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException | DocumentException e) {
            e.printStackTrace();
        }

        Font font = new Font(base, 8.0f);

        //DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        PdfPTable footer = new PdfPTable(1);
        // set defaults
        footer.setWidthPercentage(90);
        footer.setTotalWidth(550);
        footer.setLockedWidth(true);

        PdfPCell cellpage = new PdfPCell();
        Paragraph page = new Paragraph();
        cellpage.setBorder(Rectangle.NO_BORDER);
        cellpage.setHorizontalAlignment(Element.ALIGN_CENTER);
        page.add(new Phrase(pageNumber, font));
        page.setAlignment(Element.ALIGN_CENTER);
        cellpage.addElement(page);

        // add copyright
        footer.addCell(cellpage);

       /* PdfPCell cell = new PdfPCell();
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);

        cell.addElement(new Phrase("Date Impression : "+String.valueOf(dateFormat.format(new Date()))));
        cell.setPaddingRight(40);
        footer.addCell(cell);*/
        // write page
        PdfContentByte canvas = writer.getDirectContent();
        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
        footer.writeSelectedRows(0, -1, 25, 30, canvas);
        canvas.endMarkedContentSequence();
    }
    private static void addFooterCT_IT(PdfWriter writer, Image img){

        //DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        PdfPTable footer = new PdfPTable(1);
        // set defaults
        footer.setWidthPercentage(90);
        footer.setTotalWidth(550);
        footer.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        footer.setLockedWidth(true);
        footer.getDefaultCell().setFixedHeight(90);

        // add copyright
        footer.addCell(img);
       /* PdfPCell cell = new PdfPCell();
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setBorder(Rectangle.NO_BORDER);

        cell.addElement(new Phrase("Date Impression : "+String.valueOf(dateFormat.format(new Date()))));
        cell.setPaddingRight(40);
        footer.addCell(cell);*/
        // write page
        PdfContentByte canvas = writer.getDirectContent();
        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
        footer.writeSelectedRows(0, -1, 480, 200, canvas);
        canvas.endMarkedContentSequence();
    }



    public static ByteArrayInputStream generateDocumentDeMouvement(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
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
        headerPar.add(new Phrase("Document de mouvements des déchets dangereux pour mouvement /transferts transfrontières de déchets.",fontH1));
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
        String numero_notification=ns.getNum_notification().equals("")?"":ns.getNum_notification();
        String numero_serie=(ns.getSerie()==null||ns.getSerie().equals(""))?"":ns.getSerie();
        //=========
        PdfPCell cell=new PdfPCell();
        cell.addElement(new Phrase("1. Correspondant à la notification No. : "+numero_notification,fontbold));
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        cell=new PdfPCell();
        cell.addElement(new Phrase("2. Numéro de série du transfert/nombre total /"+numero_serie+" transfert: ",fontbold));
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par02=new Paragraph();
        par02.setFont(font);
        par02.setSpacingAfter(3);
        //========
        String nom_importateur = "";
        String adresse_importateur = "";
        String persone_a_contacte_importateur ="";
        String tele_importateur = "";
        String fax_importateur = "";
        String email_importateur = " ";

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

        par02.add(new Phrase("3. Exportateur – Notifiant ",fontbold));
        par02.add("N° d'enregistrement :  ");
        par02.add(Chunk.NEWLINE);

        par02.add("Nom : ");
//        par1.add("NOM");
        par02.add(ns.getNom());
        par02.add(Chunk.NEWLINE);

        par02.add("Adresse : ");
        par02.add(ns.getAdresse());
//        par1.add("ADRESSE");
        par02.add(Chunk.NEWLINE);

        par02.add("Personne a contacter : ");
        par02.add(ns.getPersonne());
        par02.add(Chunk.NEWLINE);

        par02.add("Tél : ");
        par02.add(ns.getTel());
//        par1.add("TELEPHONE");
        par02.add(Chunk.NEWLINE);

        par02.add("Télécopie : ");
        par02.add(ns.getTelecopie());
//        par1.add("FAX");
        par02.add(Chunk.NEWLINE);

        par02.add("Courier éléctronique : ");
        par02.add(ns.getCourrier());
//        par1.add("MAIL");
        par02.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par02);
        cell.setPadding(3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par2=new Paragraph();
        par2.setFont(font);
        par2.setSpacingAfter(3);
        //========

        par2.add(new Phrase("4. Importateur – destinataire ",fontbold));
        par2.add("N° d'enregistrement :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("Nom : ");
        par2.add(nom_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Adresse : ");
        par2.add(adresse_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Personne à contacter : ");
        par2.add(persone_a_contacte_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Tél : ");
        par2.add(tele_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Télécopie : ");
        par2.add(fax_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Courrier électronique : ");
        par2.add(email_importateur);
        par2.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par2);
        cell.setPadding(3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par3=new Paragraph();
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
        par3.add(new Phrase("5. Quantité réelle : ",fontbold));
        par3.add(new Phrase(quantite_en_tonne+" "+unite,font));
        par3.add(Chunk.TABBING);

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par4=new Paragraph();
        par4.setFont(font);
        par4.setSpacingAfter(5);
        //========
        String date_reelle_expedition="-- / -- / --";

        if(ns.getDate_reel()!=null){
            date_reelle_expedition =  df.format(ns.getDate_reel());
        }

        //========

        par4.add(new Phrase("6. Date réelle du transfert : ",fontbold));
        par4.add(date_reelle_expedition);

        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(3);
        //========
        String condit_type="";//ns.getConditionement()==null?"Types":ns.getConditionement();
        String nombre_colis="0";
        if(ns.getTypeconditionnement()!=null){
            condit_type = ns.getTypeconditionnement().getNom_fr();
            nombre_colis = ns.getNbr_colis();
        }
        boolean isprescription=true;//ns.getPrescription().equalsIgnoreCase("oui");

        //========
        par5.add(new Phrase("7. Conditionnement",fontbold));
        par5.add(Chunk.TABBING);
        par5.add("Type(s)  (1) : ");
        par5.add(condit_type);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add("Nombre de colis :");
        par5.add(nombre_colis);
        par5.add(Chunk.NEWLINE);
        par5.add(new Phrase("Prescriptions particulières de manutention (2) :",fontbold));
        par5.add(Chunk.TABBING);
        par5.add(oui);
        par5.add(uncheckedChunk);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add(non);
        par5.add(uncheckedChunk);

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
        String nom_transporteur1 ="";
        String adresse_transporteur1 ="";
        String persone_a_contacte_transporteur1 ="";
        String tele_transporteur1 ="";
        String fax_transporteur1 ="";
        String email_transporteur1 ="";

        if(ns.getTransporteurOne()!=null){
            Transporteur ww = ns.getTransporteurOne();
            nom_transporteur1 = ww.getNom_fr();
            adresse_transporteur1 =ww.getAdresse_fr();
            tele_transporteur1 =ww.getTel();
            fax_transporteur1 =ww.getFax();
            email_transporteur1 =ww.getMail();
        }
        //========

        //Paragraph ====
        Paragraph par9=new Paragraph();
        par9.setSpacingAfter(4);
        par9.add(new Phrase(" - - - - - - A remplir par le représentant du transporteur - - - - - -",fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        par9.add(Chunk.TABBING);
        par9.add(Chunk.TABBING);
        par9.add(new Phrase("Plus de trois transporteurs(2) ",font));
        par9.add(uncheckedChunk);


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
        String signature1="";
        //========

        par10.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add("Date de la prise en charge : ");
        par10.add(date_prise_charge1);
        par10.add(Chunk.NEWLINE);
        par10.add("Signature : ");
        par10.add(signature1);

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(4);
        //========
        String date_prise_charge2=ns.getTransporteurOne()!=null?df.format(ns.getTransporteurOne().getDate_pris_charge()):"";
        String signature2="";
        //========

        par11.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add("Date de la prise en charge : ");
        par11.add(date_prise_charge2);
        par11.add(Chunk.NEWLINE);
        par11.add("Signature : ");
        par11.add(signature2);

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par12=new Paragraph(12);
        par12.setFont(font);
        par12.setSpacingAfter(4);
        //========
        String date_prise_charge3=ns.getTransporteurOne()!=null?df.format(ns.getTransporteurOne().getDate_pris_charge()):"";
        String signature3="";
        //========

        par12.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par12.add(Chunk.NEWLINE);
        par12.add("Date de la prise en charge : ");
        par12.add(date_prise_charge3);
        par12.add(Chunk.NEWLINE);
        par12.add("Signature : ");
        par12.add(signature3);

        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par13=new Paragraph(12);
        par13.setFont(font);
        par13.setSpacingAfter(4);
        //=======
        String nom_producteur ="";
        String adresse_producteur ="";
        String persone_a_contacte_producteur =" ";
        String tele_producteur ="";
        String fax_producteur ="";
        String email_producteur ="";
        String lieu_production ="";

        if(ns.getProducteur()!=null){
            nom_producteur =ns.getProducteur().getNom_fr();
            adresse_producteur =ns.getProducteur().getAdresse_fr();
            tele_producteur =ns.getProducteur().getTel();
            fax_producteur =ns.getProducteur().getFax();
            email_producteur =ns.getProducteur().getMail();
            lieu_production =ns.getProducteur().getLieu_fr();
        }
        //=======

        par13.add(new Phrase("9. Producteur(s) des déchets (4) (5) (6) ",fontbold));
        par13.add("N° d'enregistrement : ");
        par13.add("");
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

        par13.add("Tél : ");
        par13.add(tele_producteur);
        par13.add(Chunk.TABBING);

        par13.add("Télécopie : ");
        par13.add(fax_producteur);
        par13.add(Chunk.TABBING);
        par13.add(Chunk.NEWLINE);

        par13.add("Courier éléctronique : ");
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

        par14.add(new Phrase("12. Dénomination et composition des déchets  : ",fontbold));
        par14.add(denomination_dechets);
        par14.add(Chunk.NEWLINE);

        par14.add("Composition :");
        par14.add(Chunk.NEWLINE);


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

        par15.add(new Phrase("13. Caractéristiques physiques (1) :",fontbold));
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

        par16.add(new Phrase("10. Installation d'élimination :  ",fontbold));
        par16.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("ou",fontbold));
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("de valorisation (2):   ",fontbold));
        par16.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.NEWLINE);

        par16.add("N° d'enregistrement : ");
        par16.add("");
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

        par16.add("Télécopie : ");
        par16.add(fax_producteur);
        par16.add(Chunk.TABBING);
        par16.add(Chunk.NEWLINE);

        par16.add("Courier électronique : ");
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

        par17.add(new Phrase("14. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par17.add(Chunk.NEWLINE);
        par17.add("i) Convention de Bale.Annex 8(ou 9 s'il y a lieu) : B3140");
        par17.add(Chunk.NEWLINE);
        par17.add("ii) CODE. OCDE [si différent fe i)]");
        par17.add(Chunk.NEWLINE);
        par17.add("iii) Liste des déchets de la CE : 16 01 03");
        par17.add(Chunk.NEWLINE);
        par17.add("iv) Code national dans le pays d'éxportation : 16 01 03");
        /*par17.add(Chunk.NEWLINE);
        par17.add("iv) Code national dans le pays d'importation : 16 01 03");*/
        par17.add(Chunk.NEWLINE);
        par17.add("v) Code National(Catalogue Marocain des déchets) : ");
        par17.add(code_National);
        par17.add(Chunk.NEWLINE);
        par17.add("vi) Autres(préciser) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("vii) CODE Y : -");
        par17.add(Chunk.NEWLINE);
        par17.add("viii) CODE H(1) : -");
        par17.add(Chunk.NEWLINE);
        par17.add("ix) Classe ONU (1) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("x) N° d'identification : ");
        par17.add(Chunk.NEWLINE);
        par17.add("xi) Dénomination ONU : ");
        par17.add(Chunk.NEWLINE);
        par17.add("xii) Code(s) des douane(s) (SH) : 40004 00 00");

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
        par18.add(new Phrase("11. Opération d'élimination/valorisation",fontbold));
        par18.add(Chunk.NEWLINE);
        par18.add("Code D/ R (1) : R1");
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

        String nom_declaration="";
        String date_declaration="";
        String signature_declaration="";
        //=======

        par19.add(new Phrase("15. Déclaration de l'importateur / producteur  : ",fontbold));

        par19.add(Chunk.NEWLINE);
        par19.add("    Je soussigné certifie que les renseignements  portés dans les cases ci-dessus sont exacts et établis de bonne foi." +
                " Je certifie également que le obligation contactuelles écrites prévues pour la réglementation ont été remplis, que le mouvement transfrontière est couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises et que toutes les autorisation requises ont été recues des autorités compétentes des pays concernés.");
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
        par19.add(Chunk.NEWLINE);

        par19.add(new Phrase("A remplir par toute personne impliqué dans le mouvement transfrontière s'il y a lieu de fournir d'autres renseignement :",fontbold));
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
        String expedition_nom=ns.getExpedition()==null?"":ns.getExpedition();
        String expedition_date= "";
        String expedition_signature="";
        //=======

        par20.add(new Phrase("16. Transfet reçu par l'importateur - le destinataire (autre qu'une installation): ",fontbold));
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
        String nom_entreprise="";
        String date_entreprise="";
        String signature_entreprise="";
        //========

        par22.add(new Phrase("17. Transfert reçu à l'installation d'élimination ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("ou de valorisation :   ",fontbold));
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

        par22.add("Opération d'élimination - valorisation (1) :");
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

        par23.add(new Phrase("18. Je soussigné certifie que l'élimination/la valorisation des déchets décrits ci-dessus a été effectuée.",fontbold));
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

        par24.add("(1) Voir les codes dans la liste des abréviations et codes ci-jointes .");
        par24.add(Chunk.NEWLINE);
        par24.add("(2) Joindre des renseignement plus détaillés s'il a lieu . ");
        par24.add(Chunk.NEWLINE);
        par24.add("(3) S'il y a plus de trois transporteurs , joindre renseignements prévus aux cases 8 a,b,c ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par25=new Paragraph(12);
        par25.setFont(font);
        par25.setSpacingAfter(4);

        par25.add("(4) Requis par la convention de Bale .");
        par25.add(Chunk.NEWLINE);
        par25.add("(5) Joindre une liste s'il y a plusieurs producteurs . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(6) Si la légalisation nationale l'exige ");
        par25.add(Chunk.NEWLINE);
        par25.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par25);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);


        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentImportationDechet(DocumentImportationDechet d,Notification nt,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,13,Font.BOLD);
        Font fontBox = new Font(base, 10f);
        Font fontBox2 = new Font(base2, 10f);

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox2);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox2);

        String logo =d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(560,500);
        document.add(image);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(""));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        document.add(par1);

        PdfPTable table5 = new PdfPTable(2);
        table5.setWidthPercentage(100);
        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        PdfPCell cell = new PdfPCell();
        Paragraph par2= new Paragraph();
        if(nt.getClassification().getId_classification()==2) {
            par2.add(new Phrase(d.getTitle(),fontbold));
        }
        if(nt.getClassification().getId_classification()==1) {
            par2.add(new Phrase(d.getTitle2(),fontbold));
        }
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.setSpacingAfter(5);
        cell.setColspan(2);
        cell.addElement(par2);
        cell.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell.setPadding(15);

        PdfPCell cell2 = new PdfPCell();
        Paragraph par3= new Paragraph();
        par3.setSpacingAfter(5);
        cell2.setColspan(2);
        par3.add(new Phrase(d.getP1(),fontbold));
        par3.setAlignment(Element.ALIGN_CENTER);
        cell2.addElement(par3);
        cell2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell2.setPadding(5);

        PdfPCell cell3 = new PdfPCell();
        Paragraph par4= new Paragraph();
        String nomFr = nt.getImportateur().getNom_fr() != null ? nt.getImportateur().getNom_fr() : "";
        String Adresse = nt.getImportateur().getAdresse_fr() != null ? nt.getImportateur().getAdresse_fr() : "";
        String Tel = nt.getImportateur().getFax()!= null ? nt.getImportateur().getFax() + " / " + nt.getImportateur().getTel() : "";
        String Mail = nt.getImportateur().getMail() != null ? nt.getImportateur().getMail() : "";

        cell3.setColspan(2);
        par4.add(new Phrase(d.getNomSociete()+":  "+nomFr,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getAdresse()+":  "+Adresse,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getTel()+":  "+Tel,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getEmail()+":  "+Mail,fontBox));
        par4.setAlignment(Element.ALIGN_LEFT);
        cell3.addElement(par4);
        cell3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell3.setPadding(5);

        PdfPCell cell4 = new PdfPCell();
        Paragraph par5= new Paragraph();
        par5.setSpacingAfter(5);
        cell4.setColspan(2);
        par5.add(new Phrase(d.getP3(),fontbold));
        par5.setAlignment(Element.ALIGN_CENTER);
        cell4.addElement(par5);
        cell4.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell4.setPadding(5);

        PdfPCell cell5 = new PdfPCell();
        Paragraph par6= new Paragraph();
        par6.setSpacingAfter(5);
        cell5.setColspan(2);
        String NomAr = nt.getCode().getNom_ar() != null ? nt.getCode().getNom_ar() : "";
        String txt = nt.getProducteur_text()!= null ? nt.getProducteur_text(): "";
        String Nom_FR = nt.getCode().getNom_fr()!= null ? nt.getCode().getNom_fr() : "";
        String qte = nt.getQuantite()!= null ? nt.getQuantite():" " ;
        String unite =nt.getUnite().getNom_ar()!= null ? nt.getUnite().getNom_ar(): "";

        //StringBuilder sb=new StringBuilder(Nom_FR);
        //sb.reverse();
        par6.add(new Phrase(d.getNumero()+":  "+nt.getNum_notification(),fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getType()+":  "+ NomAr,fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getSource()+":  "+txt,fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getCode()+":  "+ RTL_LTR(Nom_FR),fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getQuantite()+":  "+qte+" "+unite,fontBox));
        par6.setAlignment(Element.ALIGN_LEFT);
        cell5.addElement(par6);
        cell5.setPadding(5);

        PdfPCell cell6 = new PdfPCell();
        cell6.setColspan(2);
        cell6.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        Paragraph par7= new Paragraph();
        par7.setSpacingAfter(5);
        cell6.setColspan(2);
        par7.add(new Phrase(d.getP6(),fontbold));
        par7.setAlignment(Element.ALIGN_CENTER);
        cell6.addElement(par7);
        cell6.setPadding(5);

        PdfPCell cell7 = new PdfPCell();
        Paragraph par8= new Paragraph();
        par8.setSpacingAfter(5);
        cell7.setColspan(2);
        if(nt.getClassification().getId_classification()==2) {
            String tr=nt.getTransporteur_etranger().size()> 0 ? nt.getTransporteur_etranger().get(0).getRaison_social(): "" ;
            String pt =nt.getTransporteur_etranger().size()>0 ?nt.getTransporteur_etranger().get(0).getNum_matricule() : "" ;
            par8.add(new Phrase(d.getNomtr()+":  "+tr,fontBox));
            par8.add(Chunk.NEWLINE);
            par8.add(new Phrase(d.getPattente()+" test:  "+(pt==null?"":pt),fontBox));
        }
        if(nt.getClassification().getId_classification()==1) {
        	  String tr=nt.getTransporteur().size()> 0 ? nt.getTransporteur().get(0).getNom(): "" ;
              String pt =nt.getTransporteur().size()>0 ? nt.getTransporteur().get(0).getNumero_autorisation() : "" ;
            par8.add(new Phrase(d.getNomtr()+":  "+tr,fontBox));
            par8.add(Chunk.NEWLINE);
            par8.add(new Phrase(d.getPattente()+":  "+(pt==null?"":pt),fontBox));
        }
        par8.add(Chunk.NEWLINE);
        par8.setAlignment(Element.ALIGN_LEFT);
        cell7.addElement(par8);
        cell7.setPadding(5);

        PdfPCell cell8 = new PdfPCell();
        Paragraph par9= new Paragraph();
        par9.setSpacingAfter(5);
        cell8.setColspan(2);
        par9.add(new Phrase(d.getP8(),fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        cell8.addElement(par9);
        cell8.setPadding(5);

        String nom=nt.getEliminateur().getNom_fr() == null ? "" : nt.getEliminateur().getNom_fr();
        String adresse=nt.getEliminateur().getAdresse_fr() == null ? "" : nt.getEliminateur().getAdresse_fr();
        String tel=nt.getEliminateur().getTel() == null ? "" : nt.getEliminateur().getTel();
        String pattente=nt.getEliminateur().getPattente() == null ? "" : nt.getEliminateur().getPattente();

        PdfPCell cell9a = new PdfPCell();
        Paragraph par10a= new Paragraph();
        par10a.setSpacingAfter(5);
        par10a.add(new Phrase(d.getNom()+":  "+nom,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getPattente()+":  "+pattente,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getAdresse()+":  "+adresse,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getTel()+": "+tel,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getType()+":  ",fontBox));
        par10a.add(new Phrase(d.getTatmin()+"  ",fontBox));
        par10a.add(new Phrase(nt.getOperation().equalsIgnoreCase("valorisation")?checkedChunk:uncheckedChunk));
        par10a.add(Chunk.TABBING);
        par10a.add(new Phrase(d.getMo3alaja()+"  ",fontBox));
        par10a.add(new Phrase(nt.getOperation().equalsIgnoreCase("traitement")?checkedChunk:uncheckedChunk));
        par10a.add(Chunk.NEWLINE);
        par10a.setAlignment(Element.ALIGN_LEFT);
        cell9a.addElement(par10a);
        cell9a.setColspan(2);
        cell9a.setPadding(5);


        PdfPCell cell010 = new PdfPCell();
        cell010.setColspan(2);
        cell010.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        Paragraph par11= new Paragraph();
        par11.setSpacingAfter(5);
        String comment=nt.getCommentaire() == null ? "" : nt.getCommentaire();
        par11.add(new Phrase(nt.getStatut().getId_statut_projet()!=40?d.getStAccepte()+" "+d.getNumero()+"  "+nt.getNum_notification()+"  لشركة  " +nomFr:d.getStRefuse(),fontBox));
        par11.add(Chunk.NEWLINE);
        par11.add(new Phrase(nt.getStatut().getId_statut_projet()==40?d.getComment()+":  "+comment:"",fontBox));
        par11.add(Chunk.NEWLINE);
        if(nt.getStatut().getId_statut_projet()!=40) {
            par11.add(new Phrase(d.getTemps() + ":                                    ", fontBox));
            par11.add(new Phrase("  " + d.getIla() + ":                                 ", fontBox));
        }
        par11.setAlignment(Element.ALIGN_LEFT);
        par11.add(Chunk.NEWLINE);
        cell010.addElement(par11);
        cell010.setPadding(5);
        par11.add(Chunk.NEWLINE);
        Paragraph par13= new Paragraph();
        par13.add(new Phrase(d.getSigne(),fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        cell010.setPaddingLeft(50);
        par13.setAlignment(Element.ALIGN_CENTER);
        cell010.addElement(par13);

        String num_notification = nt.getNum_notification() != null ? nt.getNum_notification() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+nt.getId_notification()+"/"+nt.getZf_et()+"/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);



        table5.addCell(cell);

        table5.addCell(cell2);

        table5.addCell(cell3);

        table5.addCell(cell4);

        table5.addCell(cell5);

        table5.addCell(cell6);

        table5.addCell(cell7);

        table5.addCell(cell8);

        table5.addCell(cell9a);


        table5.addCell(cell010);

        document.add(table5);

        addFooter(writer,codeQrImage);



        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentImportationDechetND(DocumentDechetND d,Notification nt,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,9,Font.BOLD);
        Font fontBox = new Font(base, 11f);
        Font fontBox2 = new Font(base2, 10f);

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox2);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox2);

        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(560,500);
        document.add(image);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(""));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);
        document.add(par1);

        PdfPTable table5 = new PdfPTable(2);
        table5.setWidthPercentage(95);
        table5.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);

        PdfPCell cell = new PdfPCell();
        Paragraph par2= new Paragraph();
        par2.add(new Phrase(d.getTitle(),fontbold));
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.setSpacingAfter(5);
        cell.setColspan(2);
        cell.addElement(par2);
        cell.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell.setPadding(5);

        PdfPCell cell2 = new PdfPCell();
        Paragraph par3= new Paragraph();
        par3.setSpacingAfter(5);
        cell2.setColspan(2);
        par3.add(new Phrase(d.getP1(),fontbold));
        par3.setAlignment(Element.ALIGN_CENTER);
        cell2.addElement(par3);
        cell2.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell2.setPadding(5);

        PdfPCell cell3 = new PdfPCell();
        Paragraph par4= new Paragraph();
        String nomFr = nt.getImportateur().getNom_fr() != null ? nt.getImportateur().getNom_fr() : "";
        String Adresse = nt.getImportateur().getAdresse_fr() != null ? nt.getImportateur().getAdresse_fr() : "";
        String Tel = nt.getImportateur().getFax()!= null ? nt.getImportateur().getFax() + " / " + nt.getImportateur().getTel() : "";
        String Mail = nt.getImportateur().getMail() != null ? nt.getImportateur().getMail() : "";

        cell3.setColspan(2);
        par4.add(new Phrase(d.getNomSociete()+":  "+nomFr,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getAdresse()+":  "+Adresse,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getTel()+":  "+RTL_LTR(Tel),fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getEmail()+":  "+Mail,fontBox));
        par4.setAlignment(Element.ALIGN_LEFT);
        cell3.addElement(par4);
        cell3.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell3.setPadding(5);

        PdfPCell cell4 = new PdfPCell();
        Paragraph par5= new Paragraph();
        par5.setSpacingAfter(5);
        cell4.setColspan(2);
        par5.add(new Phrase(d.getP3(),fontbold));
        par5.setAlignment(Element.ALIGN_CENTER);
        cell4.addElement(par5);
        cell4.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell4.setPadding(5);

        PdfPCell cell5 = new PdfPCell();
        Paragraph par6= new Paragraph();
        par6.setSpacingAfter(5);
        cell5.setColspan(2);
        String NomAr = nt.getCode().getNom_ar() != null ? nt.getCode().getNom_ar() : "";
        String txt = nt.getNum_notification()!= null ? nt.getNum_notification(): "";
        String Nom_FR = nt.getCode().getNom_fr()!= null ? nt.getCode().getNom_fr() : "";
        String qte = nt.getQuantite()!= null ? nt.getQuantite():" " ;
        String unite =nt.getUnite().getNom_ar()!= null ? nt.getUnite().getNom_ar(): "";
        //StringBuilder sb=new StringBuilder('('+Nom_FR+')');


        par6.add(new Phrase(d.getSource()+":  ",fontBox));
        par6.add(new Phrase(txt,fontbold));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getType()+":  "+ NomAr,fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getCode()+":  "+RTL_LTR(Nom_FR),fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getQuantite()+":  "+qte+" "+unite,fontBox));
        par6.setAlignment(Element.ALIGN_LEFT);
        cell5.addElement(par6);
        cell5.setPadding(5);

        PdfPCell cell6 = new PdfPCell();
        Paragraph par7= new Paragraph();
        par7.setSpacingAfter(5);
        cell6.setColspan(2);
        par7.add(new Phrase(d.getTitre(),fontbold));
        par7.setAlignment(Element.ALIGN_CENTER);
        cell6.addElement(par7);
        cell6.setPadding(5);

        PdfPCell cell9 = new PdfPCell();
        Paragraph par10= new Paragraph();
        par10.setSpacingAfter(5);
        cell9.setColspan(2);
        String nom=nt.getEliminateur().getNom_fr() == null ? "" : nt.getEliminateur().getNom_fr();
        String adresse=nt.getEliminateur().getAdresse_fr() == null ? "" : nt.getEliminateur().getAdresse_fr();
        String tel=nt.getEliminateur().getTel() == null ? "" : nt.getEliminateur().getTel();
        //tel=RTL_LTR(tel);
        String pattente=nt.getEliminateur().getPattente() == null ? "" : nt.getEliminateur().getPattente();
        par10.add(new Phrase(d.getNom()+":  "+nom,fontBox));
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase(d.getAdresse()+":  "+adresse,fontBox));
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase(d.getTel()+": "+RTL_LTR(tel),fontBox));
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase("                      "+d.getTatmin()+"  ",fontBox));
        par10.add(new Phrase(nt.getOperation().equalsIgnoreCase("valorisation") || nt.getOperation().equalsIgnoreCase("تقييم") ?checkedChunk:uncheckedChunk));
        par10.add(Chunk.TABBING);
        par10.add(new Phrase("  "+d.getMo3alaja()+"  ",fontBox));
        par10.add(new Phrase(nt.getOperation().equalsIgnoreCase("traitement") || nt.getOperation().equalsIgnoreCase("معالجة")?checkedChunk:uncheckedChunk));
        par10.add(Chunk.NEWLINE);
        par10.setAlignment(Element.ALIGN_LEFT);
        cell9.addElement(par10);
        cell9.setPadding(5);

        PdfPCell cell4c = new PdfPCell();
        Paragraph par5c= new Paragraph();
        par5c.setSpacingAfter(5);
        cell4c.setColspan(2);
        par5c.add(new Phrase("Décision d’autorisation",fontbold));
        par5c.setAlignment(Element.ALIGN_CENTER);
        cell4c.addElement(par5c);
        cell4c.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        cell4c.setPadding(5);

        PdfPCell cell10 = new PdfPCell();
        cell10.setColspan(2);
        cell10.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        Paragraph par11= new Paragraph();
        par11.setSpacingAfter(5);
        String comment=nt.getCommentaire() == null ? "" : nt.getCommentaire();
        if(nt.getStatut().getId_statut_projet()==38){
            par11.add(new Phrase(d.getStAccepte()+" "+d.getNumero()+"  ",fontBox));
            par11.add(new Phrase(nt.getNum_notification(),fontbold));
            par11.add(new Phrase("  est accordée à la Société :   ",fontBox));
            par11.add(new Phrase(nomFr,fontbold));
            par11.add(Chunk.NEWLINE);
        }
        else{
            par11.add(new Phrase(d.getStRefuse()+" ",fontBox));
            par11.add(new Phrase(nt.getStatut().getId_statut_projet()!=38?checkedChunk:uncheckedChunk));
            par11.add(Chunk.NEWLINE);
            par11.add(new Phrase(nt.getStatut().getId_statut_projet()!=38?d.getComment()+":  "+comment:"",fontBox));
            par11.add(Chunk.NEWLINE);
        }
        if(nt.getStatut().getId_statut_projet()!=40) {
            par11.add(new Phrase(d.getTemps() + "                                    ", fontBox));
            par11.add(new Phrase("  " + d.getIla() + ":                                 ", fontBox));
        }
        par11.setAlignment(Element.ALIGN_LEFT);
        par11.add(Chunk.NEWLINE);
        cell10.addElement(par11);
        cell10.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell10.setPadding(5);
        par11.add(Chunk.NEWLINE);
        Paragraph par13= new Paragraph();
        par13.add(new Phrase(d.getSigne(),fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        cell10.setPaddingLeft(50);
        par13.setAlignment(Element.ALIGN_CENTER);
        cell10.addElement(par13);

        String num_notification = nt.getNum_notification() != null ? nt.getNum_notification() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+nt.getId_notification()+"/"+nt.getZf_et()+"/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);



        table5.addCell(cell);

        table5.addCell(cell2);

        table5.addCell(cell3);

        table5.addCell(cell4);

        table5.addCell(cell5);

        table5.addCell(cell6);

        table5.addCell(cell9);
        table5.addCell(cell4c);


        table5.addCell(cell10);

        document.add(table5);

        addFooter(writer,codeQrImage);


        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    /*  public static ByteArrayInputStream generateDocumentExportation(DocumentExportaltion d,Notification n) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,14,Font.BOLD);
        Font fontBox = new Font(base, 14f);

        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_CENTER);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(5);
        par0.add(Chunk.NEWLINE);
        par0.add(Chunk.NEWLINE);
        document.add(par0);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(d.getP1()+" ",fontbold));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);


        Paragraph par2= new Paragraph();
        String importeur = "...";
        if(n.getImportateur().getNom_fr() != null){
            importeur = n.getImportateur().getNom_fr();
        }
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.add(new Phrase(d.getP2()+" "+importeur+" ",fontbold));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);


        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        String quantite = "...";
        if(n.getQuantite() !=null){
            quantite = n.getQuantite();
        }
        String unite = "...";
        if(n.getUnite().getNom_fr() !=null){
            unite = n.getUnite().getNom_fr();
        }
        String classification = "...";
        if(n.getClassification().getNom_ar() !=null){
            classification = n.getClassification().getNom_ar();
        }
        par4.add(new Phrase(d.getP3()+" ",fontbold));
        par4.add(new Phrase(d.getP4()+" "+quantite+unite+" "+d.getP5()+" "+classification+" ",fontBox));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        cell.addElement(par4);


        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase(d.getP6()+" ",fontbold));
        String notification = "...";
        if(n.getNum_notification() != null){
            notification = n.getNum_notification();
        }
        par7.add(new Phrase(d.getP7()+" "+notification,fontBox));
        par7.setSpacingAfter(5);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        String date1 = "...";
        if(n.getDateaut1()!=null){
            date1 = dateFormat.format(n.getDateaut1());
        }
        String date2 = "...";
        if(n.getDateaut1()!=null){
            date2 = dateFormat.format(n.getDateaut1());
        }
        String importeur2 = "...";
        if(n.getImportateur().getNom_fr()!=null){
            importeur2 = n.getImportateur().getNom_fr();
        }
        String lieu = "...";
        if(n.getLieu()!=null){
            lieu = n.getLieu();
        }
        par8.add(new Phrase(d.getP8()+" "+date1+" "+d.getP1()+" "+ date2+ " "+d.getP10()+" "+ n.getImportateur().getNom_fr()+" "+ d.getP11()+" "+ importeur2+ " "+d.getP12()+ " "+classification+ " "+d.getP13()+ " "+quantite + unite +" "+ d.getP14() +" "+ classification +" "+ d.getP15()+" "+ importeur2+" "+ d.getP16()+" "+ lieu,fontBox));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);

        Paragraph par9= new Paragraph();
        par9.setAlignment(Element.ALIGN_LEFT);
        par9.add(new Phrase(d.getP17()+" "+ importeur2+" "+ d.getP9(),fontBox));
        par9.setSpacingAfter(5);
        par9.add(Chunk.NEWLINE);
        par9.add(Chunk.NEWLINE);
        cell.addElement(par9);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_CENTER);
        par10.add(new Phrase(d.getTitre()+" "+ importeur2,fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        table5.addCell(cell);
        document.add(table5);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentTransaction(DocumentTransaction d,Notification n) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,12.0f);
        Font fontbold=new Font(base,15,Font.BOLD);
        Font fontBox = new Font(base, 15.0f);

        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_LEFT);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(10);
        par0.add(Chunk.NEWLINE);
        par0.add(Chunk.NEWLINE);
        par0.add(Chunk.NEWLINE);
        cell.addElement(par0);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        String nom = "...";
        if(n.getImportateur().getNom_fr()!=null){
            nom = n.getImportateur().getNom_fr();
        }
        par1.add(new Phrase(d.getP1()+ nom,fontbold));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);

        cell.addElement(par1);

        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_LEFT);
        par2.add(new Phrase(d.getP2()+" ",fontbold));
        par2.add(new Phrase(d.getP3(),fontBox));
        String num = "...";
        if(n.getNum_notification() !=null){
            num = n.getNum_notification();
        }
        par2.add(new Phrase(d.getP4()+" "+num,fontBox));
        par2.setSpacingAfter(10);
        cell.addElement(par2);

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_LEFT);
        String date2 = "...";
        if(n.getDateValidation()!=null){
            date2 = dateFormat.format(n.getDateValidation().getTime());
        }
        par3.add(new Phrase(d.getP5()+" ",fontbold));
        par3.add(new Phrase(d.getP6()+" "+ n.getNum_notification()+" " +d.getP7()+" "+ date2,fontBox));
        par3.setSpacingAfter(10);
        par3.add(Chunk.NEWLINE);
        cell.addElement(par3);

        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase(d.getP8()+" ",fontbold));
        par4.add(new Phrase(d.getP9(),fontBox));
        par4.setSpacingAfter(10);
        par4.add(Chunk.NEWLINE);
        cell.addElement(par4);

        Paragraph par13= new Paragraph();
        par13.setAlignment(Element.ALIGN_LEFT);
        par13.add(new Phrase("             "+d.getP10(),fontBox));
        par13.setSpacingAfter(10);
        par13.add(Chunk.NEWLINE);
        cell.addElement(par13);

        Paragraph par5= new Paragraph();
        par5.setAlignment(Element.ALIGN_CENTER);
        par5.add(new Phrase(d.getP11(),fontbold));
        par5.setSpacingAfter(10);
        par5.add(Chunk.NEWLINE);
        cell.addElement(par5);

        Paragraph par6= new Paragraph();
        par6.setAlignment(Element.ALIGN_LEFT);
        String quantite = "...";
        if(n.getQuantite() !=null){
            quantite = n.getQuantite();
        }
        String unite = "...";
        if(n.getUnite().getNom_fr() !=null){
            unite = n.getUnite().getNom_fr();
        }
        String classification = "...";
        if(n.getClassification().getNom_fr() !=null){
            classification = n.getClassification().getNom_ar();
        }
        String importateur = "...";
        if(n.getImportateur().getNom_fr() !=null){
            importateur = n.getImportateur().getNom_fr();
        }

        par6.add(new Phrase(d.getP12()+" "+ quantite + " " + unite +" "+ d.getP13() +" " + classification +" "+ d.getP14()+" " + importateur +" "+ d.getP15()+" ",fontBox));
        par6.setSpacingAfter(10);
        cell.addElement(par6);

        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase(d.getP16(),fontBox));
        par7.setSpacingAfter(10);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase("          "+d.getP17(),fontBox));
        par8.setSpacingAfter(10);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);

        Paragraph par9= new Paragraph();
        par9.setAlignment(Element.ALIGN_LEFT);
        par9.add(new Phrase("          "+d.getP18()+d.getP19()+d.getP20(),fontBox));
        par9.setSpacingAfter(10);
        par9.add(Chunk.NEWLINE);
        cell.addElement(par9);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_LEFT);
        par10.add(new Phrase(d.getP22(),fontBox));
        par10.setSpacingAfter(10);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_LEFT);
        par11.add(new Phrase(d.getP23(),fontBox));
        par11.setSpacingAfter(10);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);

        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        String lieu = "...";
        if(n.getLieu() != null){
            lieu = n.getLieu();
        }
        par12.add(new Phrase(d.getP24()+lieu,fontBox));
        par12.setSpacingAfter(10);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);

        Paragraph par14= new Paragraph();
        par14.setAlignment(Element.ALIGN_LEFT);
        par14.add(new Phrase(d.getTitre(),fontBox));
        par14.setSpacingAfter(10);
        par14.add(Chunk.NEWLINE);
        par14.add(Chunk.NEWLINE);
        par14.add(Chunk.NEWLINE);
        cell.addElement(par14);

        Paragraph par15= new Paragraph();
        par15.setAlignment(Element.ALIGN_CENTER);
        par15.add(new Phrase(d.getP25(),fontbold));
        par15.setSpacingAfter(10);
        par15.add(Chunk.NEWLINE);
        cell.addElement(par15);

        table5.addCell(cell);
        document.add(table5);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    */
    public static ByteArrayInputStream generateDocumentInstalation(DocumentInstalation d,Installation ct,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,13.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,13.0f,Font.BOLD);
        Font fbold=new Font(base,13.0f,Font.BOLD);

        Font fontBox = new Font(base, 12.0f);

        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_LEFT);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(10);
        par0.add(Chunk.NEWLINE);
        cell.addElement(par0);



        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.add(new Phrase(d.getP1()+" "+d.getP2()+" ",fbold));
        par2.setSpacingAfter(10);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);


        String x = ct.getNum_demande();
        String[] parts = x.split("-");
        String part1 = parts[0];
        String part2 = parts[1];
        String part3 = parts[2];

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_CENTER);
        par3.add(new Phrase(d.getP3()+" "+ct.getNumero_demande_pdf(),fbold));
        par3.setSpacingAfter(10);
        par3.add(Chunk.NEWLINE);
        cell.addElement(par3);

        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_CENTER);
        par4.add(new Phrase(d.getP5()+" "+ ct.getRaison(),fbold));
        par4.setSpacingAfter(10);
        par4.add(Chunk.NEWLINE);
        cell.addElement(par4);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase("****",fontbold));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);


        Paragraph par13= new Paragraph();
        par13.setAlignment(Element.ALIGN_LEFT);
        par13.add(new Phrase(d.getP6(),fbold));
        par13.setSpacingAfter(10);
        par13.add(Chunk.NEWLINE);
        cell.addElement(par13);

        Paragraph par5= new Paragraph();
        par5.setAlignment(Element.ALIGN_LEFT);
        par5.add(new Phrase(d.getP7(),fontBox));
        par5.setSpacingAfter(10);
        par5.add(Chunk.NEWLINE);
        cell.addElement(par5);

        Paragraph par6= new Paragraph();
        par6.setAlignment(Element.ALIGN_LEFT);
        par6.setIndentationLeft(1);
        par6.add(new Phrase(d.getP10(),fontBox));
        par6.setSpacingAfter(10);
        par6.add(Chunk.NEWLINE);
        cell.addElement(par6);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase(d.getP11(),fontBox));
        par8.setSpacingAfter(10);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);

        Paragraph par9= new Paragraph();
        par9.setAlignment(Element.ALIGN_LEFT);
        par9.add(new Phrase(d.getP12(),fontBox));
        par9.setSpacingAfter(10);
        par9.add(Chunk.NEWLINE);
        cell.addElement(par9);

        Paragraph par= new Paragraph();
        par.setAlignment(Element.ALIGN_LEFT);
        par.add(new Phrase(d.getP8(),fontBox));
        par.setSpacingAfter(10);
        par.add(Chunk.NEWLINE);
        cell.addElement(par);

        Paragraph par8a= new Paragraph();
        par8a.setAlignment(Element.ALIGN_LEFT);
        par8a.add(new Phrase(d.getP4(),fontBox));
        par8a.setSpacingAfter(10);
        par8a.add(Chunk.NEWLINE);
        cell.addElement(par8a);

        if(ct.getTypeRenouvellement().getId_type_renouvellement()==2){//Renouvellemnt
            Paragraph par17= new Paragraph();
            par17.setAlignment(Element.ALIGN_LEFT);
            par17.add(new Phrase(d.getP17()+" "+ct.getRaison(),fontBox));
            par17.setSpacingAfter(10);
            par17.add(Chunk.NEWLINE);
            cell.addElement(par17);
        }

        String date2 = "...";
        if(ct.getDateValidation()!=null){
            date2 = dateFormat.format(ct.getDateValidation());
            //date2 = dateFormat.format(ct.getDateDepot());
        }
        String raisonSocial =ct.getRaison()!=null?ct.getRaison():"";
        String Adresse =ct.getAdresse()!=null?ct.getAdresse():"";

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_LEFT);
        par10.add(new Phrase(d.getP13()+" "+ d.getP18() +" "+ date2,fontBox));
        par10.setSpacingAfter(10);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_CENTER);
        par11.add(new Phrase(d.getP14(),fbold));
        par11.setSpacingAfter(10);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);
        StringBuilder Categorie= new StringBuilder();
        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        if(ct.getType().equals("1")){
            par12.add(new Phrase("المادة الأولى:",fbold));
            par12.add(new Phrase(" تمنح رخصة لمعالجة النفايات الخطرة لشركة "+ct.getRaison() +" باستثناء النفايات الخطرة المحددة في اللائحة خلفه .",fontBox));
        }
        else if(ct.getType().equals("2")){
        	par12.add(new Phrase("المادة الأولى:",fbold));
            par12.add(new Phrase(d.getP15()+" "+ct.getRaison()+" الكائنة ب "+ct.getAdresse(),fontBox));
        }
        else if(ct.getType().equals("3")){
            par12.add(new Phrase("المادة الأولى:",fbold));
            par12.add(new Phrase(" تمنح رخصة لمعالجة جميع النفايات الخطرة ",fontBox));
        }
        else {
            par12.add(new Phrase("المادة الأولى:",fbold));
            par12.add(new Phrase(" تمنح رخصة لمعالجة النفايات الخطرة المحتوية على  ",fontBox));
            for(CategorieDechet c:ct.getCategorie()){
                Categorie.append(c.getNom_fr()).append(" و ");
            }
            String cat = Categorie.substring(0, Categorie.length() - 2);
            par12.add(new Phrase(cat +" لشركة "+ct.getRaison(),fontBox));
        }
        par12.setSpacingAfter(10);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);

        Paragraph par14= new Paragraph();
        par14.setAlignment(Element.ALIGN_LEFT);
        par14.add(new Phrase("المادة الثانية: ",fbold));
        par14.add(new Phrase(d.getP19(),fontBox));
        par14.setSpacingAfter(10);
        par14.add(Chunk.NEWLINE);
        cell.addElement(par14);

        Paragraph par15= new Paragraph();
        par15.setAlignment(Element.ALIGN_LEFT);
        par15.add(new Phrase("المادة الثالثة: ",fbold));
        par15.add(new Phrase(d.getP20(),fontBox));
        par15.setSpacingAfter(10);
        par15.add(Chunk.NEWLINE);
        cell.addElement(par15);


        Paragraph par16= new Paragraph();
        par16.setAlignment(Element.ALIGN_LEFT);
        par16.add(new Phrase("المادة الرابعة: ",fbold));
        par16.add(new Phrase(d.getP21(),fontBox));
        par16.setSpacingAfter(10);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        cell.addElement(par16);


        Paragraph par18= new Paragraph();
        par18.setAlignment(Element.ALIGN_RIGHT);
        par18.add(new Phrase(d.getP16()+"................",fontBox));
        par18.setSpacingAfter(10);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        cell.addElement(par18);

        String num_notification = ct.getNum_demande() != null ? ct.getNum_demande() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+ct.getId_installation()+"/IT/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        table5.addCell(cell);
        document.add(table5);
        addFooterCT_IT(writer,codeQrImage);
        addFooterDetail(writer);
        pageNumber(writer,"Page "+writer.getCurrentPageNumber()+" / "+writer.getPageNumber());

        if(!ct.getType().equals("0") && !ct.getType().equals("3")) {

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

            PdfPCell cell6 = new PdfPCell();
            Paragraph p3 = new Paragraph();
            p3.setAlignment(Element.ALIGN_CENTER);
            if (ct.getType().equals("1")) {
                p3.add(new Phrase("لائحة النفايات غير مرخص بمعالجتها من طرف شركة " + ct.getRaison(), fbold));
            } else {
                p3.add(new Phrase("لائحة النفايات الخطرة المرخصة                                      Liste des déchets dangereux autorisés", fbold));
                cell6.setBorder(Rectangle.NO_BORDER);
                p3.add(Chunk.NEWLINE);
                p3.add(Chunk.NEWLINE);

            }
            cell6.addElement(p3);
            cell6.setColspan(2);
            cell6.setPadding(5);
            cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell6);

            PdfPCell cell5 = new PdfPCell();
            Paragraph p2 = new Paragraph();
            p2.setAlignment(Element.ALIGN_CENTER);
            p2.add(new Phrase("Type de déchet", fontbold));
            cell5.addElement(p2);
            cell5.setPadding(5);
            table.addCell(cell5);

            PdfPCell cell4 = new PdfPCell();
            Paragraph p1 = new Paragraph();
            p1.setAlignment(Element.ALIGN_CENTER);
            p1.add(new Phrase("Code selon le catalogue maroccain des déchets", fontbold));
            cell4.addElement(p1);
            cell4.setPadding(5);
            table.addCell(cell4);

            int xx = ct.getCode().size();
            int i =1;


            for (Code c : ct.getCode()) {

                PdfPCell cell9 = new PdfPCell();
                Paragraph p6 = new Paragraph();
                p6.setAlignment(Element.ALIGN_LEFT);
                cell9.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
                cell9.setPadding(5);
                p6.add(new Phrase(c.getNom_ar(), fontBox));
                cell9.addElement(p6);
                table.addCell(cell9);

                PdfPCell cell8 = new PdfPCell();
                Paragraph p5 = new Paragraph();
                p5.setAlignment(Element.ALIGN_CENTER);
                cell8.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
                cell8.setPadding(5);
                p5.add(new Phrase(c.getNom_fr(), fontBox));
                cell8.addElement(p5);
                table.addCell(cell8);

            }
            document.add(table);
        }

        addFooterCT_IT(writer,codeQrImage);
        addFooterDetail(writer);
        pageNumber(writer,"Page "+writer.getCurrentPageNumber()+" / "+writer.getPageNumber());
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentCT(DocumentDechetCT d,CollecteTransporteur ct,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Locale locale = new Locale("ar");
        DateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy", locale);
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,12.0f);
        Font fontbold=new Font(base,12,Font.BOLD);
        Font fontBox = new Font(base, 11.0f);
        Font font2 = new Font(base, 9.0f);
        Font fbold=new Font(base,12.0f,Font.BOLD);


        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_LEFT);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(10);
        par0.add(Chunk.NEWLINE);
        cell.addElement(par0);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(d.getP1(),fontbold));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);

        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.add(new Phrase(d.getP2(),fontbold));
        par2.setSpacingAfter(10);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);

        String s = ct.getNum_demande();
        String[] parts = s.split("-");
        String part1 = parts[0];
        String part2 = parts[1];
        String part3 = parts[2];

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_CENTER);
        par3.add(new Phrase(d.getP3()+" " +ct.getNumero_demande_pdf(),fontbold));
        par3.setSpacingAfter(10);
        par3.add(Chunk.NEWLINE);
        cell.addElement(par3);

        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_CENTER);
        par4.add(new Phrase(d.getP5(),fontbold));
        par4.setSpacingAfter(10);
        par4.add(Chunk.NEWLINE);

        cell.addElement(par4);

        Paragraph par04= new Paragraph();
        par04.setAlignment(Element.ALIGN_CENTER);
        par04.add(new Phrase("********",fontbold));
        par04.setSpacingAfter(10);
        par04.add(Chunk.NEWLINE);
        cell.addElement(par04);

        Paragraph par13= new Paragraph();
        par13.setAlignment(Element.ALIGN_LEFT);
        par13.add(new Phrase(d.getP6(),fontbold));
        par13.setSpacingAfter(10);
        par13.add(Chunk.NEWLINE);
        cell.addElement(par13);

        Paragraph par5= new Paragraph();
        par5.setAlignment(Element.ALIGN_LEFT);
        par5.add(new Phrase(d.getP7(),fontBox));
        par5.setSpacingAfter(10);
        par5.add(Chunk.NEWLINE);
        cell.addElement(par5);

        Paragraph par6= new Paragraph();
        par6.setAlignment(Element.ALIGN_LEFT);
        par6.add(new Phrase(d.getP8(),fontBox));
        par6.setSpacingAfter(10);
        par6.add(Chunk.NEWLINE);
        cell.addElement(par6);

        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase(d.getP10(),fontBox));
        par7.setSpacingAfter(10);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase(d.getP11(),fontBox));
        par8.setSpacingAfter(10);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);

        Paragraph par9= new Paragraph();
        par9.setAlignment(Element.ALIGN_LEFT);
        par9.add(new Phrase(d.getP12(),fontBox));
        par9.setSpacingAfter(10);
        par9.add(Chunk.NEWLINE);
        cell.addElement(par9);
        String date2 = "...";
        if(ct.getDateDepot()!=null){
            date2 = dateFormat.format(ct.getDateDepot());
        }

        Paragraph parx9= new Paragraph();
        parx9.setAlignment(Element.ALIGN_LEFT);
        parx9.add(new Phrase(d.getP22(),fontBox));
        parx9.setSpacingAfter(10);
        parx9.add(Chunk.NEWLINE);
        cell.addElement(parx9);

        Paragraph parx10= new Paragraph();
        parx10.setAlignment(Element.ALIGN_LEFT);
        String societe = "...";
        if(ct.getRaison()!=null){
            societe = ct.getRaison();
        }
        parx10.add(new Phrase(d.getP23()+" "+societe+"؛",fontBox));
        parx10.setSpacingAfter(10);
        parx10.add(Chunk.NEWLINE);
        cell.addElement(parx10);


        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_LEFT);
        par10.add(new Phrase(d.getP13()+""+ date2 + " .",fontBox));
        par10.setSpacingAfter(10);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_CENTER);
        par11.add(new Phrase(d.getP14()+" :",fontbold));
        par11.setSpacingAfter(10);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);

        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        par12.add(new Phrase("  المادة الاولى: ",fontbold));
        par12.add(new Phrase(d.getP15()+" "+ct.getRaison()+" "+d.getP4()+" "+ct.getDemandeurAdresse(),fontBox));
        par12.setSpacingAfter(10);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);

        Paragraph par14= new Paragraph();
        par14.setAlignment(Element.ALIGN_LEFT);
        par14.add(new Phrase("  المادة الثانية: ",fontbold));
        par14.add(new Phrase(d.getP19(),fontBox));
        par14.setSpacingAfter(10);
        par14.add(Chunk.NEWLINE);
        cell.addElement(par14);

        Paragraph par16= new Paragraph();
        par16.setAlignment(Element.ALIGN_LEFT);
        par16.add(new Phrase("  المادة الثالثة: ",fontbold));
        par16.add(new Phrase(d.getP21(),fontBox));
        par16.setSpacingAfter(10);
        par16.add(Chunk.NEWLINE);
        cell.addElement(par16);

        Paragraph par15= new Paragraph();
        par15.setAlignment(Element.ALIGN_LEFT);
        par15.add(new Phrase("  المادة الرابعة: ",fontbold));
        par15.add(new Phrase(d.getP20(),fontBox));
        par15.setSpacingAfter(10);
        par15.add(Chunk.NEWLINE);
        par15.add(Chunk.NEWLINE);
        cell.addElement(par15);





        Paragraph par18= new Paragraph();
        par18.setAlignment(Element.ALIGN_RIGHT);
        par18.add(new Phrase(d.getP16()+" .................",fontBox));
        par18.setSpacingAfter(10);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        cell.addElement(par18);
        table5.addCell(cell);

        String num_notification = ct.getNum_demande() != null ? ct.getNum_demande() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+ct.getId_collecte()+"/CT/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        addFooterDetail(writer);


        PdfPTable table = new PdfPTable(3);
        table.setWidthPercentage(100.0f);
        float[] columnWidths = new float[]{50f,20f,30f};
        table.setWidths(columnWidths);
        table.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        /*PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);
        cell2.setColspan(2);
        cell2.addElement(new Phrase("لائحة النفايات الخطرة المرخص جمعها و نقلها",fontBox));
        table.addCell(cell2);
        cell2.setPadding(5);*/
        /*PdfPCell cell3 = new PdfPCell();
        cell3.setBorder(Rectangle.NO_BORDER);
        cell3.addElement(new Phrase("Liste des déchets dangereux autorisé",fontBox));
        cell3.setColspan(1);
        cell3.setPadding(5);
        cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
        table.addCell(cell3);
        table.completeRow();*/


        PdfPCell cell6 = new PdfPCell();
        Paragraph p3 = new Paragraph();
        p3.setAlignment(Element.ALIGN_CENTER);
        p3.add(new Phrase("Véhicules autorisés\n\n" ,font2));
        cell6.addElement(p3);
        //cell6.setPadding(5);
        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell6);

        PdfPCell cell5 = new PdfPCell();
        Paragraph p2 = new Paragraph();
        p2.setAlignment(Element.ALIGN_CENTER);
        p2.add(new Phrase("Code selon le catalogue marocain des déchets\n" ,font2));
        cell5.addElement(p2);
        //cell5.setPadding(5);
        table.addCell(cell5);

        PdfPCell cell4 = new PdfPCell();
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_CENTER);
        p1.add(new Phrase("Type de déchet\n\n",font2));
        cell4.addElement(p1);
        //cell4.setPadding(5);
        table.addCell(cell4);
        table.completeRow();


        PdfPTable tab = new PdfPTable(3);
        tab.setWidthPercentage(100.0f);
        float[] columnWidths2 = new float[]{50f,20f,30f};
        tab.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        tab.setWidths(columnWidths2);

        int x = ct.getCode().size();
        int i=1;
        int j=1;

            PdfPCell cell7 = new PdfPCell();
            Paragraph p4 = new Paragraph();
            p4.setAlignment(Element.ALIGN_LEFT);
            cell7.setBorder(Rectangle.NO_BORDER);
            cell7.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
            if(x==1){
                cell7.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
            }
            else {
                cell7.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
            }

        if(ct.getVehicules() != null && ct.getVehicules().size()>0){
                for(Vehicules v:ct.getVehicules()) {
                    p4.add(new Phrase( "   "+String.valueOf(j)+" -   "+v.getTypeVehicule(), font2));
                    p4.add(Chunk.NEWLINE);
                    p4.add(new Phrase( "   Immatriculation :"+v.getNum_mat_enrg_voit() + "-" +  v.getNum_mat_enrg_auto() + "-" + v.getNum_mat_id_prefect(), font2));
                    p4.add(Chunk.NEWLINE);
                    j++;
                }
            }
            cell7.addElement(p4);
            tab.addCell(cell7);

            for(Code c:ct.getCode()){
                PdfPCell cell8 = new PdfPCell();
                Paragraph p5 = new Paragraph();
                p5.setAlignment(Element.ALIGN_CENTER);
                cell8.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
                cell8.setPadding(5);
                p5.add(new Phrase(c.getNom_fr() ,font2));
                cell8.addElement(p5);
                tab.addCell(cell8);

                PdfPCell cell9 = new PdfPCell();
                Paragraph p6 = new Paragraph();
                p6.setAlignment(Element.ALIGN_LEFT);
                cell9.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
                cell9.setPadding(5);
                p6.add(new Phrase(" "+c.getNom_ar(),font2));
                cell9.addElement(p6);
                cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
                tab.addCell(cell9);

                PdfPCell cellaa = new PdfPCell();
                Paragraph p6a = new Paragraph();
                p6.setAlignment(Element.ALIGN_CENTER);
                cellaa.setPadding(5);
                p6.add(new Phrase("",fontBox));
                i+=1;


                if(i!=x){
                    cellaa.setBorder(Rectangle.NO_BORDER);
                    cellaa.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
                }
                else{
                    cellaa.setBorder(Rectangle.NO_BORDER);
                    cellaa.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
                }
                cellaa.addElement(p6a);
                cellaa.setHorizontalAlignment(Element.ALIGN_CENTER);
                tab.addCell(cellaa);



            }






        document.add(table5);
        document.add(table);
        document.add(tab);

        addFooterCT_IT(writer,codeQrImage);
        addFooterDetail(writer);
        pageNumber(writer,"Page "+writer.getCurrentPageNumber()+" / "+writer.getPageNumber());



        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentCT_Avenant(CollecteTransporteur ct,String Numero,String urlRest) throws DocumentException, IOException, ParseException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Document document=new Document(PageSize.A4, 20, 20, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        BaseFont base2 = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
            base2 = BaseFont.createFont("/static/assets_admin/fonts/majalla.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,12.0f);
        Font fontbold=new Font(base2,14,Font.BOLD);
        Font fontBox = new Font(base2, 18.0f);
        Font font2 = new Font(base, 8.0f);
        Font fbold=new Font(base,14.0f,Font.BOLD);


        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_LEFT);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(10);
        par0.add(Chunk.NEWLINE);
        cell.addElement(par0);

        String s1 = ct.getNum_demande();
        String[] parts1 = s1.split("-");
        String part11 = parts1[0];
        String part21 = parts1[1];
        String part31 = parts1[2];

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase("قرار "+ct.getQarar(),fontbold));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);

        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.add(new Phrase("رقم "+ct.getNumero_demande_pdf(),fontbold));
        par2.setSpacingAfter(10);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);

        Paragraph par2x= new Paragraph();
        par2x.setAlignment(Element.ALIGN_CENTER);
        par2x.add(new Phrase("بتتميم قرار "+ct.getTatmim()+" لدى وزيرة التحول الطاقي  والتنمية المستدامة، المكلفة بالتنمية المستدامة",fontbold));
        par2x.setSpacingAfter(10);
        par2x.add(Chunk.NEWLINE);
        cell.addElement(par2x);

        String s = Numero;
        String[] parts = s.split("-");
        String part1 = parts[0];
        String part2 = parts[1];
        String part3 = parts[2];

        Paragraph par3x= new Paragraph();
        par3x.setAlignment(Element.ALIGN_CENTER);
        par3x.add(new Phrase("رقم "+ct.getNumero_demande_pdf()+" الصادر بتاريخ "+dateFormat.format(ct.getDateValidation())+" بالترخيص لشركة "+ct.getRaison()+" ",fontbold));
        par3x.setSpacingAfter(10);
        par3x.add(Chunk.NEWLINE);
        cell.addElement(par3x);

        Paragraph par4x= new Paragraph();
        par4x.setAlignment(Element.ALIGN_CENTER);
        par4x.add(new Phrase("لجمع ونقل النفايات الخطرة",fontbold));
        par4x.setSpacingAfter(10);
        par4x.add(Chunk.NEWLINE);
        cell.addElement(par4x);

        Paragraph par04= new Paragraph();
        par04.setAlignment(Element.ALIGN_CENTER);
        par04.add(new Phrase("********",fontbold));
        par04.setSpacingAfter(10);
        par04.add(Chunk.NEWLINE);
        cell.addElement(par04);

        Paragraph par13= new Paragraph();
        par13.setAlignment(Element.ALIGN_LEFT);
        par13.add(new Phrase("قرار "+ct.getQarar(),fontbold));
        par13.setSpacingAfter(10);
        par13.add(Chunk.NEWLINE);
        cell.addElement(par13);

        Paragraph par5= new Paragraph();
        par5.setAlignment(Element.ALIGN_LEFT);
        par5.add(new Phrase(" -   بعد الاطلاع على قرار الوزيرة المنتدبة لدى وزيرة التحول الطاقي والتنمية المستدامة، المكلفة بالبيئة رقم\n\n "+ct.getNumero_demande_pdf()+" الصادر بتاريخ "+dateFormat.format(ct.getDateValidation())+" بالترخيص لشركة "+ct.getRaison()+" لجمع ونقل النفايات الخطرة. ",fontBox));
        par5.setSpacingAfter(20);
        par5.add(Chunk.NEWLINE);
        cell.addElement(par5);

        String date1 = ct.getReunions().size()>0?ct.getReunions().get(ct.getReunions().size()-1).getDate_reunion():"0";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.FRANCE);
        LocalDate dateReunion = LocalDate.parse(date1, formatter);
        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase("- وعلى رأي اللجنة المكونة من ممثلي السلطات الحكومية المكلفة بالصحة والفلاحة والنقل والبيئة خلال \n\nالاجتماع المنعقد بمقر قطاع البيئة بتاريخ "+dateReunion+"",fontBox));
        par7.setSpacingAfter(20);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_CENTER);
        par11.add(new Phrase(" قرر ما يلي: ",fontbold));
        par11.setSpacingAfter(10);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);

        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        par12.add(new Phrase("  مادة فريدة:    ",fontBox));
        par12.setSpacingAfter(10);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);

        Paragraph par14= new Paragraph();
        par14.setAlignment(Element.ALIGN_LEFT);
        par14.add(new Phrase("    تتمم المادة الأولى من القرار رقم "+ct.getNumero_demande_pdf()+" المشار إليه أعلاه على النحو التالي:",fontBox));
        par14.setSpacingAfter(10);
        par14.add(Chunk.NEWLINE);
        cell.addElement(par14);

        Paragraph par16= new Paragraph();
        par16.setAlignment(Element.ALIGN_LEFT);
        par16.add(new Phrase(" تمنح لشركة "+ct.getRaison()+" رخصة لجمع ونقل النفايات الخطرة المحددة في اللائحة خلفه.  ",fontBox));
        par16.setSpacingAfter(10);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        par16.add(Chunk.NEWLINE);
        cell.addElement(par16);


        Paragraph par18= new Paragraph();
        par18.setAlignment(Element.ALIGN_RIGHT);
        par18.add(new Phrase("وحرر بالرباط في .................",fontBox));
        par18.setSpacingAfter(10);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        par18.add(Chunk.NEWLINE);
        cell.addElement(par18);
        table5.addCell(cell);

        String num_notification = ct.getNum_demande() != null ? ct.getNum_demande() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+ct.getId_collecte()+"/CT/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        addFooterDetail(writer);


        PdfPTable table = new PdfPTable(3);
        table.setWidthPercentage(100.0f);
        float[] columnWidths = new float[]{50f,20f,30f};
        table.setWidths(columnWidths);
        table.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);
        cell2.setColspan(2);
        cell2.addElement(new Phrase("لائحة النفايات الخطرة المرخص جمعها و نقلها",fontBox));
        table.addCell(cell2);
        cell2.setPadding(5);
        PdfPCell cell3 = new PdfPCell();
        cell3.setBorder(Rectangle.NO_BORDER);
        cell3.addElement(new Phrase("Liste des déchets dangereux autorisé",fontBox));
        cell3.setColspan(1);
        cell3.setPadding(5);
        cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
        table.addCell(cell3);
        table.completeRow();


        PdfPCell cell6 = new PdfPCell();
        Paragraph p3 = new Paragraph();
        p3.setAlignment(Element.ALIGN_CENTER);
        p3.add(new Phrase("Véhicules autorisés\n\n" +
                "المركبات المرخصة \n" ,fontBox));
        cell6.addElement(p3);
        cell6.setPadding(5);
        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell6);

        PdfPCell cell5 = new PdfPCell();
        Paragraph p2 = new Paragraph();
        p2.setAlignment(Element.ALIGN_CENTER);
        p2.add(new Phrase("CMD\n" +
                "المصنف المغربي للنفايات \n",fontBox));
        cell5.addElement(p2);
        cell5.setPadding(5);
        table.addCell(cell5);

        PdfPCell cell4 = new PdfPCell();
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_CENTER);
        p1.add(new Phrase("Type de déchet\n\n" +
                "نوع النفايات\n",fontBox));
        cell4.addElement(p1);
        cell4.setPadding(5);
        table.addCell(cell4);






        table.completeRow();


        PdfPTable tab = new PdfPTable(3);
        tab.setWidthPercentage(100.0f);
        float[] columnWidths2 = new float[]{50f,20f,30f};
        tab.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        tab.setWidths(columnWidths2);

        int x = ct.getCode().size();
        int i=1;
        int j=1;

            PdfPCell cell7 = new PdfPCell();
            Paragraph p4 = new Paragraph();
            p4.setAlignment(Element.ALIGN_LEFT);
            cell7.setBorder(Rectangle.NO_BORDER);
            cell7.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
            if(x==1){
                cell7.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
            }
            else {
                cell7.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
            }

        if(ct.getVehicules() != null && ct.getVehicules().size()>0){
                for(Vehicules v:ct.getVehicules()) {
                    p4.add(new Phrase( "    "+String.valueOf(j)+" :"+v.getTypeVehicule(), fontBox));
                    p4.add(Chunk.NEWLINE);
                    p4.add(new Phrase( "    matricule :"+v.getNum_mat_enrg_voit() + "-" +  v.getNum_mat_enrg_auto() + "-" + v.getNum_mat_id_prefect(), fontBox));
                    p4.add(Chunk.NEWLINE);
                    j++;
                }
            }
            cell7.addElement(p4);
            tab.addCell(cell7);

            for(Code c:ct.getCode()){
                PdfPCell cell8 = new PdfPCell();
                Paragraph p5 = new Paragraph();
                p5.setAlignment(Element.ALIGN_CENTER);
                cell8.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
                cell8.setPadding(5);
                p5.add(new Phrase(c.getNom_fr() ,font2));
                cell8.addElement(p5);
                tab.addCell(cell8);

                PdfPCell cell9 = new PdfPCell();
                Paragraph p6 = new Paragraph();
                p6.setAlignment(Element.ALIGN_LEFT);
                cell9.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
                cell9.setPadding(5);
                p6.add(new Phrase(" "+c.getNom_ar(),font2));
                cell9.addElement(p6);
                cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
                tab.addCell(cell9);

                PdfPCell cellaa = new PdfPCell();
                Paragraph p6a = new Paragraph();
                p6.setAlignment(Element.ALIGN_CENTER);
                cellaa.setPadding(5);
                p6.add(new Phrase("",font2));
                i+=1;


                if(i!=x){
                    cellaa.setBorder(Rectangle.NO_BORDER);
                    cellaa.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
                }
                else{
                    cellaa.setBorder(Rectangle.NO_BORDER);
                    cellaa.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
                }
                cellaa.addElement(p6a);
                p6a.add(Chunk.NEWLINE);
                cellaa.setHorizontalAlignment(Element.ALIGN_CENTER);
                tab.addCell(cellaa);



            }




        PdfPTable tab2 = new PdfPTable(1);
        tab2.setWidthPercentage(100.0f);
        PdfPCell cellx = new PdfPCell();
        cellx.setBorder(Rectangle.NO_BORDER);
        cellx.addElement(new Phrase("NB : Société / "+ct.getRaison()+"\nDécret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux",font2));
        tab2.addCell(cellx);


        document.add(table5);
        document.add(table);
        document.add(tab);
        document.add(tab2);

        addFooterCT_IT(writer,codeQrImage);
        addFooterDetail(writer);
        pageNumber(writer,"Page "+writer.getCurrentPageNumber()+" / "+writer.getPageNumber());


        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentEIE(DocumentEIE d,DemandeInformation n,String r,String nom,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,12,Font.BOLD);
        Font fontBox = new Font(base, 12f);

        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_CENTER);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(5);
        par0.add(Chunk.NEWLINE);
        par0.add(Chunk.NEWLINE);
        document.add(par0);

        String s = n.getNum_demande();
        String[] parts = s.split("-");
        String part1 = parts[0];
        String part2 = parts[1];
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy");
        String year = df.format(date);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_CENTER);
        par10.add(new Phrase(d.getTitre()+" "+n.getNumero_demande_pdf(),fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(d.getP1()+" ",fontbold));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);


        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.add(new Phrase(d.getP2(),fontbold));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);


        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase(d.getP3(),fontBox));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        cell.addElement(par4);


        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase(d.getP4(),fontBox));
        par7.setSpacingAfter(5);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase(d.getP5(),fontBox));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);

        Paragraph par9= new Paragraph();
        par9.setAlignment(Element.ALIGN_LEFT);
        String DateReunion = r!=null?r:"";
        par9.add(new Phrase(d.getP6()+" "+DateReunion,fontBox));
        par9.setSpacingAfter(5);
        par9.add(Chunk.NEWLINE);
        par9.add(Chunk.NEWLINE);
        cell.addElement(par9);

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_CENTER);
        par3.add(new Phrase(d.getP7()+" :",fontbold));
        par3.setSpacingAfter(5);
        par3.add(Chunk.NEWLINE);
        par3.add(Chunk.NEWLINE);
        cell.addElement(par3);

        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk1 = new Chunk(d.getP8()+" ",fontbold);
        chunk1.setUnderline(1.5f, -1);
        par11.add(chunk1);
        String Intitule = n.getIntitule_projet()!=null?n.getIntitule_projet():"";
        par11.add(new Phrase(d.getP9()+" "+ Intitule,fontBox));
        par11.setSpacingAfter(5);
        par11.add(Chunk.NEWLINE);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);

        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk2 = new Chunk(d.getP10()+" ",fontbold);
        chunk2.setUnderline(1.5f, -1);
        par12.add(chunk2);
        par12.add(new Phrase(d.getP11(),fontBox));
        par12.setSpacingAfter(5);
        par12.add(Chunk.NEWLINE);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);


        Paragraph par13= new Paragraph();
        par13.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk3 = new Chunk(d.getP12()+" ",fontbold);
        chunk3.setUnderline(1.5f, -1);
        par13.add(chunk3);
        par13.add(new Phrase(d.getP13(),fontBox));
        par13.setSpacingAfter(5);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        cell.addElement(par13);


        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+n.getId_demande_information()+"/NT/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        table5.addCell(cell);
        document.add(table5);
        addFooter(writer,codeQrImage);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDecision(DemandeInformation d,String dr,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 70, 70, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/alfont_com_AlFont_com_22017-adobearabic.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,18,Font.BOLD);
        Font fontBox = new Font(base, 18);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDF.class.getResource(logo));
        image.scaleToFit(500,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_CENTER);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(5);
        par0.add(Chunk.NEWLINE);
        par0.add(Chunk.NEWLINE);
        document.add(par0);

        String s = d.getNum_demande();
        String[] parts = s.split("-");
        String part1 = parts[0];
        String part2 = parts[1];
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy");
        String year = df.format(date);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_LEFT);
        par10.add(new Phrase("  قرار رقم:  "+ d.getNumero_demande_pdf(),fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase("قرار المطابقة البيئية ",fontbold));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);


        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_LEFT);
        par2.add(new Phrase("بناء على القانون رقم 17-49 المتعلق بالتقييم البيئي الصادر بتنفيذه الظهير الشريف رقم 1.20.78 الصادر في 18 ذي الحجة 1441 (8 أغسطس 2020) لاسيما المواد 1 و17 و18 و19 منه؛",fontBox));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);


        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase("وعلى المرسوم رقم ....... الصادر بتاريخ .... المتعلق بتطبيق بعض أحكام القانون رقم 17-49 المتعلق بالتقييم البيئي، خاصة الباب الخامس منه المتعلق بالافتحاص البيئي؛",fontBox));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        cell.addElement(par4);


        String DateReunion = dr!=null?dr:"";
        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase(" وعلى رأي لجنة المطابقة البيئية خلال الاجتماع المنعقد بتاريخ "+d.getReunions().get(d.getReunions().size()-1).getDate_reunion()+"؛  ",fontBox));
        par7.setSpacingAfter(5);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_CENTER);
        par8.add(new Phrase("قرر ما يلي :",fontbold));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);


        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk1 = new Chunk("المادة 1 : ",fontbold);
        chunk1.setUnderline(1.5f, -1);
        par11.add(chunk1);
        par11.add(new Phrase(" تمنح المطابقة البيئية للوحدة الصناعية/للشركة "+d.getRaison_social()+" لصاحبها " +d.getRepresantant(),fontBox));
        par11.setSpacingAfter(5);
        par11.add(Chunk.NEWLINE);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);

        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk2 = new Chunk(" المادة 2 : ",fontbold);
        chunk2.setUnderline(1.5f, -1);
        par12.add(chunk2);
        par12.add(new Phrase("يلتزم صاحب الوحدة باحترام خلاصات دراسة الافتحاص البيئي وبنود كناش التحملات المرفق بهذا القرار.",fontBox));
        par12.setSpacingAfter(5);
        par12.add(Chunk.NEWLINE);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);


        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+d.getId_demande_information()+"/AE/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);


        table5.addCell(cell);
        document.add(table5);
        addFooter(writer,codeQrImage);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentNotice(DocumentEIE d,DemandeInformation n,String r,String nom,String urlRest) throws DocumentException, IOException, ParseException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,16,Font.BOLD);
        Font fontbold1=new Font(base,14,Font.NORMAL);
        Font fontBox = new Font(base, 16f);

        String logo = d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(570,800);
        image.scaleToFit(610,800);
        image.scaleToFit(550,800);
        document.add(image);

        PdfPTable table5 = new PdfPTable(1);
        table5.setWidthPercentage(100);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph par0= new Paragraph();
        par0.setAlignment(Element.ALIGN_CENTER);
        par0.add(new Phrase(""));
        par0.setSpacingAfter(5);
        par0.add(Chunk.NEWLINE);
        par0.add(Chunk.NEWLINE);
        document.add(par0);

        String s = n.getNum_demande();
        String[] parts = s.split("-");
        String part1 = parts[0];
        String part2 = parts[1];
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy");
        String year = df.format(date);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_CENTER);
        par10.add(new Phrase(d.getTitre()+" "+ n.getNumero_demande_pdf(),fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        cell.addElement(par10);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(d.getP1()+" ",fontbold));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        par1.add(Chunk.NEWLINE);
        cell.addElement(par1);


        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.add(new Phrase(d.getP2(),fontbold));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        cell.addElement(par2);


        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase("بناء على القانون رقم 17-49 المتعلق بالتقييم البيئي الصادر بتنفيذه الظهير الشريف رقم 1.20.78 الصادر في 18 من ذي الحجة 1441 (8 أغسطس 2020) ؛",fontbold1));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        cell.addElement(par4);


        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase("وعلى المرسوم رقم 0.00.000 الصادر بتاريخ ............... المتعلق ب......................................",fontbold1));
        par7.setSpacingAfter(5);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        cell.addElement(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        String DateReunion = r!=null?r:"";
        par8.add(new Phrase("وعلى رأي المصلحة المختصة المعينة من طرف السلطة الحكومية المكلفة بالبيئة بتاريخ............................."+DateReunion+ "؛",fontbold1));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        par8.add(Chunk.NEWLINE);
        cell.addElement(par8);


        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_CENTER);
        par3.add(new Phrase(d.getP7()+" :",fontbold1));
        par3.setSpacingAfter(5);
        par3.add(Chunk.NEWLINE);
        par3.add(Chunk.NEWLINE);
        cell.addElement(par3);

        Paragraph par11= new Paragraph();
        par11.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk1 = new Chunk(d.getP8(),fontbold);
        chunk1.setUnderline(1.5f, -1);
        par11.add(chunk1);
        String Intitule = n.getIntitule_projet()!=null?n.getIntitule_projet():"";
        par11.setSpacingAfter(5);
        par11.add(new Phrase(" "+d.getP9()+" "+ Intitule +" ",fontbold1));
        par11.add(new Phrase("مقدم من طرف شركة "+n.getRaison_social(),fontbold1));
        par11.add(Chunk.NEWLINE);
        par11.add(Chunk.NEWLINE);
        cell.addElement(par11);

        Paragraph par12= new Paragraph();
        par12.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk2 = new Chunk(d.getP10(),fontbold);
        chunk2.setUnderline(1.5f, -1);
        par12.add(chunk2);
        par12.add(new Phrase(" يلتزم صاحب المشروع باحترام خلاصات بطاقة التأثير على البيئة وبنود برنامج المراقبة والتتبع البيئي المرفق بهذا القرار ",fontBox));
        par12.setSpacingAfter(5);
        par12.add(Chunk.NEWLINE);
        par12.add(Chunk.NEWLINE);
        cell.addElement(par12);


        Paragraph par13= new Paragraph();
        par13.setAlignment(Element.ALIGN_LEFT);
        Chunk chunk3 = new Chunk(d.getP12(),fontbold);
        chunk3.setUnderline(1.5f, -1);
        par13.add(chunk3);
        par13.add(new Phrase(" تعتبر هذه الموافقة البيئية لاغية إذا لم يتم إنجاز المشروع خلال أجل .......... ابتداء من تاريخ الحصول عليها ",fontBox));
        par13.setSpacingAfter(5);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        cell.addElement(par13);


        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+n.getId_demande_information()+"/NT/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);


        table5.addCell(cell);
        document.add(table5);
        addFooter(writer,codeQrImage);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentExportation(Notification nt) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,12,Font.BOLD);
        Font fontBox = new Font(base, 12f);

        String logo = "/word_header.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        Paragraph para1= new Paragraph();
        para1.setAlignment(Element.ALIGN_LEFT);
        para1.add(new Phrase(" ",fontbold));
        para1.setSpacingAfter(5);
        para1.add(Chunk.NEWLINE);
        para1.add(Chunk.NEWLINE);
        para1.add(Chunk.NEWLINE);
        document.add(para1);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_CENTER);
        par10.add(new Phrase("A",fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase("Monsieur le",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase("- - - - - - - - - - ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        document.add(par10);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_LEFT);
        par1.add(new Phrase("object : ",fontbold));
        par1.add(new Phrase("Exportation de "+nt.getQuantite()+" "+nt.getUnite().getNom_fr()+"" +
                " de déchets "+nt.getClassification().getNom_fr()+" contenants des substances dangereuses pour valorisation.",fontBox));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        document.add(par1);

        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_LEFT);
        par2.add(new Phrase("P.J : ",fontbold));
        par2.add(new Phrase("dossier de notification "+nt.getNum_notification(),fontBox));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        document.add(par2);

        String Adresse= nt.getEliminateur().getAdresse_fr()!=null?nt.getEliminateur().getAdresse_fr():"";
        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase("Suite à la demande de transfert de déchets "+nt.getClassification().getNom_fr()+" vers "+Adresse+" formulée par "+nt.getNom()+", je vous faits parvenir ci joint le dossier de notification de transferts transfrontaliers de déchets N° "+nt.getNum_notification() +" . ",fontBox));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        document.add(par4);

        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase("L’avis de l’autorité compétente chargée de l’Environnement relevant du Ministère de l’Energie, des Mines et de l’Environnement -Département de l’Environnement- vous parviendra dès instruction complète de la demande. ",fontBox));
        par7.setSpacingAfter(5);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        document.add(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase("A cet effet, je vous saurais grès de bien vouloir donner votre avis concernant la réalisation de cette opération.",fontBox));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        par8.add(Chunk.NEWLINE);
        document.add(par8);

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_LEFT);
        par3.add(new Phrase("En restant à votre disposition pour toute information supplémentaire, je vous prie d’agréer, Monsieur, l’expression de mes salutations distinguées",fontBox));
        par3.setSpacingAfter(5);
        par3.add(Chunk.NEWLINE);
        par3.add(Chunk.NEWLINE);
        document.add(par3);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentExportationLettreConsentement(Notification nt) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,12,Font.BOLD);
        Font fontBox = new Font(base, 12f);

        String logo = "/word_header.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        Paragraph para1= new Paragraph();
        para1.setAlignment(Element.ALIGN_LEFT);
        para1.add(new Phrase(" ",fontbold));
        para1.setSpacingAfter(5);
        para1.add(Chunk.NEWLINE);
        para1.add(Chunk.NEWLINE);
        para1.add(Chunk.NEWLINE);
        document.add(para1);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_CENTER);
        par10.add(new Phrase("A",fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase("Monsieur le Directeur",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add(new Phrase("De la société - - - - - - - - - - ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        document.add(par10);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_LEFT);
        par1.add(new Phrase("Objet : Exportation de "+nt.getQuantite()+ " "+nt.getUnite().getNom_fr()+" de déchet de "+
                nt.getClassification().getNom_fr()+" pour l'environnement",fontbold));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        document.add(par1);

        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_LEFT);
        par2.add(new Phrase("P.J : Document de notification (1): "+nt.getNum_notification(),fontbold));
       par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        document.add(par2);

        String Adresse= nt.getEliminateur().getAdresse_fr()!=null?nt.getEliminateur().getAdresse_fr():"";
        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase("Suite à la demande de transfert de déchets "+nt.getClassification().getNom_fr()+" vers "+Adresse+" formulée par "+nt.getNom()+", j'ai l'honneur de vous informer que le Maroc en tant que partie contractente à la Convention de Bâle, et ne disposant pas d'installations d'élimination et de traitement des déchets "+nt.getClassification().getNom_fr() +
                " donne son consentement pour l'exportation de "+nt.getQuantite()+" "+nt.getUnite().getNom_fr()+" de déchet "+nt.getClassification().getNom_fr()+" en vue de leur valorisation au\n" +
                "sein de la société "+Adresse+" spécialisée dans le traitement et la valorisation\n" +
                "des déchets "+nt.getClassification().getNom_fr()+" .",fontBox));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        document.add(par4);

        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(new Phrase("Par ailleurs, la Société "+Adresse+" a l’entière responsabilité sur tout\n" +
                "dommage ou impact négatif sur l’environnement ou la santé publique qui peut être\n" +
                "engendré par le transport de ces déchets au Maroc.",fontBox));
        par7.setSpacingAfter(5);
        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        document.add(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase("Veuillez agréer, Monsieur, l’expression de mes salutations distinguées",fontBox));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        par8.add(Chunk.NEWLINE);
        document.add(par8);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentTransit(Notification nt,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 50, 50, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        document.open();
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        BaseFont myfont = null;
        try {
            myfont = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,10,Font.BOLD);
        Font fontBox = new Font(base, 10f);
        Font monFont = new Font(base, 9);
        Font fontIcon = new Font(myfont, 14.0f);
        Chunk icon=new Chunk(String.valueOf("\uF0D8"),fontIcon);

        String logo = "/word_header.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550,800);
        document.add(image);

        Paragraph para10= new Paragraph();
        para10.setAlignment(Element.ALIGN_CENTER);
        para10.add(new Phrase(" ",fontbold));
        para10.setSpacingAfter(5);
        para10.add(Chunk.NEWLINE);
        document.add(para10);

        Paragraph par10= new Paragraph();
        par10.setAlignment(Element.ALIGN_CENTER);
        par10.add(new Phrase("A",fontbold));
        par10.setSpacingAfter(5);
        par10.add(Chunk.NEWLINE);
        String aut=nt.getAutorite().getDenomination()!=null?nt.getAutorite().getDenomination():"";
        par10.add(new Phrase("Monsieur le "+aut,fontbold));
        par10.add(Chunk.NEWLINE);
        String poste=nt.getAutorite().getPoste()!=null?nt.getAutorite().getPoste():"";
        par10.add(new Phrase("du "+poste,fontbold));
        par10.add(Chunk.NEWLINE);
        String pays=nt.getAutorite().getPays().getNom_fr()!=null?nt.getAutorite().getPays().getNom_fr():"";
        par10.add(new Phrase("du "+pays,fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        par10.add(Chunk.NEWLINE);
        document.add(par10);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_LEFT);
        par1.add(new Phrase("Objet : ",fontbold));
        String producteur=nt.getProducteur().getNom_fr()!=null?nt.getProducteur().getNom_fr():"";
        String eliminateur=nt.getEliminateur()!=null?nt.getEliminateur().getNom_fr():"";
        par1.add(new Phrase("Transferts transfrontaliers de déchets dangereux du "+ producteur+" vers "+eliminateur+"\n" +
                "              Notification N° "+nt.getNum_notification()+"\n",fontBox));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);
        document.add(par1);

        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_LEFT);
        par2.add(new Phrase("Réf : ",fontbold));
        par2.add(new Phrase("Votre correspondance …………………………… du ………………………………..",fontBox));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);
        par2.add(Chunk.NEWLINE);
        document.add(par2);

        Paragraph para2= new Paragraph();
        para2.setAlignment(Element.ALIGN_LEFT);
        para2.add(new Phrase("P.J : ",fontbold));
        para2.add(new Phrase(": -  Document de notification.\n" +
                "            -  Format du rapport.   \n",fontBox));
        para2.setSpacingAfter(5);
        para2.add(Chunk.NEWLINE);
        para2.add(Chunk.NEWLINE);
        document.add(para2);

        String nom=nt.getEliminateur().getNom_fr()!=null?nt.getEliminateur().getNom_fr():"";
        Paragraph par4= new Paragraph();
        par4.setAlignment(Element.ALIGN_LEFT);
        par4.add(new Phrase("Suite à votre correspondance concernant la demande d’autorisation de transit par le Maroc de "+ nt.getQuantite()+" "+nt.getUnite().getNom_fr()+" de déchets "+nt.getClassification().getNom_fr()+", j’ai l’honneur de vous informer que nous n’avons pas d’objection et donnons notre consentement à l’opération de transit de ces déchets par le Maroc via le port de Tanger Med pour élimination au sein de la société "+nom+" en …………………, sous réserves de :",fontBox));
        par4.setSpacingAfter(5);
        par4.add(Chunk.NEWLINE);
        par4.add(Chunk.NEWLINE);
        document.add(par4);

        Paragraph par7= new Paragraph();
        par7.setAlignment(Element.ALIGN_LEFT);
        par7.add(icon);
        par7.add(new Phrase("    Respecter la procédure de l’Organisation Maritime Internationale (OMI), à savoir :",fontBox));
        par7.add(Chunk.NEWLINE);
        par7.add(new Phrase("       •  Transmettre à la Direction de la Marine Marchande toutes les six heures à compter du départ du navire, le rapport ci-joint dûment rempli. ",fontBox));
        par7.add(Chunk.NEWLINE);
        par7.add(new Phrase("       •  Se souscrire à une assurance P&I club (assurance couvrant les dégâts en cas de pollution due aux soutes).   ",fontBox));
        par7.add(Chunk.NEWLINE);
        par7.add(icon); par7.add(new Phrase("    S’informer auprès du Port de Tanger Med sur son règlement d’exploitation et de l’informer sur la date de départ du navire et la date et l’heure envisagée pour le transit par ledit port.",fontBox));
        par7.add(Chunk.NEWLINE);
        par7.add(icon);par7.add(new Phrase("     Les déchets dangereux devront être emballés et étiquetés conformément aux règles et normes internationales et conditionnés obligatoirement en conteneurs.  ",fontBox));
        par7.add(Chunk.NEWLINE);
        par7.add(icon); par7.add(new Phrase("    Si cette opération de transit consisterait également en des opérations de transbordement, les conteneurs devront être déposés au niveau de l’un des terminaux à conteneurs du Port de Tanger Med en attente de leurs expéditions vers la France.",fontBox));
        par7.add(Chunk.NEWLINE);
        par7.add(icon);par7.add(new Phrase("     Les navires transportant ces déchets dangereux devront disposer à bord des documents attestant de la sécurité de transport de ce type de déchet et autres documents règlementaires exigés par la Convention de Bâle, le Code International de transport des Marchandises Dangereuses (code IMDG…) et la réglementation nationale en la matière. ",fontBox));
        par7.setSpacingAfter(5);

        par7.add(Chunk.NEWLINE);
        par7.add(Chunk.NEWLINE);
        document.add(par7);

        Paragraph par8= new Paragraph();
        par8.setAlignment(Element.ALIGN_LEFT);
        par8.add(new Phrase("Veuillez agréer Monsieur, l’expression de mes salutations distinguées.",fontBox));
        par8.setSpacingAfter(5);
        par8.add(Chunk.NEWLINE);
        document.add(par8);

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_LEFT);
        par3.add(new Phrase("\n" +
                "CC. - Direction de la Marine Marchande.\n" +
                "        - Port de Tanger\n",monFont));
        par3.setSpacingAfter(5);
        document.add(par3);

        String num_notification = nt.getNum_notification() != null ? nt.getNum_notification() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+nt.getId_notification()+"/"+nt.getZf_et()+"/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        addFooterTransit(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateRecapInstalation(Installation ns,ListDocNotif[] l, DocImport[] d,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter writer=PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font font_sm=new Font(base,8.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);
        Font BlackText = new Font(base,10,Font.NORMAL,BaseColor.BLACK);


        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

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
        headerPar.add("Récapitulation de la demande d'autorisation d'installation de traitement des déchets");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Instalation ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("معلومات عن صاحب المشروع",6));
        table0.addCell(saisir_cellule_titre("Installation de traitement des déchets dangereux",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("وصف المنشأة :",font,3));
        table0.addCell( saisir_cellule_tmp(" : Description d'installation",font,3));
        table0.addCell( MyCell("رقم الطلب :",font,3));
        table0.addCell( saisir_cellule_tmp(" : N° de la demande",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDescription(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),6));
        table0.completeRow();
        table0.addCell( MyCell("هيكل المنشأة :",font,2));
        table0.addCell( saisir_cellule_tmp(" : structure d'installation",font,3));
        table0.addCell( MyCell("نوع الجهاز :",font,2));
        table0.addCell( saisir_cellule_tmp(" : Type d'appareil",font,3));
        table0.addCell( MyCell("الموقع  :",font,1));
        table0.addCell( saisir_cellule_tmp(" : Site",font,1));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getStructure(),5));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getType_appareil(),5));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getSite(),2));
        table0.completeRow();
        table0.addCell( MyCell("الوحدة :",font,2));
        table0.addCell( saisir_cellule_tmp(" : Unité",font,2));
        table0.addCell( MyCell("الكمية :",font,2));
        table0.addCell( saisir_cellule_tmp(": Quantité",font,2));
        table0.addCell( MyCell("العملية :",font,2));
        table0.addCell( saisir_cellule_tmp(":Operation",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation(),4));
        table0.completeRow();


        table0.completeRow();
        //--------------------- Row Title ---------------------

        if(ns.getType().equals("3")){
            table0.addCell(saisir_cellule_transporteur_titre("Code",6));
            table0.addCell(saisir_cellule_transporteur_titre("Type",6));
            table0.completeRow();
            table0.setSpacingAfter(5);
            table0.addCell(MonCellule("vous avez selectionnez toutes la liste", 12));
            table0.completeRow();
        }
        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table1.addCell(saisir_cellule_titre1("معلومات عن صاحب المشروع",6));
        table1.addCell(saisir_cellule_titre("Information Demandeur",6));
        table1.completeRow();
        //--------------------- completeRow ---------------------

        table1.addCell( MyCell("اسم الشركة : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Nom de la société",font,2));
        table1.addCell( MyCell("البريد الإلكتروني : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Identifiant",font,2));
        table1.addCell( MyCell("الهاتف : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Télephone",font,2));
        table1.completeRow();
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison()!=null?ns.getRaison():"-",4));
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEmail()!=null?ns.getEmail():"-",4));
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTel()!=null?ns.getTel():"-",4));
        table1.completeRow();
        table1.addCell( MyCell("الفاكس : ",font,3));
        table1.addCell( saisir_cellule_tmp(" : Fax",font,3));
        table1.addCell( MyCell("العنوان : ",font,3));
        table1.addCell( saisir_cellule_tmp(" : Adresse",font,3));
        table1.completeRow();
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getFax()!=null?ns.getFax():"-",6));
        table1.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse()!=null?ns.getAdresse():"-",6));
        table1.completeRow();


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(12);
        table2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre1("فريق العمل",6));
        table2.addCell(saisir_cellule_titre("Equipe De Travail",6));
        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( MyCell("عدد الفريق : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Nombre d'equipe",font,2));
        table2.addCell( MyCell("عدد الموظفين : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Nombre d'effectif",font,2));
        table2.addCell( MyCell("ساعات العمل : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Horaire Début d'exploitation",font,2));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getNbr_equipe_travail(),4));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getFormation(),4));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getHoraire_exploitation(),4));
        table2.setSpacingAfter(12);

        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_instalation/"
                + ns.getId_installation(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);
        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المصاحبة عند الطلب",6));
        table7.addCell(saisir_cellule_titre("Piéces accompagnant la demande",6));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }



        document.add(headerPar);
        document.add(table0);
        document.add(table1);
        document.add(table2);
        if(ns.getType().equals("1") || ns.getType().equals("2")){
            PdfPTable table_x = new PdfPTable(4);
            table_x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
            table_x.setWidthPercentage(100);
            table_x.setSpacingBefore(12);
            table_x.setSpacingAfter(12);
            table_x.addCell(saisir_cellule_titre1("المصنف المغربي النفايات",2));
            table_x.addCell(saisir_cellule_titre("Catalogue Marocain des déchets",2));
            table_x.completeRow();
            if(ns.getType().equals("1")) {
                table_x.addCell(MonCellule("Vous avez selectionnez tous les codes à l'exception de la liste ci-dessous", 4));
                table_x.completeRow();
            }

            table_x.addCell(saisir_cellule_transporteur_titre("Code",2));
            table_x.addCell(saisir_cellule_transporteur_titre("Type",2));
            table_x.completeRow();
            if(ns.getCode().size()>14){
                table_x.setSpacingAfter(600);
            }
            else{
                table_x.setSpacingAfter(12);
            }
            //--------------------- completeRow ---------------------
            for (Code c:ns.getCode()){
                table_x.addCell(saisir_cellule("",font,font,c.getNom_fr()!=null?c.getNom_fr():"-",2));
                table_x.addCell(saisir_cellule("",font,font,c.getNom_ar()!=null?c.getNom_ar():"-",2));
                table_x.completeRow();
            }
            document.add(table_x);
            if(ns.getCode().size()>14){
                addFooter(writer,codeQrImage);
            }


        }
        document.add(table7);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateRecapCollecte(CollecteTransporteur ns,ListDocNotif[] l, DocImport[] d,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);
        Font BlackText = new Font(base,10,Font.NORMAL,BaseColor.BLACK);


        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

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
        headerPar.add("Récapitulation de la demande d'autorisation Collecte Transport Des déchets dangereux");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Collecte  ---------------------

        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("معلومات عن الطالب",6));
        table0.addCell(saisir_cellule_titre("N° de la demande",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الطلب",font,3));
        table0.addCell( saisir_cellule_tmp("N° de la demande",font,3));
        table0.addCell( MyCell("اسم الشركة ",font,3));
        table0.addCell( saisir_cellule_tmp("Nom de la société",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison(),6));
        table0.completeRow();
        table0.addCell( MyCell("الممثل القانوني",font,2));
        table0.addCell( saisir_cellule_tmp("Represantant ",font,2));
        table0.addCell( MyCell("الهاتف ",font,2));
        table0.addCell( saisir_cellule_tmp("Télephone",font,2));
        table0.addCell( MyCell("الفاكس ",font,2));
        table0.addCell( saisir_cellule_tmp("Fax ",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeur_Nom(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurTel(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurFax(),4));
        table0.completeRow();
        table0.addCell( MyCell("البريد الإلكتروني ",font,3));
        table0.addCell( saisir_cellule_tmp("Email",font,3));
        table0.addCell( MyCell("العنوان",font,3));
        table0.addCell( saisir_cellule_tmp("Adresse ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurEmail(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurAdresse(),6));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(4);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table01.addCell(saisir_cellule_titre1("المصنف المغربي النفايات",2));
        table01.addCell(saisir_cellule_titre("Listes des déchets choisis",2));
        table01.completeRow();
        table01.addCell(saisir_cellule("",fontBox,font,"",4));

        //--------------------- completeRow ---------------------
        table01.addCell( MyCell("الرمز",font,1));
        table01.addCell( saisir_cellule_tmp("Code",font,1));
        table01.addCell( MyCell("نوع",font,1));
        table01.addCell( saisir_cellule_tmp("Type",font,1));
        table01.completeRow();
        for (Code c:ns.getCode()){
            table01.addCell(saisir_cellule_tmp3(c.getNom_fr()!=null?c.getNom_fr():"-",font,2));
            table01.addCell(saisir_cellule_tmp3(c.getNom_ar()!=null?c.getNom_ar():"-",font,2));
            table01.completeRow();
        }


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3 = new PdfPTable(12);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table3.addCell(saisir_cellule_titre1(" بيانات المركبة ",6));
        table3.addCell(saisir_cellule_titre(" Donnée sur les véhicules ",6));
        table3.completeRow();
        //--------------------- completeRow ---------------------
        table3.addCell( MyCell("عدد الحاويات : ",font,3));
        table3.addCell( saisir_cellule_tmp(ns.getNombre_conteneur()+" : Nombre de conteneurs",font,3));
        table3.addCell( MyCell("عدد المركبات : ",font,3));
        table3.addCell( saisir_cellule_tmp(ns.getNombre_vehicule()+" : Nombre de Véhicule",font,3));
        table3.completeRow();
        table3.addCell(saisir_cellule_transporteur_titre("N° d'immatriculation\t",2));
        table3.addCell(saisir_cellule_transporteur_titre("N° Châssis\t ",2));
        table3.addCell(saisir_cellule_transporteur_titre("Poids total en charge\t",2));
        table3.addCell(saisir_cellule_transporteur_titre("Poids net du véhicule\t",2));
        table3.addCell( saisir_cellule_transporteur_titre("Type de véhicules\t",2));
        table3.addCell( saisir_cellule_transporteur_titre("type de conteneurs\t",2));
        table3.completeRow();
        if(ns.getVehicules()!=null && ns.getVehicules().size()>0){
            for (Vehicules tp:ns.getVehicules()) {
                table3.addCell( saisir_cellule(tp.getNum_mat_enrg_voit()+"-"+tp.getNum_mat_enrg_auto()+"-"+tp.getNum_mat_id_prefect(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getNum_chassis(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getPoit_totale_charge(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getPoint_net(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getTypeVehicule(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getTypeConteneur(),font,font,"",2));
                table3.completeRow();
            }
        }else{
            PdfPCell tmp =  saisir_cellule("Aucun Transporteur.",fontbold,fontbold,"",4);
            tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
            table3.addCell(tmp);
        }
        table3.completeRow();
        table3.setSpacingAfter(12);


        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المصاحبة عند الطلب",6));
        table7.addCell(saisir_cellule_titre("Piéces accompagnant la demande",6));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }

        PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);
        cell2.setColspan(1);
        cell2.addElement(new Phrase(""));
        table7.addCell(cell2);
        table7.completeRow();

        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_collecte/"
                + ns.getId_collecte(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);




        document.add(headerPar);
        document.add(table0);
        document.add(table3);
        document.add(table7);
        document.add(table01);
        addFooter(writer,codeQrImage);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateRecapEie(DemandeInformation ns,ListDocNotif[] l,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

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
        if(ns.getType().equals("EE")) {
            headerPar.add("Récapitulation de la demande Etude d’Impact sur l’Environnement");
        }
        if(ns.getType().equals("AE")) {
            headerPar.add("Récapitulation de la demande du Certificat de Conformité Environnementale");
        }
        if(ns.getType().equals("NT")) {
            headerPar.add("Récapitulation de la demande Notice d’Impact sur l’Environnement");
        }
        if(ns.getType().equals("RS")) {
            headerPar.add("Récapitulation de la demande de Renseignements préalables");
        }
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Collecte  ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        if(ns.getType().equals("AE")){
            table0.addCell(saisir_cellule_titre1("معلومات عن صاحب النشاط أو الوحدة الصناعية ",6));
            table0.addCell(saisir_cellule_titre("Informations sur l'exploitant ",6));
        }else{
            table0.addCell(saisir_cellule_titre1("معلومات عن صاحب المشروع ",6));
            table0.addCell(saisir_cellule_titre("Informations sur le pétitionnaire ",6));
        }

        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الطلب",font,2));
        table0.addCell( saisir_cellule_tmp("N° de la demande",font,2));
        table0.addCell( MyCell("اسم الشركة ",font,2));
        table0.addCell( saisir_cellule_tmp("Nom de la société",font,2));
        table0.addCell( MyCell("الممثل القانوني",font,2));
        table0.addCell( saisir_cellule_tmp("Représentant légal",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison_social(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getRepresantant(),4));
        table0.completeRow();
        table0.addCell( MyCell("الهاتف ",font,3));
        table0.addCell( saisir_cellule_tmp("Téléphone",font,3));
        table0.addCell( MyCell("الفاكس ",font,3));
        table0.addCell( saisir_cellule_tmp("Fax ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getTel(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getFax(),6));
        table0.completeRow();
        table0.addCell( MyCell("البريد الإلكتروني ",font,3));
        table0.addCell( saisir_cellule_tmp("Email",font,3));
        table0.addCell( MyCell("العنوان",font,3));
        table0.addCell( saisir_cellule_tmp("Adresse ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getEmail(),6));
        table0.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse(),6));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getType().equals("AE")){
            table01.addCell(saisir_cellule_titre1("معلومات النشاط أو الوحدة الصناعية ",6));
            table01.addCell(saisir_cellule_titre("Informations sur l'activité ",6));
        }else{
            table01.addCell(saisir_cellule_titre1("معلومات المشروع ",6));
            table01.addCell(saisir_cellule_titre("Informations sur le projet ",6));
        }

        table01.completeRow();
        //--------------------- completeRow ---------------------
        if(ns.getType().equals("AE")){
            table01.addCell(MyCell("عنوان النشاط أو الوحدة الصناعية",font,2));
            table01.addCell(saisir_cellule_tmp("Intitulé de l'activité",font,2));
        }else{
            table01.addCell(MyCell("عنوان المشروع",font,2));
            table01.addCell(saisir_cellule_tmp("Intitulé du projet",font,2));
        }
        table01.addCell(MyCell("مبلغ الاستثمار بملايين الدراهم",font,2));
        table01.addCell(saisir_cellule_tmp("Montant d'investissement en MDH",font,2));
        if(ns.getType().equals("EE")){
            table01.addCell(MyCell("عابر للحدود",font,2));
            table01.addCell(saisir_cellule_tmp("Transfrontalier",font,2));
        }
        else if(ns.getType().equals("AE")){
            table01.addCell(MyCell("نوع النشاط أو الوحدة الصناعية",font,2));
            table01.addCell(saisir_cellule_tmp("Nature d'activité",font,2));
        }
        else{
            table01.addCell(MyCell("طبيعة المشروع ",font,2));
            table01.addCell(saisir_cellule_tmp("Nature de projet",font,2));
        }
        table01.completeRow();
        table01.addCell(saisir_cellule_tmp2(fontbold,ns.getIntitule_projet(),4));
        table01.addCell(saisir_cellule_tmp2(fontbold,String.valueOf(ns.getMontant_investissement()),4));
        if(ns.getType().equals("EE")){
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getTronsfrontalier(),4));
        }
        else if(ns.getType().equals("AE")){
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getNature_projet(),4));
        }
        else{
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getNature_projet(),4));
        }
        table01.completeRow();
        /*if(ns.getType().equals("AE")){

        	DateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
        	Date date;
        	Date date2;
        	try {
        	    date = dateFormate.parse(ns.getDateDemarage());
        	    date2 = dateFormate.parse(ns.getDateResiliation());

                String dateDemarage=convertDate("dd/MM/yyyy",date);
                String dateResiliation=convertDate("dd/MM/yyyy",date2);

                table01.addCell(saisir_cellule("Date Démarage : ",font,fontbold,dateDemarage,1));
                table01.addCell(saisir_cellule("Date Résiliation : ",font,fontbold,dateResiliation,2));
                table01.completeRow();

        	}

        	catch (ParseException e) {
        	    e.printStackTrace();
        	}


        }*/

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3 = new PdfPTable(12);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getType().equals("AE")){
            table3.addCell(saisir_cellule_titre1("موقع النشاط أو الوحدة الصناعية",6));
            table3.addCell(saisir_cellule_titre("Localisation de l'activité  ",6));
        }else{
            table3.addCell(saisir_cellule_titre1("موقع المشروع",6));
            table3.addCell(saisir_cellule_titre("Localisation du projet  ",6));
        }

        table3.completeRow();
        //--------------------- completeRow ---------------------
        table3.addCell(MyCell("الجهات",font,2));
        table3.addCell(saisir_cellule_tmp("Régions",font,2));
        table3.addCell(MyCell("العمالات / الأقاليم",font,2));
        table3.addCell(saisir_cellule_tmp("Préfecture(s) et province(s)",font,2));
        table3.addCell(MyCell("الجماعات",font,2));
        table3.addCell(saisir_cellule_tmp("Communes",font,2));
        table3.completeRow();
        PdfPCell cell8 = new PdfPCell();
        PdfPCell cell9 = new PdfPCell();
        PdfPCell cell10 = new PdfPCell();
        Paragraph p5 = new Paragraph();
        Paragraph p6 = new Paragraph();
        Paragraph p7 = new Paragraph();
        if(ns.getDetailRegion()!=null) {
            for (Region r : ns.getDetailRegion().getRegion()) {
                p5.setAlignment(Element.ALIGN_RIGHT);
                cell8.setPadding(5);
                cell8.setColspan(4);
                p5.add(new Phrase(r.getNom_fr()+" \n \n" ,font));
                // table3.addCell(saisir_cellule(r.getNom_fr(), font, font, "", 2));
            }
            cell8.addElement(p5);
            table3.addCell(cell8);
            for (Prefecture p : ns.getDetailRegion().getPrefectures()) {
                p6.setAlignment(Element.ALIGN_RIGHT);
                cell9.setPadding(5);
                cell9.setColspan(4);
                p6.add(new Phrase(p.getNom_fr()+" \n \n" ,font));
                //table3.addCell(saisir_cellule(p.getNom_fr(), font, font, "", 1));
            }
            cell9.addElement(p6);
            table3.addCell(cell9);
            for (Commune c : ns.getDetailRegion().getCommunes()) {
                p7.setAlignment(Element.ALIGN_RIGHT);
                cell10.setPadding(5);
                cell10.setColspan(4);
                p7.add(new Phrase(c.getNom_fr()+" \n \n" ,font));
                //table3.addCell(saisir_cellule(c.getNom_fr(), font, font, "", 1));
            }
            cell10.addElement(p7);
            table3.addCell(cell10);
            table3.completeRow();
        }

        table3.setSpacingAfter(12);

        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        //--------------------- Tableau Les Pièces ---------------------
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب ",6));
        table7.addCell(saisir_cellule_titre("Piéces accompagnant la demande",6));
        table7.completeRow();
        if(!ns.getType().equals("RS")){
            //--------------------- Row Title ---------------------
            int i=1;
            for (ListDocNotif ld: l){
                table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
                i++;
                table7.completeRow();
            }
        }else{
            table7.addCell(saisir_cellule_transporteur_titre("Aucun Document ",3));
        }


        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_Eie/"
                + ns.getId_demande_information(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table3);
        document.add(table7);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static PdfPCell saisir_cellule(String label,Font font_label,Font font_var,String var, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Phrase ph2 = new Phrase(var,font_var);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_RIGHT);
        ppp.add(ph1);
        ppp.add(ph2);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        return cell1;
    }
    public static PdfPCell saisir_cellule_tmp(String label,Font font_label, int collspan){
        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Phrase ph1 = new Phrase(label,font_label);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_RIGHT);
        ppp.add(ph1);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(solid, null, null, dashed));
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        return cell1;
    }
    public static PdfPCell saisir_cellule_tmp2(Font font_var,String var, int collspan){

        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Phrase ph1 = new Phrase(var,font_var);
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_CENTER);
        p1.add(ph1);
        PdfPCell cell1 = new PdfPCell(p1);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(solid, solid, null, solid));
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell1;
    }

    public static PdfPCell saisir_cellule_adresse(Font font_var,String var, int collspan){

        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Phrase ph1 = new Phrase(var,font_var);
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_CENTER);
        p1.add(ph1);
        PdfPCell cell1 = new PdfPCell(p1);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(solid, solid, null, solid));
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        return cell1;
    }

    public static PdfPCell saisir_cellule_tmp3(String label,Font font_label, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_RIGHT);
        ppp.add(ph1);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        return cell1;
    }

    public static PdfPCell saisir_cellule2(String label,Font font_label,Font font_var,String var, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Phrase ph2 = new Phrase(var,font_var);
        Paragraph ppp = new Paragraph();
        ppp.add(ph1);
        ppp.add(ph2);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        return cell1;
    }

    public static PdfPCell saisir_cellule_titre(String label,int collspan){
        Font whiteText = new Font(Font.FontFamily.TIMES_ROMAN,12.0f,Font.BOLD,BaseColor.WHITE);
        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();
        Paragraph para = new Paragraph(label,whiteText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setBorder(Rectangle.NO_BORDER);
        cell0.setCellEvent(new CustomBorder(solid, null, solid, solid));
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell0.setPaddingBottom(10f);
        cell0.setPaddingTop(3f);
        cell0.setBackgroundColor(new BaseColor(51, 108, 78));
        return cell0;
    }


    public static PdfPCell saisir_cellule_titre1(String label,int collspan) throws DocumentException, IOException {
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Font font=new Font(base,12.0f,Font.BOLD,BaseColor.WHITE);
        Paragraph para = new Paragraph(label,font);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setBorder(Rectangle.NO_BORDER);
        cell0.setCellEvent(new CustomBorder(null, solid, solid, solid));
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell0.setPaddingBottom(10f);
        cell0.setPaddingTop(3f);
        cell0.setBackgroundColor(new BaseColor(51, 108, 78));
        return cell0;
    }

    public static PdfPCell saisir_cellule_transporteur_titre(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(new BaseColor(222, 226, 230));
        return cell0;
    }

    public static PdfPCell saisir_cellule_producteur_titre(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(new BaseColor(222, 226, 230));
        return cell0;
    }

    public static PdfPCell MonCellule(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.WHITE);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(BaseColor.ORANGE);
        return cell0;
    }

    public static PdfPCell saisir_cellule_2(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.NORMAL,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        para.setAlignment(Element.ALIGN_RIGHT);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        return cell0;
    }
    public static String convertDate(String type, Date date) {
        String strDate = "";
        if (date == null) {

        } else {

            SimpleDateFormat formatter = new SimpleDateFormat(type);
            strDate = formatter.format(date);

        }
        return strDate;
    }



    public static PdfPCell MyCell(String label,Font font_label,int collspan){

        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();
        Phrase ph1 = new Phrase(label,font_label);
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_LEFT);
        p1.add(ph1);
        PdfPCell cell1 = new PdfPCell(p1);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(null, solid, null, dashed));
        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
        return cell1;
    }

    public static ByteArrayInputStream generateRecapNotification(Notification ns,ListDocNotif[] l,DocImport[] d,DeclarationTransporteur dt,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font font_sm=new Font(base,8.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

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
        String title_type = "...";
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1){
            title_type = "d'importation des déchets dangereux d'une zone franche";
        }else if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==2){
            title_type = "d'importation des déchets  non dangereux d'une zone franche";
        }else if(ns.getZf_et().equals("ET")){
            title_type = "d'importation des déchets non dangereux d'un pays étranger";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==1){
            title_type = "d'exportation des déchets dangereux";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==2){
            title_type = "d'exportation des déchets non dangereux";
        }else if(ns.getZf_et().equals("TR")){
            title_type = "Transit des déchets";
        }
        headerPar.add("Récapitulation de la demande d'autorisation "+title_type);
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de notification ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("رقم الإخطار",6));
        table0.addCell(saisir_cellule_titre("Numéro de notification",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الإخطار",font,3));
        table0.addCell( saisir_cellule_tmp("Numéro de notification",font,3));
        table0.addCell( MyCell("تصنيف النفايات ",font,3));
        table0.addCell( saisir_cellule_tmp("Classification des déchets",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_notification(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getClassification()!=null?ns.getClassification().getNom_fr():"-",6));
        table0.completeRow();
        table0.addCell( MyCell("الرمز ",font,3));
        table0.addCell( saisir_cellule_tmp("Code",font,3));
        table0.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table0.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?RTL_LTR(ns.getCode().getNom_fr()):"-",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table0.completeRow();
        table0.addCell( MyCell("العملية",font,3));
        table0.addCell( saisir_cellule_tmp("Opération",font,3));
        table0.addCell( MyCell("وحدة",font,3));
        table0.addCell( saisir_cellule_tmp("Unité",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",6));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(MyCell("المنطقة الحرة", font, 3));
            table0.addCell(saisir_cellule_tmp("Zone Franche", font, 3));
        }else if(ns.getZf_et().equals("ET")) {
            table0.addCell(MyCell("بلد أجنبي", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays étranger", font, 3));
        }
        else {
            table0.addCell(MyCell("بلد التصدير ", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays d'exportation", font, 3));
        }
        table0.addCell( MyCell("نوع النفايات",font,3));
        table0.addCell( saisir_cellule_tmp("Type de déchet",font,3));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getZonneFranche() != null ? ns.getZonneFranche().getNom_fr() : "-", 6));
        }else {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getPays() != null ? ns.getPays().getNom_fr() : "-", 6));
        }
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?ns.getCode().getNom_ar():"-",6));

        //---------------------Tableau Exportateur - Notifiant ----------------------


        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        if (ns.getZf_et().equals("XD") || ns.getZf_et().equals("TR") || ns.getZf_et().equals("ET")){
            table01.setWidthPercentage(100);
            table01.setSpacingBefore(12);
            table01.setSpacingAfter(12);

            //--------------------- Row Title ---------------------
            table01.addCell(saisir_cellule_titre1("المصدر - المخطر ",6));
            table01.addCell(saisir_cellule_titre("Exportateur - Notifiant",6));
            table01.completeRow();
            //--------------------- completeRow ---------------------
            if(ns.getZf_et().equals("TR")) {
                table01.addCell(MyCell("اسم المصدر المخطر", font, 3));
                table01.addCell(saisir_cellule_tmp("Nom de l'exportateur notifiant", font, 3));
                table01.addCell(MyCell("البريد الالكتروني", font, 3));
                table01.addCell(saisir_cellule_tmp("Courrier électronique", font, 3));

                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getNom_fr() : "-", 6));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getMail() : "-", 6));
                table01.completeRow();
                table01.addCell(MyCell("الهاتف", font, 3));
                table01.addCell(saisir_cellule_tmp("Télephone", font, 3));
                table01.addCell(MyCell("فاكس", font, 3));
                table01.addCell(saisir_cellule_tmp("Télécopie", font, 3));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getTel() : "-", 6));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 6));
                table01.completeRow();

                table01.addCell( MyCell("جهة الاتصال",font,3));
                table01.addCell( saisir_cellule_tmp("Personne à contacter",font,3));
                table01.addCell( MyCell("العنوان",font,3));
                table01.addCell( saisir_cellule_tmp("Adresse",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getImportateur()!=null?ns.getImportateur().getContact_fr():"-",6));
                table01.addCell( saisir_cellule_adresse(fontbold,ns.getImportateur()!=null?ns.getImportateur().getAdresse_fr():"-",6));
                table01.completeRow();

                table01.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,3));
                table01.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,3));
                table01.addCell( MyCell("الرمز الوطني في البلد المُستورد",font,3));
                table01.addCell( saisir_cellule_tmp("Code National dans le pays d'importation",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",6));
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalIm()!=null?ns.getCodeNationalIm():"-",6));
                table01.completeRow();

                table01.addCell( MyCell("قائمة النفايات CE",font,3));
                table01.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,3));
                table01.addCell( MyCell("بلد الاستيراد / الوجهة",font,3));
                table01.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",6));
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",6));
                table01.completeRow();
            }
            else{
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(MyCell("اسم المصدر المخطر", font, 2));
                    table01.addCell(saisir_cellule_tmp("Nom de l'exportateur notifiant", font, 2));
                }
                else {
                    table01.addCell(MyCell("إسم الشركة", font, 2));
                    table01.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
                }
                table01.addCell(MyCell("البريد الالكتروني", font, 2));
                if(!ns.getZf_et().equals("ZF")) {
                    table01.addCell(saisir_cellule_tmp("Courrier électonique", font, 2));
                }
                else {
                    table01.addCell(saisir_cellule_tmp("Email", font, 2));
                }
                table01.addCell(MyCell("الهاتف", font, 2));
                table01.addCell(saisir_cellule_tmp("Télephone", font, 2));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getNom_fr() : "-", 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getMail() : "-", 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getTel() : "-", 4));
                table01.completeRow();
                table01.addCell(MyCell("فاكس", font, 2));
                if(!ns.getZf_et().equals("ZF")){
                    table01.addCell(saisir_cellule_tmp("Télécopie", font, 2));
                }else{
                    table01.addCell(saisir_cellule_tmp("Fax", font, 2));
                }

                table01.addCell(MyCell("الجهة", font, 2));
                table01.addCell(saisir_cellule_tmp("Région", font, 2));
                table01.addCell(MyCell("المحافظة", font, 2));
                table01.addCell(saisir_cellule_tmp("Préfecture", font, 2));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getRegion() != null ? ns.getRegion().getNom_fr() : "-", 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getPrefecture() != null ? ns.getPrefecture().getNom_fr() : "-", 4));
                table01.completeRow();
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(MyCell("جهة الاتصال", font, 3));
                    table01.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));

                    table01.addCell(MyCell("العنوان", font, 3));
                    table01.addCell(saisir_cellule_tmp("Adresse", font, 3));
                    table01.completeRow();
                    table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                    table01.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 6));
                    table01.completeRow();

                    table01.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,2));
                    table01.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,2));
                    table01.addCell( MyCell("قائمة النفايات CE",font,2));
                    table01.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,2));
                    table01.addCell( MyCell("بلد الاستيراد / الوجهة",font,2));
                    table01.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,2));
                    table01.completeRow();
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"-",4));
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",4));
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",4));
                    table01.completeRow();
                }
                else{
                    table01.addCell(MyCell("جهة الاتصال", font, 3));
                    table01.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
                    table01.addCell(MyCell("العنوان", font, 3));
                    table01.addCell(saisir_cellule_tmp("Adresse", font, 3));
                    table01.completeRow();
                    table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                    table01.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 6));
                    table01.completeRow();
                }
            }

        }

        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);
        if (ns.getZf_et().equals("XD")) {

            //--------------------- Row Title ---------------------
            table1.addCell(saisir_cellule_titre1("المستورد - المتلقي",6));
            table1.addCell(saisir_cellule_titre("Importateur - Destinataire",6));
            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell( MyCell("اسم المصدر المتلقي",font,2));
            table1.addCell( saisir_cellule_tmp("Nom de l'importateur destinataire",font,2));
            table1.addCell( MyCell("الفاكس",font,2));
            table1.addCell( saisir_cellule_tmp("Télécopie",font,2));
            table1.addCell( MyCell("جهة الاتصال",font,2));
            table1.addCell( saisir_cellule_tmp("Personne à contacter",font,2));
            table1.completeRow();
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getNom()!=null?ns.getNom():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTelecopie()!=null?ns.getTelecopie():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getPersonne()!=null?ns.getPersonne():"",4));
            table1.completeRow();
            table1.addCell( MyCell("الهاتف",font,2));
            table1.addCell( saisir_cellule_tmp("Téléphone",font,2));
            table1.addCell( MyCell("البريد الالكتروني",font,2));
            table1.addCell( saisir_cellule_tmp("courrier électronique",font,2));
            table1.addCell( MyCell("عنوان",font,2));
            table1.addCell( saisir_cellule_tmp("Adresse : ",font,2));
            table1.completeRow();
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTel()!=null?ns.getTel():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCourrier()!=null?ns.getCourrier():"",4));
            table1.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse()!=null?ns.getAdresse():"",4));
            table1.completeRow();
            if(ns.getZf_et().equals("ET")){
                table1.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,2));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,2));
                table1.addCell( MyCell("قائمة النفايات CE",font,2));
                table1.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,2));
                table1.addCell( MyCell("بلد الاستيراد / الوجهة",font,2));
                table1.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,2));
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",4));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",4));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",4));
                table1.completeRow();
            }else{
                table1.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,3));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,3));
                table1.addCell( MyCell("الرمز الوطني في البلد المُستورد",font,3));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'importation",font,3));
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",6));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalIm()!=null?ns.getCodeNationalIm():"-",6));
                table1.completeRow();

                table1.addCell( MyCell("قائمة النفايات CE",font,3));
                table1.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,3));
                if(ns.getZf_et().equals("TR")){
                    table1.addCell( MyCell("بلد الاستيراد / الوجهة",font,3));
                    table1.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,3));
                }else if(ns.getZf_et().equals("XD")){
                    table1.addCell( MyCell("بلد التصدير / الإرسال",font,3));
                    table1.addCell( saisir_cellule_tmp("Pays d'exportation/d'éxpédition",font,3));
                }
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",6));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",6));
                table1.completeRow();
            }

        }
        else {

            //--------------------- Row Title ---------------------
            if(!ns.getZf_et().equals("ZF")){
                table1.addCell(saisir_cellule_titre1("المستورد - المتلقي", 6));
                table1.addCell(saisir_cellule_titre("Importateur - Destinataire", 6));
            }
            else{
                table1.addCell(saisir_cellule_titre1("المستورد - المخطر", 6));
                table1.addCell(saisir_cellule_titre("Importateur - Notifiant", 6));
            }

            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell(MyCell("إسم الشركة", font,2));
            table1.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
            table1.addCell(MyCell("البريد الاكتروني", font, 2));
            if(ns.getZf_et().equals("ET")) {
                table1.addCell(saisir_cellule_tmp("Courrier électonique", font, 2));
            }else {
                table1.addCell(saisir_cellule_tmp("Email", font, 2));
            }
            table1.addCell(MyCell("الهاتف", font,  2));
            table1.addCell(saisir_cellule_tmp("Télephone", font, 2));
            table1.completeRow();
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getNom_fr() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getMail() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getTel() : "-", 4));
            table1.completeRow();


            if(ns.getZf_et().equals("ET")) {
                table1.addCell(MyCell("الفاكس", font, 2));
                table1.addCell(saisir_cellule_tmp("Télécopie", font, 2));
                table1.addCell(MyCell("جهة الاتصال", font, 2));
                table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 2));

                table1.addCell(MyCell("العنوان", font, 2));
                table1.addCell(saisir_cellule_tmp("Adresse", font, 2));
                table1.completeRow();
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 4));
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 4));
                table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 4));
                table1.completeRow();
            }
            else {
                table1.addCell(MyCell("الفاكس", font, 3));
                table1.addCell(saisir_cellule_tmp("Fax", font, 3));
                table1.addCell(MyCell("جهة الاتصال", font, 3));
                table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
                table1.completeRow();
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 6));
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                table1.completeRow();
                table1.addCell(MyCell("العنوان", font, 6));
                table1.addCell(saisir_cellule_tmp("Adresse", font, 6));
                table1.completeRow();
                table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 12));
                table1.completeRow();
            }
        }


        //---------------------Tableau Autorite ----------------------


        PdfPTable table02 = new PdfPTable(12);
        table02.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table02.setWidthPercentage(100);
        table02.setSpacingBefore(12);
        table02.setSpacingAfter(12);
        if (ns.getZf_et().equals("XD")){
            //--------------------- Row Title ---------------------
            table02.addCell(saisir_cellule_titre1("هيئة الاستيراد",6));
            table02.addCell(saisir_cellule_titre("Autorité d'importation",6));

            table02.completeRow();
            //--------------------- completeRow ---------------------

            table02.addCell( MyCell("العنوان",font,2));
            table02.addCell( saisir_cellule_tmp("Adresse",font,2));
            table02.addCell( MyCell("الهاتف",font,2));
            table02.addCell( saisir_cellule_tmp("Télephone",font,2));
            table02.addCell( MyCell("الفاكس",font,2));
            table02.addCell( saisir_cellule_tmp("Fax",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_adresse(fontbold,ns.getAutorite()!=null?ns.getAutorite().getAdresse():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getTel():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getFax():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("البريد الاكتروني ",font,3));
            table02.addCell( saisir_cellule_tmp("Mail",font,3));
            table02.addCell( MyCell("بلد التصدير",font,3));
            table02.addCell( saisir_cellule_tmp("Pays d'exportation",font,3));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getEmail():"-",6));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",6));
            table02.completeRow();
        }else if(ns.getZf_et().equals("TR")){
            table02.addCell(saisir_cellule_titre1("هيئة العبور",6));
            table02.addCell(saisir_cellule_titre("Autorité de transit",6));

            table02.completeRow();
            //--------------------- completeRow ---------------------

            table02.addCell( MyCell("نوع",font,2));
            table02.addCell( saisir_cellule_tmp("Genre",font,2));
            table02.addCell( MyCell("الممثل",font,2));
            table02.addCell( saisir_cellule_tmp("Représentant",font,2));
            table02.addCell( MyCell("الجودة",font,2));
            table02.addCell( saisir_cellule_tmp("Qualité",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getGenre_A():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getDenomination():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getPoste():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("البريد الاكتروني ",font,2));
            table02.addCell( saisir_cellule_tmp("Mail",font,2));
            table02.addCell( MyCell("الهاتف",font,2));
            table02.addCell( saisir_cellule_tmp("Téléphone",font,2));
            table02.addCell( MyCell("الفاكس",font,2));
            table02.addCell( saisir_cellule_tmp("Fax",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getEmail():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getTel():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getFax():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("العنوان ",font,3));
            table02.addCell( saisir_cellule_tmp("Adresse",font,3));
            table02.addCell( MyCell("البلد",font,3));
            table02.addCell( saisir_cellule_tmp("Pays",font,3));
            table02.completeRow();
            table02.addCell( saisir_cellule_adresse(fontbold,ns.getAutorite()!=null?ns.getAutorite().getAdresse():"-",6));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",6));
            table02.completeRow();

            table02.addCell(MyCell("البلد",font, 3));
            table02.addCell(saisir_cellule_tmp("Pays",font, 3));
            table02.addCell(MyCell("الهيئة ",font, 3));
            table02.addCell(saisir_cellule_tmp("Autorité ",font, 3));
            table02.completeRow();
            if (ns.getPaysAutorites() != null && ns.getPaysAutorites().size() > 0) {
                for (PaysAutorite tp : ns.getPaysAutorites()) {
                    table02.addCell(saisir_cellule(tp.getPays()!=null?tp.getPays().getNom_fr():"-", font, font, "", 6));
                    table02.addCell(saisir_cellule(tp.getDesc_autorite()!=null?tp.getDesc_autorite():"-", font, font, "", 6));
                    table02.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucune autorité.", fontbold, fontbold, "", 12);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table02.addCell(tmp);
            }
        }else{

        }

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(12);
        table2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre1("وثيقة الإخطار",6));
        table2.addCell(saisir_cellule_titre("Document de notification",6));

        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table2.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table2.addCell( MyCell("العملية",font,3));
        table2.addCell( saisir_cellule_tmp("Opération",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table2.completeRow();
        table2.addCell( MyCell("العدد الإجمالي لعمليات النقل المتوقعة ",font,3));
        table2.addCell( saisir_cellule_tmp("Nombre total d'expéditions prévues",font,3));
        table2.addCell( MyCell("الخصائص الفيزيائية ",font,3));
        table2.addCell( saisir_cellule_tmp("Caractéristiques physiques",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getExpedition()!=null?ns.getExpedition():"",6));
        if(ns.getCaracteristquePhysique().getId_classification()!=5){
            table2.addCell( saisir_cellule_tmp2(fontbold,ns.getCaracteristquePhysique()!=null?ns.getCaracteristquePhysique().getNom_fr():"-",6));
        }else{
            table2.addCell( saisir_cellule_tmp2(fontbold,ns.getAutre()!=null?ns.getAutre():"-",6));
        }
        table2.completeRow();
        table2.addCell( MyCell("بخصوص الإخطار",font,3));
        table2.addCell( saisir_cellule_tmp("Notification Concernant",font,3));
        table2.addCell( MyCell("اسم الوجهة النهائية",font,3));
        table2.addCell( saisir_cellule_tmp("Destination finale",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getUniques()!=null?ns.getUniques():"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getDestination_final()!=null?ns.getDestination_final():"",6));
        table2.completeRow();
        table2.addCell( MyCell("أول مغادرة",font,3));
        table2.addCell( saisir_cellule_tmp("Premier départ",font,3));
        table2.addCell( MyCell("آخر مغادرة",font,3));
        table2.addCell( saisir_cellule_tmp("Dernier  départ",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getPremier()!=null?RTL_LTR(ns.getPremier()):"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getDernier()!=null?RTL_LTR(ns.getDernier()):"",6));
        table2.completeRow();
        table2.addCell( MyCell("متطلبات المناولة الخاصة",font,6));
        table2.addCell( saisir_cellule_tmp("Prescriptions spéciales de manutention ",font,6));
        table2.completeRow();
        table2.addCell(saisir_cellule_tmp2(fontbold,ns.getManutention()!=null?ns.getManutention():"",12));
        table2.completeRow();
        table2.addCell( MyCell("نوع (أنواع) التغليف ",font,6));
        table2.addCell( saisir_cellule_tmp("Type(s) de conditionnement",font,6));
        table2.setSpacingAfter(12);
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getTypeconditionnement()!=null?ns.getTypeconditionnement().getNom_fr():"-",12));

        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table3 = new PdfPTable(8);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("XD") || (ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1)){
            table3.addCell(saisir_cellule_titre1("الناقل (الناقلات) الوطنية المقصودة", 4));
            table3.addCell(saisir_cellule_titre("Transporteur(s) national prévu", 4));

            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(MyCell("إسم الشركة",font, 1));
            table3.addCell(saisir_cellule_tmp("Nom",font, 1));
            table3.addCell(MyCell("الهاتف",font, 1));
            table3.addCell(saisir_cellule_tmp("Téléphone",font, 1));
            table3.addCell(MyCell("العنوان",font, 2));
            table3.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table3.completeRow();
            if (ns.getTransporteur() != null && ns.getTransporteur().size() > 0) {
                for (TransporteurParam tp : ns.getTransporteur()) {
                    table3.addCell(saisir_cellule_tmp2(font,tp.getNom(),2));
                    table3.addCell(saisir_cellule_tmp2(font,tp.getTel(), 2));
                    table3.addCell(saisir_cellule_adresse( font, tp.getAdresse(),4));
                    table3.completeRow();
                }
            }else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }else if(!ns.getZf_et().equals("TR") || (ns.getZf_et().equals("XD") || ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()!=1)){


            table3.addCell(saisir_cellule_titre1("الناقل (الناقلات) الوطنية المقصودة", 4));
            table3.addCell(saisir_cellule_titre("Transporteur(s) national prévu", 4));

            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(MyCell("إسم الشركة",font, 1));
            table3.addCell(saisir_cellule_tmp("Nom de la société",font, 1));
            table3.addCell(MyCell("نوع المواصلات",font, 1));
            table3.addCell(saisir_cellule_tmp("Type de transport",font, 1));
            table3.addCell(MyCell("العنوان", font,2));
            table3.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table3.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    if(tp.getType().equals("tn")) {
                        table3.addCell(saisir_cellule_tmp2(font,tp.getRaison_social(),2));
                        table3.addCell(saisir_cellule_tmp2(font,tp.getTypeVehicule(), 2));
                        table3.addCell(saisir_cellule_adresse( font, tp.getAdresse(),4));
                        table3.completeRow();
                    }

                }
            }else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }


        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table03 = new PdfPTable(12);
        table03.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table03.setWidthPercentage(100);
        table03.setSpacingBefore(12);
        table03.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("ET") || ns.getZf_et().equals("XD") || ns.getZf_et().equals("TR")){
            table03.addCell(saisir_cellule_titre1("الناقل (الناقلات) الدولية", 6));
            table03.addCell(saisir_cellule_titre("Transporteur(s) International", 6));

            table03.completeRow();
            //--------------------- completeRow ---------------------
            table03.addCell(MyCell("إسم الشركة",font, 2));
            table03.addCell(saisir_cellule_tmp("Nom de la société",font, 2));
            table03.addCell(MyCell("نوع المواصلات",font, 2));
            table03.addCell(saisir_cellule_tmp("Type de transport",font, 2));
            table03.addCell(MyCell("العنوان", font,2));
            table03.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table03.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    if(tp.getType().equals("ti")){
                        table03.addCell(saisir_cellule(tp.getRaison_social(), font, font, "", 4));
                        table03.addCell(saisir_cellule(tp.getTypeVehicule(), font, font, "", 4));
                        table03.addCell(saisir_cellule(tp.getAdresse(), font, font, "", 4));
                        table03.completeRow();
                    }
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table03.addCell(tmp);
            }
        }

        //--------------------- Tableau Producteur(s) ---------------------
        PdfPTable table4 =  new PdfPTable(24);


        table4.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table4.setWidthPercentage(100);
        table4.setSpacingBefore(12);
        table4.setSpacingAfter(12);
        if(ns.getZf_et().equals("XD")){
            table4.addCell(saisir_cellule_titre1("المنتج (المنتجين)",12));
            table4.addCell(saisir_cellule_titre("Producteurs", 12));

            table4.completeRow();
            //--------------------- completeRow ---------------------
            table4.addCell(MyCell("جهة الاتصال",font, 3));
            table4.addCell(saisir_cellule_tmp("Personne à contacter",font, 3));
            table4.addCell(MyCell("الهاتف ",font, 3));
            table4.addCell(saisir_cellule_tmp("Télephone ",font, 3));
            table4.addCell(MyCell("البريد الإلكتروني",font, 3));
            table4.addCell(saisir_cellule_tmp("Email",font, 3));
            table4.addCell(MyCell("العنوان", font,3));
            table4.addCell(saisir_cellule_tmp("Adresse",font, 3));
            table4.completeRow();
            if (ns.getProducteurs() != null && ns.getProducteurs().size() > 0) {
                for (Producteur tp : ns.getProducteurs()) {
                    table4.addCell(saisir_cellule(tp.getContact_fr(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getTel(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getMail(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getAdresse_fr(), font, font, "", 6));
                    table4.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Producteur.", fontbold, fontbold, "", 24);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table4.addCell(tmp);
            }
        }else {
            //--------------------- Row Title ---------------------
            if(ns.getZf_et().equals("ET")) {
                table4.addCell(saisir_cellule_titre1("مولد النفايات", 12));
                table4.addCell(saisir_cellule_titre("Producteur de déchets", 12));
            }else {
                table4.addCell(saisir_cellule_titre1("المنتج", 12));
                table4.addCell(saisir_cellule_titre("Producteur", 12));
            }

            table4.completeRow();
            //--------------------- completeRow ---------------------

            table4.addCell(MyCell("إسم الشركة", font, 4));
            table4.addCell(saisir_cellule_tmp("Nom de la société",font, 4));
            table4.addCell(MyCell("الهاتف", font,  4));
            table4.addCell(saisir_cellule_tmp("Téléphone", font,  4));
            table4.addCell(MyCell("الفاكس", font,  4));
            table4.addCell(saisir_cellule_tmp("Fax", font,  4));
            table4.completeRow();
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getNom_fr() : "-", 8));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getTel() : "-", 8));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getFax() : "-", 8));
            table4.completeRow();
            table4.addCell(MyCell("البريد الإلكتروني", font,  6));
            table4.addCell(saisir_cellule_tmp("Email", font, 6));
            table4.addCell(MyCell("جهة الاتصال", font,  6));
            table4.addCell(saisir_cellule_tmp("Personne à contacter", font, 6));
            table4.completeRow();
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getMail() : "-", 12));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getContact_fr() : "-", 12));
            table4.completeRow();
            table4.addCell(MyCell("العنوان", font,  12));
            table4.addCell(saisir_cellule_tmp("Adresse", font,  12));
            table4.completeRow();
            table4.addCell(saisir_cellule_adresse(fontbold, ns.getProducteur() != null ? ns.getProducteur().getAdresse_fr() : "-", 24));
            table4.setSpacingAfter(12);
        }


        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5 = new PdfPTable(12);
        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table5.setWidthPercentage(100);
        table5.setSpacingBefore(12);
        table5.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table5.addCell(saisir_cellule_titre1("منشأة التثمين / التخلص",6));
        table5.addCell(saisir_cellule_titre("Installation de valorisation / élimination",6));

        table5.completeRow();
        //--------------------- completeRow ---------------------
        table5.addCell( MyCell("إسم الشركة ",font,2));
        table5.addCell( saisir_cellule_tmp("Nom de la société",font,2));
        table5.addCell( MyCell("الهاتف",font,2));
        table5.addCell( saisir_cellule_tmp("Téléphone",font,2));
        table5.addCell( MyCell("البريد الإلكتروني",font,2));
        table5.addCell( saisir_cellule_tmp("Email",font,2));
        table5.completeRow();
        table5.addCell(saisir_cellule_tmp2(fontbold, ns.getEliminateur() != null ? ns.getEliminateur().getNom_fr() : "-", 4));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getTel():"-",4));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getMail():"-",4));
        table5.completeRow();
        table5.addCell( MyCell("الفاكس",font,3));
        table5.addCell( saisir_cellule_tmp("Fax",font,3));
        table5.addCell( MyCell("جهة الاتصال",font,3));
        table5.addCell( saisir_cellule_tmp("Personne à contacter",font,3));
        table5.completeRow();
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getFax():"-",6));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getContact_fr():"-",6));
        table5.completeRow();
        table5.addCell( MyCell("العنوان",font,6));
        table5.addCell( saisir_cellule_tmp("Adresse",font,6));
        table5.completeRow();
        table5.addCell( saisir_cellule_adresse(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getAdresse_fr():"-",12));
        table5.completeRow();
        table5.setSpacingAfter(12);


        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5x = new PdfPTable(12);
        table5x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table5x.setWidthPercentage(100);
        table5x.setSpacingBefore(12);

        PdfPTable table6x = new PdfPTable(12);
        table6x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table6x.setWidthPercentage(100);
        table6x.setSpacingAfter(12);
        if(ns.getZf_et().equals("ZF")) {

            //--------------------- Row Title ---------------------
            table5x.addCell(saisir_cellule_titre1("شهادة التصرف", 6));
            table5x.addCell(saisir_cellule_titre("Certificat d'élimination", 6));

            table5x.completeRow();
            if(ns.getUrl_certicat_elimination()!=null) {
                //--------------------- completeRow ---------------------
                table5x.addCell(MyCell("عدد الطرود", font, 3));
                table5x.addCell(saisir_cellule_tmp("Nombre de colis", font,  3));
                table5x.addCell(MyCell("الكمية المتوقعة", font, 3));
                table5x.addCell(saisir_cellule_tmp("Quantité prévue", font,  3));
                table5x.completeRow();
                table5x.addCell(saisir_cellule_tmp2(fontbold, ns.getNbr_colis() != null ? ns.getNbr_colis() : "-", 6));
                table5x.addCell(saisir_cellule_tmp2(fontbold, ns.getQuantite() != null ? ns.getQuantite() : "-", 6));
                table5x.completeRow();
                table6x.addCell(MyCell("تاريخ التحقق من صحة الشهادة", font, 3));
                table6x.addCell(saisir_cellule_tmp("Date de validation du certificat", font, 3));
                table6x.addCell(MyCell("الكمية",font, 3));
                table6x.addCell(saisir_cellule_tmp("Quantité",font, 3));
                table6x.completeRow();
                for (DetailDocumentMouvement dm : ns.getDocMouvement()) {
                    if (ns.getDocMouvement().size() == 0) {
                        table6x.addCell(saisir_cellule("Aucune Quantite", font, font, "", 12));
                        table6x.completeRow();
                        table6x.setSpacingAfter(12);
                    } else {
                        table6x.addCell(saisir_cellule_tmp2(fontbold, ns.getDateValidation() != null ? dateFormat.format(ns.getDateValidation()) : "", 6));
                        table6x.addCell(saisir_cellule(dm.getQuantite(), font, font, "", 6));
                        table6x.completeRow();
                        table6x.setSpacingAfter(12);
                    }
                }
            }
            else {
                table6x.addCell(saisir_cellule("", font, font, "", 12));
            }
        }

        PdfPTable tablex5 = new PdfPTable(12);
        tablex5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        tablex5.setWidthPercentage(100);
        tablex5.setSpacingBefore(12);
        tablex5.setSpacingAfter(12);
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1) {

            //--------------------- Row Title ---------------------
            tablex5.addCell(saisir_cellule_titre1("تغيير الناقل", 6));
            tablex5.addCell(saisir_cellule_titre("Changement du transporteur", 6));
            tablex5.completeRow();

            if (dt!=null && dt.getEtat() != null ) {
                //--------------------- completeRow ---------------------
                tablex5.addCell(MyCell("إسم الشركة",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Nom de la société", font,2));
                tablex5.addCell(MyCell("الهاتف ",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Télephone ",font, 2));
                tablex5.addCell(MyCell("العنوان",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Adresse", font,2));
                tablex5.completeRow();
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getNom(), font, font, "", 4));
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getTel(), font, font, "", 4));
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getAdresse(), font, font, "", 4));
                tablex5.completeRow();


            }
            else {
                PdfPCell tmpX = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 12);
                tmpX.setHorizontalAlignment(Element.ALIGN_CENTER);
                tablex5.addCell(tmpX);
            }
        }



        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الأجزاء المصاحبة للطلب",6));
        table7.addCell(saisir_cellule_titre("Piéces accompagnant la demande",6));
        table7.completeRow();

        //table7.addCell(new Paragraph(Chunk.NEWLINE));
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }

        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table6 = new PdfPTable(12);
        table6.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table6.setWidthPercentage(100);
        table6.setSpacingBefore(12);
        table6.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table6.addCell(saisir_cellule_titre1("وثيقة حركة النفايات",6));
        table6.addCell(saisir_cellule_titre("Document de mouvements des déchets",6));
        table6.completeRow();
        //--------------------- completeRow ---------------------
        table6.addCell( MyCell("الكمية الفعلية",font,2));
        table6.addCell( saisir_cellule_tmp("Quantité réelle",font,2));
        table6.addCell( MyCell("الوحدة",font,2));
        table6.addCell( saisir_cellule_tmp("Unité",font,2));
        table6.addCell( MyCell("عدد الطرود",font,2));
        table6.addCell( saisir_cellule_tmp("Nombre de colis",font,2));
        table6.completeRow();
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite_reel()!=null ? ns.getQuantite_reel() :"",4));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",4));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getNbr_colis()!=null?ns.getNbr_colis():"",4));
        table6.completeRow();
        table6.addCell( MyCell("التاريخ الفعلي للشحن",font,3));
        table6.addCell( saisir_cellule_tmp("Date réelle de l'expédition",font,3));
        table6.addCell( MyCell("المكان الفعلي للتثمين / التخلص",font,3));
        table6.addCell( saisir_cellule_tmp("Lieu effectif de l'élimination/valorisation",font,3));
        table6.completeRow();
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getDate_reel()!=null ? dateFormat.format(ns.getDate_reel()):"",6));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getLieux_elimination()!=null?ns.getLieux_elimination().getNom_fr():ns.getLieu(),6));
        table6.completeRow();
        table6.setSpacingAfter(12);

        String num_notification = ns.getNum_notification()!=null?ns.getNum_notification():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_imp/"
                + ns.getId_notification(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);




        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table1);
        document.add(table02);
        document.add(table2);
        document.add(table3);
        document.add(table03);
        document.add(table4);
        document.add(table5);
        document.add(table6);
        document.add(table5x);
        document.add(table6x);
        document.add(tablex5);
        document.add(table7);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }


}
