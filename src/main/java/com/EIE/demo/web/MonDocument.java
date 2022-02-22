package com.EIE.demo.web;

import com.EIE.demo.dataService.QRCodeGenerator;
import com.EIE.demo.model.*;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BarcodeQRCode;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;
import org.springframework.beans.factory.annotation.Value;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.net.URISyntaxException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MonDocument {
    @Value("${url}")
    private static String urlRest;
    private final static String url = urlRest;

    public enum TextOrientation {
        LTR, RTL
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
    private static void setOrientation(XWPFParagraph par, TextOrientation orientation) {
        if (par.getCTP().getPPr() == null) {
            par.getCTP().addNewPPr();
        }
        if (par.getCTP().getPPr().getBidi() == null) {
            par.getCTP().getPPr().addNewBidi();
        }
        par.getCTP().getPPr().getBidi().setVal(orientation == TextOrientation.RTL ? STOnOff.ON : STOnOff.OFF);
    }
    public static void setSingleLineSpacing(XWPFParagraph para) {
        CTPPr ppr = para.getCTP().getPPr();
        if (ppr == null)
            ppr = para.getCTP().addNewPPr();
        CTSpacing spacing = ppr.isSetSpacing() ? ppr.getSpacing() : ppr.addNewSpacing();
        spacing.setAfter(BigInteger.valueOf(0));
        spacing.setBefore(BigInteger.valueOf(0));
        spacing.setLineRule(STLineSpacingRule.AUTO);
        spacing.setLine(BigInteger.valueOf(240));
    }

    //
    public static ByteArrayInputStream generateInvitationWord(CollecteTransporteur ct) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("قرار");
        runIla.setFontSize(14);
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun();
        run0.setBold(true);
        run0.setText("لوزير الطاقة والمعادن والبيئة ");
        run0.setFontSize(14);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun();
        run1.setBold(true);
        run1.setText(" رقم " + ct.getNum_demande() + "/2020");
        run1.setFontSize(14);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2 = paragraph2.createRun();
        run2.setBold(true);
        run2.setText("لترخيص جمع ونقل النفايات");
        run2.setFontSize(14);
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe = document.createParagraph();
        XWPFRun runn = paragraphe.createRun();
        runn.setBold(true);
        runn.setText("*****");
        runn.setFontSize(14);
        runn.addBreak();
        runn.setFontFamily("Times New Roman");
        paragraphe.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraphe, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe00 = document.createParagraph();
        XWPFRun run00 = paragraphe00.createRun();
        run00.setBold(true);
        run00.setText(": وزير الطاقة والمعادن والبيئة ");
        run00.setFontSize(14);
        run00.setFontFamily("Times New Roman");
        paragraphe00.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraphe00, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun();
        run3.setText("-\tبناء على قرار وزير الطاقة والمعادن والبيئة رقم " + ct.getNum_demande() + " المتعلق بالاختصاصات وزير الطاقة والمعادن والبيئة ");
        run3.setFontSize(12);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph3, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun();
        run4.setText("-");
        run4.addTab();
        run4.setText(" وعلى القانون رقم 28-00 المتعلق بتدبير النفايات والتخلص منها الصادر بتنفيذه الظهير الشريف رقم 1-06-153 بتاريخ 30 شوال 22)1427 نونبر (2000");
        run4.setFontSize(12);
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun();
        run5.setText("-");
        run5.addTab();
        run5.setText("وعلى المرسوم رقم 2-07-253 صادر في 14 من رجب 18)1429 يوليو (2008 المتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة؛");
        run5.setFontSize(12);
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph6 = document.createParagraph();
        XWPFRun run6 = paragraph6.createRun();
        run6.setText("-");
        run6.addTab();
        run6.setText(" وعلى المرسوم رقم 2-14-85 الصادر في 28 من ربيع الأول 20)1436 يناير (2015 المتعلق بتدبير النفايات الخطرة");
        run6.setFontSize(12);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph6, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph7 = document.createParagraph();
        XWPFRun run7 = paragraph7.createRun();
        run7.setText("-");
        run7.addTab();
        run7.setText(" وعلى قرار الوزيرة المنتدبة لدى وزير الطاقة والمعادن والماء والبيئة المكلفة بالبيئة رقم 3184.15 الصادر في 9 ذي الحجة 23)1436 سبتمبر (2015 المتعلق بتطبيق المواد 5 و 6 و7 و11 من المرسوم رقم 85-14-2 المشار إليه أعلاه؛");
        run7.setFontSize(12);
        paragraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph7, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph8 = document.createParagraph();
        XWPFRun run8 = paragraph8.createRun();
        run8.setText("-");
        run8.addTab();
        run8.setText("و على الظهير الشريف رقم 1.63.260 الصادر في 24 جمادى الثانية 12)1383 نوفمبر (1963 بشان النقل بواسطة السيارات عبر الطرق، كما تم تغييره وتتميمه؛");
        run8.setFontSize(12);
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph9 = document.createParagraph();
        XWPFRun run9 = paragraph9.createRun();
        run9.setText("-");
        run9.addTab();
        String date2 = "";
        if(ct.getDateDepot()!=null){
            date2 = dateFormat.format(ct.getDateValidation());
        }
        run9.setText( " وعلى رأي اللجنة المكونة من ممثلي السلطات الحكومية المكلفة بالصحة والفلاحة والنقل والبيئة خلال الاجتماع المنعقد بمقر بقطاع البيئة "+"بتاريخ "+ date2 +" ");
        paragraph9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph9, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph10 = document.createParagraph();
        XWPFRun run10 = paragraph10.createRun();
        run10.setText("\t: قرر ما يلي -");
        run10.setFontSize(12);
        paragraph10.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph10, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph11 = document.createParagraph();
        XWPFRun run11 = paragraph11.createRun();
        run11.setText("-\t المادة الأولى: تمنح رخصة لجمع ونقل النفايات الخطرة المحددة في اللائحة خلفه لشركة " + ct.getRaison() + " ");
        run11.setFontSize(12);
        paragraph11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph11, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph12 = document.createParagraph();
        XWPFRun run12 = paragraph12.createRun();
        run12.setText("-");
        run12.addTab();
        run12.setText("المادة الثانية:  يلتزم صاحب رخصة جمع ونقل النفايات الخطرة، باحترام القوانين والمعايير المتعلقة بهذا المجال");
        run12.setFontSize(12);
        paragraph12.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph12, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph13 = document.createParagraph();
        XWPFRun run13 = paragraph13.createRun();
        run13.setText("-\tالمادة الثالثة:  يمنح هذا الترخيص لمدة أقصاها خمس ");
        run13.setText("(5)");
        run13.setText(" سنوات قابلة للتجديد ابتداء من تاريخ صدورها؛");
        run13.setFontSize(12);
        paragraph13.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph13, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph14 = document.createParagraph();
        XWPFRun run14 = paragraph14.createRun();
        run14.setText(" - \t  المادة الرابعة: كل مخالفة للمقتضيات القانونية المذكورة أعلاه تعرض المعني بالأمر للعقوبة المنصوص عليها في القوانين الجاري بها العمل");
        run14.setText(" وتسحب منه الرخصة ولا يمكن لصاحبها المطالبة بأي تعويض كيفما كان نوعه؛");
        run14.setFontSize(12);
        run14.addBreak();
        paragraph14.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph14, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph15 = document.createParagraph();
        XWPFRun run15 = paragraph15.createRun();
        run15.setText("وحرر بالرباط في"+ dateFormat.format(new Date()) +" ");
        run15.setFontSize(12);
        paragraph15.setAlignment(ParagraphAlignment.RIGHT);
        setOrientation(paragraph15, TextOrientation.RTL);

//=====================================================================================================

        // 2éme Page //

        // Add new Paragraph to document
        XWPFParagraph paragraph30 = document.createParagraph();
        XWPFRun run30 = paragraph30.createRun();
        run30.setText(" لائحة النفايات الخطرة المرخص جمعها و نقلها ");
        run30.setText("Liste des déchets dangereux autorisé");
        run30.setText("                                    ");
        run30.setFontSize(14);
        paragraph30.setAlignment(ParagraphAlignment.BOTH);
        setOrientation(paragraph30, TextOrientation.RTL);

        List<Vehicules> v = ct.getVehicules();


        XWPFTable tab = document.createTable();
        XWPFTableRow row = tab.getRow(0); // First row
        CTTblWidth width = tab.getCTTbl().addNewTblPr().addNewTblW();
        width.setType(STTblWidth.DXA);
        width.setW(BigInteger.valueOf(10900));
        // Columns
        row.getCell(0).setText("Véhicules autorisés");
        row.addNewTableCell().setText("Code selon le catalogue marocain des déchets");
        row.addNewTableCell().setText("Type de déchet");
        for(int i = 0; i < v.size(); i++){

            row = tab.createRow(); // Second Row
            row.getCell(0).setText(v.get(i).getNum_matricule());
            row.getCell(1).setText(v.get(i).getPoint_net());
            row.getCell(2).setText(v.get(i).getPoit_totale_charge());
        }

        //============= Fusion ==========================================


        XWPFParagraph paragraph36 = document.createParagraph();
        XWPFRun run36 = paragraph36.createRun();
        run36.setText("");
        run36.setFontSize(10);
        run36.addBreak();
        run36.addBreak();
        run36.setFontFamily("Times New Roman");
        paragraph36.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph36, TextOrientation.LTR);

        XWPFParagraph paragraph37 = document.createParagraph();
        XWPFRun run37 = paragraph37.createRun();
        run37.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        run37.setFontSize(10);
        run37.setFontFamily("Times New Roman");
        paragraph37.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph37, TextOrientation.LTR);
        paragraph37.setBorderTop(Borders.BASIC_WIDE_INLINE);
        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);




       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateDocumentExportationLettreConsentement(Notification n,String urlRest) throws IOException, InvalidFormatException, URISyntaxException, BadElementException, WriterException {
        // init document
        // init document
        XWPFDocument document = new XWPFDocument();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("A");
        runIla.addBreak();
        runIla.setText(n.getImportateur().getGenre() +" "+ n.getImportateur().getQualite());
        runIla.addBreak();
        runIla.setText("De la Societe "+n.getImportateur()!=null?n.getImportateur().getNom_fr():"-"+ " "+n.getAutorite()!=null?n.getAutorite().getAdresse():"-");
        runIla.setFontSize(18);
        runIla.setFontFamily("Sakkal Majalla");
        runIla.addBreak();
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph1 = document.createParagraph();
        XWPFRun run1 = Paraghraph1.createRun();
        XWPFRun run1x = Paraghraph1.createRun();
        run1.setBold(true);
        run1.setText("object :");
        run1.setFontSize(15);
        run1x.setText("Exportation de "+n.getQuantite()+" "+n.getUnite().getNom_fr()+ " de déchets "+n.getClassification().getNom_fr()+" pour "+n.getNom());
        run1x.setFontSize(15);
        run1x.setFontFamily("Sakkal Majalla");
        run1x.addBreak();
        Paraghraph1.setAlignment(ParagraphAlignment.LEFT);



        // Add new Paragraph to document
        XWPFParagraph Paraghraph3 = document.createParagraph();
        XWPFRun run4 = Paraghraph3.createRun();
        XWPFRun run5 = Paraghraph3.createRun();
        run4.setBold(true);
        run4.setText("P.J : ");
        run5.setText("Document de notification (1): "+n.getNum_notification());
        run5.setFontSize(15);
        run4.setFontSize(15);
        run4.setFontFamily("Sakkal Majalla");
        run5.setFontFamily("Sakkal Majalla");
        run5.addBreak();
        Paraghraph3.setAlignment(ParagraphAlignment.LEFT);
        String Adresse= n.getEliminateur()!=null?n.getEliminateur().getAdresse_fr():"";
        // Add new Paragraph to document
        XWPFParagraph Paraghraph5 = document.createParagraph();
        XWPFRun run7 = Paraghraph5.createRun();
        run7.setText("Suite à la demande de transfert de déchets "+n.getClassification().getNom_fr()+" vers "+Adresse+" formulée par "+n.getNom()+", j'ai l'honneur de vous informer que le Maroc en tant que partie contractente à la Convention de Bâle, et ne disposant pas d'installations d'élimination et de traitement des déchets "+n.getClassification().getNom_fr() +" donne son consentement pour l'exportation de "+n.getQuantite()+" "+n.getUnite().getNom_fr()+" de déchet dangereux en vue de leur valorisation au sein de la société "+n.getNom()+" spécialisée dans le traitement et la valorisation des déchets "+n.getClassification().getNom_fr() +" .");
        run7.setFontSize(15);
        run7.setFontFamily("Sakkal Majalla");
        run7.addBreak();
        Paraghraph5.setAlignment(ParagraphAlignment.LEFT);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph6 = document.createParagraph();
        XWPFRun run8 = Paraghraph6.createRun();
        run8.setText("Par ailleurs, la Société "+n.getNom()+" a l’entière responsabilité sur tout dommage ou impact négatif sur l’environnement ou la santé publique qui peut être engendré par le transport de ces déchets au Maroc.");
        run8.addBreak();
        run8.setText("Veuillez agréer, Monsieur, l’expression de mes salutations distinguées");
        run8.setFontSize(15);
        run8.setFontFamily("Sakkal Majalla");

        Paraghraph6.setAlignment(ParagraphAlignment.LEFT);



        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.createParagraph();
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);


        //QRCODE

        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph paragraphFooter = footer.createParagraph();
        XWPFRun runFooter = paragraphFooter.createRun();
        try {
            byte[] bs = QRCodeGenerator.getQRCodeImage(urlRest+"/DownloadFile/"+n.getId_notification()+"/"+n.getZf_et()+"/"+3, 500,
                    500);
            runFooter.addPicture(new ByteArrayInputStream(bs), XWPFDocument.PICTURE_TYPE_PNG, "/qrMinistere.png", Units.toEMU(60),
                    Units.toEMU(60));
            setOrientation(paragraphFooter, MonDocument.TextOrientation.LTR);
            paragraphFooter.setAlignment(ParagraphAlignment.LEFT);
        } catch (WriterException e) {
            e.printStackTrace();
        }

       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateExport(Notification n) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("إلى ");
        runIla.setFontSize(18);
        runIla.setFontFamily("Sakkal Majalla");
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph1 = document.createParagraph();
        XWPFRun run1 = Paraghraph1.createRun();
        run1.setBold(true);
        String importeur = "...";
        if(n.getImportateur().getNom_fr() != null){
            importeur = n.getImportateur().getNom_fr();
        }
        run1.setText("السيد " + importeur);
        run1.setFontSize(18);
        run1.setFontFamily("Sakkal Majalla");
        run1.addBreak();
        Paraghraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph2 = document.createParagraph();
        XWPFRun run2 = Paraghraph2.createRun();
        XWPFRun run3 = Paraghraph2.createRun();
        run2.setBold(true);
        run2.setText( "الموضوع : ");
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
            classification = n.getClassification().getNom_fr();
        }
        run3.setText( " تصدير " + quantite + " " + unite );
        run3.setText(" من النفايات " + classification);
        run2.setFontFamily("Sakkal Majalla");
        run3.setFontFamily("Sakkal Majalla");
        run3.setFontSize(16);
        run2.setFontSize(18);
        Paraghraph2.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph2, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph3 = document.createParagraph();
        XWPFRun run4 = Paraghraph3.createRun();
        XWPFRun run5 = Paraghraph3.createRun();
        run4.setBold(true);
        run4.setText("المرفقات : ");
        String notification = "...";
        if(n.getNum_notification() != null){
            notification = n.getNum_notification();
        }
        run5.setText("ورقة الاخطار 1: " + notification);
        run5.setFontSize(16);
        run4.setFontSize(18);
        run4.setFontFamily("Sakkal Majalla");
        run5.setFontFamily("Sakkal Majalla");
        run5.addBreak();
        Paraghraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph3, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph4 = document.createParagraph();
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
        XWPFRun run6 = Paraghraph4.createRun();
        run6.setText("جوابا على طلب نقل النفايات من" + date1 + "إلى " + date2 + "الصادر من طرف شركة" + n.getImportateur().getNom_fr() + "، يشرفني أن أخبركم أن المغرب بصفته طرفا متعاقدا في اتفاقية بازل، ولا  يتوفر على منشآت للتخلص ومعالجة النفايات" + importeur2 + " لاسيما " +classification + " ، يعطي موافقته على تصدير" + quantite + " " + unite + " من النفايات " + classification + " من أجل تثمينها بشركة" + importeur2 + " المتخصصة في معالجة وتثمين هذه النفايات الموجودة في" + lieu);
        run6.setFontSize(16);
        run6.setFontFamily("Sakkal Majalla");
        Paraghraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph4, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph5 = document.createParagraph();
        XWPFRun run7 = Paraghraph5.createRun();
        run7.setText("ومن جهة أخرى، تتحمل شركة " + importeur2 + " المسؤولية الكاملة عن أي ضرر أو تأثير سلبي على البيئة أو الصحة .العمومية قد ينجم عن نقل هذه النفايات إلى المغرب");
        run7.setFontSize(16);
        run7.setFontFamily("Sakkal Majalla");
        run7.addBreak();
        Paraghraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph6 = document.createParagraph();
        XWPFRun run8 = Paraghraph6.createRun();
        run8.setBold(true);
        run8.setText("وتقبلوا خالص تحياتي، السيد " + importeur2);
        run8.setFontSize(18);
        run8.setFontFamily("Sakkal Majalla");

        Paraghraph6.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph6, TextOrientation.RTL);



        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);



        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph paragraphFooter = footer.getParagraphArray(0);
        XWPFRun runFooter = paragraphFooter.createRun();
        try {
            byte[] bs = QRCodeGenerator.getQRCodeImage(urlRest+"/DownloadFile/"+n.getId_notification()+"/"+n.getZf_et()+"/"+1, 500,
                    500);
            runFooter.addPicture(new ByteArrayInputStream(bs), XWPFDocument.PICTURE_TYPE_PNG, "/qrMinistere.png", Units.toEMU(60),
                    Units.toEMU(60));
            setOrientation(paragraphFooter, MonDocument.TextOrientation.LTR);
            paragraphFooter.setAlignment(ParagraphAlignment.LEFT);
        } catch (WriterException e) {
            e.printStackTrace();
        }
       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateExport_lettreAvis(Notification n,String urlRest) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("A");
        runIla.addBreak();
        runIla.setText(n.getImportateur().getGenre() +" "+ n.getImportateur().getQualite());
        runIla.addBreak();
        runIla.setText("De la Societe "+n.getImportateur().getNom_fr()!=null?n.getImportateur().getNom_fr()!=null ? n.getImportateur().getNom_fr():"" :"" + " "+n.getAutorite().getAdresse()!=null?n.getAutorite().getAdresse():"");
        runIla.setFontSize(18);
        runIla.setFontFamily("Sakkal Majalla");
        runIla.addBreak();
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph1 = document.createParagraph();
        XWPFRun run1 = Paraghraph1.createRun();
        XWPFRun run1x = Paraghraph1.createRun();
        run1.setBold(true);
        run1.setText("object :");
        run1.setFontSize(15);
        run1x.setText("Exportation de "+n.getQuantite()+" "+n.getUnite().getNom_fr()+ " de déchets "+n.getClassification().getNom_fr()+" contenants des substances dangereuses pour valorisation.");
        run1x.setFontSize(15);
        run1x.setFontFamily("Sakkal Majalla");
        run1x.addBreak();
        Paraghraph1.setAlignment(ParagraphAlignment.LEFT);



        // Add new Paragraph to document
        XWPFParagraph Paraghraph3 = document.createParagraph();
        XWPFRun run4 = Paraghraph3.createRun();
        XWPFRun run5 = Paraghraph3.createRun();
        run4.setBold(true);
        run4.setText("P.J : ");
        run5.setText("dossier de notification"+n.getNum_notification());
        run5.setFontSize(15);
        run4.setFontSize(15);
        run4.setFontFamily("Sakkal Majalla");
        run5.setFontFamily("Sakkal Majalla");
        run5.addBreak();
        Paraghraph3.setAlignment(ParagraphAlignment.LEFT);
        // Add new Paragraph to document
        XWPFParagraph Paraghraph4 = document.createParagraph();
        XWPFRun run6 = Paraghraph4.createRun();
        run6.setText("Suite à la demande de transfert de déchets "+n.getClassification().getNom_fr()+" vers "+n.getImportateur().getAdresse_fr()!=null ? n.getImportateur().getAdresse_fr():""+" formulée par "+n.getNom()+", je vous faits parvenir ci joint le dossier de notification de transferts transfrontaliers de déchets N° "+n.getNum_notification());
        run6.setFontSize(15);
        run6.setFontFamily("Sakkal Majalla");
        Paraghraph4.setAlignment(ParagraphAlignment.LEFT);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph5 = document.createParagraph();
        XWPFRun run7 = Paraghraph5.createRun();
        run7.setText("L’avis de l’autorité compétente chargée de l’Environnement relevant du Ministère de l’Energie, des Mines et de l’Environnement -Département de l’Environnement- vous parviendra dès instruction complète de la demande. ");
        run7.setFontSize(15);
        run7.setFontFamily("Sakkal Majalla");
        run7.addBreak();
        Paraghraph5.setAlignment(ParagraphAlignment.LEFT);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph6 = document.createParagraph();
        XWPFRun run8 = Paraghraph6.createRun();
        run8.setText("A cet effet, je vous saurais grès de bien vouloir donner votre avis concernant la réalisation de cette opération.");
        run8.addBreak();
        run8.setText("En restant à votre disposition pour toute information supplémentaire, je vous prie d’agréer, Monsieur, l’expression de mes salutations distinguées");
        run8.setFontSize(15);
        run8.setFontFamily("Sakkal Majalla");

        Paraghraph6.setAlignment(ParagraphAlignment.LEFT);



        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

       XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.createParagraph();
        XWPFRun runx=px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
       XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
               XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
       px.setAlignment(ParagraphAlignment.CENTER);



        //QRCODE

        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph paragraphFooter = footer.createParagraph();
        XWPFRun runFooter = paragraphFooter.createRun();
        try {
            byte[] bs = QRCodeGenerator.getQRCodeImage(urlRest+"/DownloadFile/"+n.getId_notification()+"/"+n.getZf_et()+"/"+2, 500,
                    500);
            runFooter.addPicture(new ByteArrayInputStream(bs), XWPFDocument.PICTURE_TYPE_PNG, "/qrMinistere.png", Units.toEMU(60),
                    Units.toEMU(60));
            setOrientation(paragraphFooter, MonDocument.TextOrientation.LTR);
            paragraphFooter.setAlignment(ParagraphAlignment.LEFT);
        } catch (WriterException e) {
            e.printStackTrace();
        }

       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateTransit(Notification n) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(450L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(450L));
        pageMar.setBottom(BigInteger.valueOf(1440L));

        // Add new Paragraph to document
        XWPFParagraph Paraghraph1 = document.createParagraph();
        XWPFRun run1 = Paraghraph1.createRun();
        run1.setBold(true);
        String nom = "...";
        if(n.getImportateur().getNom_fr()!=null){
            nom = n.getImportateur().getNom_fr();
        }
        run1.setText("إلى السيد " + nom);
        run1.setFontSize(14);
        run1.addBreak();
        Paraghraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph2 = document.createParagraph();
        XWPFRun run2 = Paraghraph2.createRun();
        XWPFRun run3 = Paraghraph2.createRun();
        run2.setBold(true);
        run2.setText("الموضوع:");
        run2.setText(" ");
        run3.setText("عبور النفايات الخطرة عبر الحدود ");
        String num = "...";
        if(n.getNum_notification() !=null){
            num = n.getNum_notification();
        }
        run3.setText(" رقم الاخطار " + num);
        run3.setFontSize(12);
        run2.setFontSize(12);
        Paraghraph2.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph2, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph Paraghraph4 = document.createParagraph();
        XWPFRun run6 = Paraghraph4.createRun();
        XWPFRun run66 = Paraghraph4.createRun();
        String date2 = "...";
        if(n.getDateValidation()!=null){
            date2 = dateFormat.format(n.getDateValidation().getTime());
        }
        run6.setText(" المرجع:");
        run6.setBold(true);
        run66.setText("ارساليتكم رقم " + n.getNum_notification() + " بتاريخ" + date2);
        run6.setFontSize(12);
        run66.setFontSize(12);
        Paraghraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph4, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph Paraghraph3 = document.createParagraph();
        XWPFRun run4 = Paraghraph3.createRun();
        XWPFRun run5 = Paraghraph3.createRun();
        run4.setBold(true);
        run4.setText("المرفقات:");
        run5.setText("-وثيقة الاخطار ");
        run5.setFontSize(12);
        run4.setFontSize(12);
        Paraghraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph3, TextOrientation.RTL);



        // Add new Paragraph to document
        XWPFParagraph Paraghraph5 = document.createParagraph();
        XWPFRun run7 = Paraghraph5.createRun();
        run7.addTab();
        run7.setText("- شكل التقرير ");
        run7.setFontSize(12);
        run7.addBreak();
        Paraghraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph6 = document.createParagraph();
        XWPFRun run8 = Paraghraph6.createRun();
        run8.setText("سلام تام بوجود مولانا الإمام");
        run8.setFontSize(14);
        run8.setBold(true);
        Paraghraph6.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph6, TextOrientation.RTL);



        // Add new Paragraph to document
        XWPFParagraph Paraghraph7 = document.createParagraph();
        XWPFRun run9 = Paraghraph7.createRun();
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

        run9.setText(" وبعد، تبعا لارساليتكم المتعلقة بطلب الاذن بعبور " + quantite + " " + unite + " من النفايات " + classification + " عبر المغرب. يشرفني أن أخبركم أنه ليس لدينا أي اعتراض بخصوص هذا الموضوع وموافقتنا لعملية عبور هاته النفايات عبر بلادنا '' طنجة المتوسط'' للتخلص منها بشركة " + importateur + " شرط مراعاة الشروط التالية:");
        run9.setFontSize(12);
        run9.addBreak();
        Paraghraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph7, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph8 = document.createParagraph();
        XWPFRun run10 = Paraghraph8.createRun();
        run10.addTab();
        run10.setText("- احترام إجراءات المنظمة البحرية الدولية ، وهي: ");
        run10.setFontSize(12);
        Paraghraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph8, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph9 = document.createParagraph();
        XWPFRun run11 = Paraghraph9.createRun();
        run11.setText("• ارسال إلى المديرية العامة للموانئ والملاحة التجارية كل ست ساعات ابتداء من انطلاق السفينة، التقرير المرفق معبأ بشكل صحيح ");
        run11.setFontSize(12);
        run11.addTab();
        Paraghraph9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph9, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph10 = document.createParagraph();
        XWPFRun run12 = Paraghraph10.createRun();
        run12.setText("• الاشتراك في تأمين نادي " + " P & I " +  " )تأمين يغطي الأضرار في حالة التلوث بسبب المخابئ ( " );
        run12.setFontSize(12);
        Paraghraph10.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph10, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph11 = document.createParagraph();
        XWPFRun run13 = Paraghraph11.createRun();
        run13.addTab();
        run13.setText("- التحقق لدى ميناء طنجة المتوسط بشأن نظام الاستغلال الخاصة به وإبلاغه بتاريخ مغادرة السفينة والوقت المتوخين للعبور عبر الميناء المذكور ");
        run13.setFontSize(12);
        Paraghraph11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph11, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph12 = document.createParagraph();
        XWPFRun run14 = Paraghraph12.createRun();
        run14.addTab();
        run14.setText("- تعبئة النفايات الخطرة ووضع بطاقات التعريف عليها وفقًا للأنظمة والمعايير الدولية كما يجب تعبئتها في حاويات ");
        run14.setFontSize(12);
        Paraghraph12.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph12, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph13 = document.createParagraph();
        XWPFRun run15 = Paraghraph13.createRun();
        run15.addTab();
        String lieu = "...";
        if(n.getLieu() != null){
            lieu = n.getLieu();
        }
        run15.setText("- إذا كانت عملية النقل هذه ستتضمن أيضًا عمليات إعادة الشحن، فيجب إنزال الحاويات في إحدى محطات الحاويات في ميناء طنجة المتوسط قبل ارسالها نحو " + lieu);
        run15.setFontSize(12);
        Paraghraph13.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph13, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph14 = document.createParagraph();
        XWPFRun run16 = Paraghraph14.createRun();
        run16.addTab();
        run16.setText(" يجب أن تحمل السفن التي تنقل هذه النفايات الخطرة على متنها وثائق تثبت النقل الآمن لهذا النوع من النفايات وغيرها من الوثائق التنظيمية التي تتطلبها اتفاقية بازل، والمدونة الدولية لنقل البضائع الخطرة رمز والقوانين الوطنية ذات الصلة ");
        run16.setFontSize(13);
        Paraghraph14.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph14, TextOrientation.RTL);
        run16.addBreak();
        run16.addBreak();
        run16.addBreak();
        // Add new Paragraph to document
        XWPFParagraph Paraghraph16 = document.createParagraph();
        XWPFRun run18 = Paraghraph16.createRun();
        run18.setBold(true);
        run18.setText("وتفضلوا، السيد المدير، بقبول فائق الاحترام والتقدير");
        run18.setFontSize(14);
        Paraghraph16.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph16, TextOrientation.RTL);







        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);




        //QRCODE

        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph paragraphFooter = footer.getParagraphArray(0);
        XWPFRun runFooter = paragraphFooter.createRun();
        try {
            byte[] bs = QRCodeGenerator.getQRCodeImage(urlRest+"/DownloadFile/"+n.getId_notification()+"/"+n.getZf_et()+"/"+1, 500,
                    500);
            runFooter.addPicture(new ByteArrayInputStream(bs), XWPFDocument.PICTURE_TYPE_PNG, "/qrMinistere.png", Units.toEMU(60),
                    Units.toEMU(60));
            setOrientation(paragraphFooter, MonDocument.TextOrientation.LTR);
            paragraphFooter.setAlignment(ParagraphAlignment.LEFT);
        } catch (WriterException e) {
            e.printStackTrace();
        }
       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateInstallation(Installation ct) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("قرار");
        runIla.setFontSize(14);
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun();
        run0.setBold(true);
        run0.setText("لوزير الطاقة والمعادن والبيئة ");
        run0.setFontSize(14);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun();
        run1.setBold(true);
        run1.setText(" رقم " + ct.getNum_demande() + "/2020");
        run1.setFontSize(14);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2 = paragraph2.createRun();
        run2.setBold(true);
        run2.setText(" بترخيص لمعالجة النفايات الخطرة لشركة "+ ct.getRaison());
        run2.setFontSize(14);
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe00 = document.createParagraph();
        XWPFRun run00 = paragraphe00.createRun();
        run00.setBold(true);
        run00.setText("وزير الطاقة والمعادن والبيئة ");
        run00.setFontSize(14);
        run00.setFontFamily("Times New Roman");
        paragraphe00.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraphe00, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun();
        run3.setText("-\tبناء على قرار وزير الطاقة والمعادن والبيئة رقم " + ct.getNum_demande() + " المتعلق بالاختصاصات وزير الطاقة والمعادن والبيئة ");
        run3.setFontSize(12);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph3, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun();
        run4.setText("-");
        run4.addTab();
        run4.setText(" وعلى القانون رقم 28-00 المتعلق بتدبير النفايات والتخلص منها الصادر بتنفيذه الظهير الشريف رقم 1-06-153 بتاريخ 30 شوال 22)1427 نونبر (2006");
        run4.setFontSize(12);
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun();
        run5.setText("-");
        run5.addTab();
        run5.setText("وعلى المرسوم رقم 2-07-253 صادر في 14 من رجب 18)1429 يوليو (2008 المتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة؛");
        run5.setFontSize(12);
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph6 = document.createParagraph();
        XWPFRun run6 = paragraph6.createRun();
        run6.setText("-");
        run6.addTab();
        run6.setText(" وعلى المرسوم رقم 2-14-85 الصادر في 28 من ربيع الأول 20)1436 يناير (2015 المتعلق بتدبير النفايات الخطرة");
        run6.setFontSize(12);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph6, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph7 = document.createParagraph();
        XWPFRun run7 = paragraph7.createRun();
        run7.setText("-");
        run7.addTab();
        run7.setText(" وعلى قرار الوزيرة المنتدبة لدى وزير الطاقة والمعادن والماء والبيئة المكلفة بالبيئة رقم 3184.15 الصادر في 9 ذي الحجة 23)1436 سبتمبر (2015 المتعلق بتطبيق المواد 5 6 7 و11 من المرسوم رقم 85-14-2 المشار إليه أعلاه؛");
        run7.setFontSize(12);
        paragraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph7, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph8 = document.createParagraph();
        XWPFRun run8 = paragraph8.createRun();
        run8.setText("-");
        run8.addTab();
        run8.setText("وعلى تقرير اللجنة المكونة من ممثلي السلطات الحكومية المكلفة بالبيئة خلال الزيارة الميدانية لشركة"  + ct.getRaison() + " ");
        run8.setFontSize(12);
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph10 = document.createParagraph();
        XWPFRun run10 = paragraph10.createRun();
        run10.setText("\t: قرر ما يلي");
        run10.setFontSize(12);
        paragraph10.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph10, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph11 = document.createParagraph();
        XWPFRun run11 = paragraph11.createRun();
        run11.setText(" -");
        String date2 = "...";
        if(ct.getDateDepot()!=null){
            date2 = dateFormat.format(ct.getDateValidation());
        }
        run11.setText("المادة الأولى: تمنح رخصة لمعالجة النفايات الخطرة المحددة في اللائحة خلفه لشركة " + ct.getRaison() + " المتواجدة ب " + ct.getAdresse() + "بتاريخ" + date2);
        run11.setFontSize(12);
        paragraph11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph11, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph12 = document.createParagraph();
        XWPFRun run12 = paragraph12.createRun();
        run12.setText(" -");
        run12.setText("المادة الثانية: يلتزم صاحب الرخصة باحترام القوانين والمعايير المتعلقة بهذا المجال");
        run12.setFontSize(12);
        paragraph12.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph12, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph13 = document.createParagraph();
        XWPFRun run13 = paragraph13.createRun();
        run13.setText(" -");
        run13.setText("المادة الثالثة: يمنح هذا الترخيص لمدة أقصاها خمس (5) سنوات قابلة للتجديد ابتداء من تاريخ صدورها؛ ");
        run13.setFontSize(12);
        paragraph13.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph13, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph14 = document.createParagraph();
        XWPFRun run14 = paragraph14.createRun();
        run14.setText(" -");
        run14.setText("المادة الرابعة: كل مخالفة للمقتضيات القانونية المذكورة أعلاه تعرض المعني بالأمر للعقوبة المنصوص عليها في القوانين الجاري بها العمل وتسحب منه الرخصة ولا يمكن لصاحبها المطالبة بأي تعويض كيفما كان نوعه؛");
        run14.setFontSize(12);
        run14.addBreak();
        paragraph14.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph14, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph15 = document.createParagraph();
        XWPFRun run15 = paragraph15.createRun();
        run15.setText("وحرر بالرباط في"+ dateFormat.format(new Date()) +" ");
        run15.setFontSize(12);
        paragraph15.setAlignment(ParagraphAlignment.RIGHT);
        setOrientation(paragraph15, TextOrientation.RTL);

//=====================================================================================================


        //============= Fusion ==========================================


        XWPFParagraph paragraph36 = document.createParagraph();
        XWPFRun run36 = paragraph36.createRun();
        run36.setText("");
        run36.setFontSize(10);
        run36.addBreak();
        run36.addBreak();
        run36.setFontFamily("Times New Roman");
        paragraph36.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph36, TextOrientation.LTR);

        XWPFParagraph paragraph37 = document.createParagraph();
        XWPFRun run37 = paragraph37.createRun();
        run37.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        run37.setFontSize(10);
        run37.setFontFamily("Times New Roman");
        paragraph37.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph37, TextOrientation.LTR);
        paragraph37.setBorderTop(Borders.BASIC_WIDE_INLINE);
        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);

        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream reunionComites(CollecteTransporteur ct) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("قرار");
        runIla.setFontSize(14);
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun();
        run0.setBold(true);
        run0.setText("لوزير الطاقة والمعادن والبيئة ");
        run0.setFontSize(14);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun();
        run1.setBold(true);
        run1.setText(" رقم " + ct.getNum_demande() + "/2020");
        run1.setFontSize(14);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2 = paragraph2.createRun();
        run2.setBold(true);
        run2.setText("لترخيص جمع ونقل النفايات");
        run2.setFontSize(14);
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe = document.createParagraph();
        XWPFRun runn = paragraphe.createRun();
        runn.setBold(true);
        runn.setText("*****");
        runn.setFontSize(14);
        runn.addBreak();
        runn.setFontFamily("Times New Roman");
        paragraphe.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraphe, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe00 = document.createParagraph();
        XWPFRun run00 = paragraphe00.createRun();
        run00.setBold(true);
        run00.setText(": وزير الطاقة والمعادن والبيئة ");
        run00.setFontSize(14);
        run00.setFontFamily("Times New Roman");
        paragraphe00.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraphe00, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun();
        run3.setText("-\tبناء على قرار وزير الطاقة والمعادن والبيئة رقم " + ct.getNum_demande() + " المتعلق بالاختصاصات وزير الطاقة والمعادن والبيئة ");
        run3.setFontSize(12);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph3, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun();
        run4.setText("-");
        run4.addTab();
        run4.setText(" وعلى القانون رقم 28-00 المتعلق بتدبير النفايات والتخلص منها الصادر بتنفيذه الظهير الشريف رقم 1-06-153 بتاريخ 30 شوال 22)1427 نونبر (2000");
        run4.setFontSize(12);
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun();
        run5.setText("-");
        run5.addTab();
        run5.setText("وعلى المرسوم رقم 2-07-253 صادر في 14 من رجب 18)1429 يوليو (2008 المتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة؛");
        run5.setFontSize(12);
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph6 = document.createParagraph();
        XWPFRun run6 = paragraph6.createRun();
        run6.setText("-");
        run6.addTab();
        run6.setText(" وعلى المرسوم رقم 2-14-85 الصادر في 28 من ربيع الأول 20)1436 يناير (2015 المتعلق بتدبير النفايات الخطرة");
        run6.setFontSize(12);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph6, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph7 = document.createParagraph();
        XWPFRun run7 = paragraph7.createRun();
        run7.setText("-");
        run7.addTab();
        run7.setText(" وعلى قرار الوزيرة المنتدبة لدى وزير الطاقة والمعادن والماء والبيئة المكلفة بالبيئة رقم 3184.15 الصادر في 9 ذي الحجة 23)1436 سبتمبر (2015 المتعلق بتطبيق المواد 5 و 6 و7 و11 من المرسوم رقم 85-14-2 المشار إليه أعلاه؛");
        run7.setFontSize(12);
        paragraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph7, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph8 = document.createParagraph();
        XWPFRun run8 = paragraph8.createRun();
        run8.setText("-");
        run8.addTab();
        run8.setText("و على الظهير الشريف رقم 1.63.260 الصادر في 24 جمادى الثانية 12)1383 نوفمبر (1963 بشان النقل بواسطة السيارات عبر الطرق، كما تم تغييره وتتميمه؛");
        run8.setFontSize(12);
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph9 = document.createParagraph();
        XWPFRun run9 = paragraph9.createRun();
        run9.setText("-");
        run9.addTab();
        String date2 = "";
        if(ct.getDateDepot()!=null){
            date2 = dateFormat.format(ct.getDateValidation());
        }
        run9.setText( " وعلى رأي اللجنة المكونة من ممثلي السلطات الحكومية المكلفة بالصحة والفلاحة والنقل والبيئة خلال الاجتماع المنعقد بمقر بقطاع البيئة "+"بتاريخ "+ date2 +" ");
        paragraph9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph9, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph10 = document.createParagraph();
        XWPFRun run10 = paragraph10.createRun();
        run10.setText("\t: قرر ما يلي -");
        run10.setFontSize(12);
        paragraph10.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph10, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph11 = document.createParagraph();
        XWPFRun run11 = paragraph11.createRun();
        run11.setText("-\t المادة الأولى: تمنح رخصة لجمع ونقل النفايات الخطرة المحددة في اللائحة خلفه لشركة " + ct.getRaison() + " ");
        run11.setFontSize(12);
        paragraph11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph11, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph12 = document.createParagraph();
        XWPFRun run12 = paragraph12.createRun();
        run12.setText("-");
        run12.addTab();
        run12.setText("المادة الثانية:  يلتزم صاحب رخصة جمع ونقل النفايات الخطرة، باحترام القوانين والمعايير المتعلقة بهذا المجال");
        run12.setFontSize(12);
        paragraph12.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph12, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph13 = document.createParagraph();
        XWPFRun run13 = paragraph13.createRun();
        run13.setText("-\tالمادة الثالثة:  يمنح هذا الترخيص لمدة أقصاها خمس ");
        run13.setText("(5)");
        run13.setText(" سنوات قابلة للتجديد ابتداء من تاريخ صدورها؛");
        run13.setFontSize(12);
        paragraph13.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph13, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph14 = document.createParagraph();
        XWPFRun run14 = paragraph14.createRun();
        run14.setText(" - \t  المادة الرابعة: كل مخالفة للمقتضيات القانونية المذكورة أعلاه تعرض المعني بالأمر للعقوبة المنصوص عليها في القوانين الجاري بها العمل");
        run14.setText(" وتسحب منه الرخصة ولا يمكن لصاحبها المطالبة بأي تعويض كيفما كان نوعه؛");
        run14.setFontSize(12);
        run14.addBreak();
        paragraph14.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph14, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph15 = document.createParagraph();
        XWPFRun run15 = paragraph15.createRun();
        run15.setText("وحرر بالرباط في"+ dateFormat.format(new Date()) +" ");
        run15.setFontSize(12);
        paragraph15.setAlignment(ParagraphAlignment.RIGHT);
        setOrientation(paragraph15, TextOrientation.RTL);

//=====================================================================================================

        // 2éme Page //

        // Add new Paragraph to document
        XWPFParagraph paragraph30 = document.createParagraph();
        XWPFRun run30 = paragraph30.createRun();
        run30.setText(" لائحة النفايات الخطرة المرخص جمعها و نقلها ");
        run30.setText("Liste des déchets dangereux autorisé");
        run30.setText("                                    ");
        run30.setFontSize(14);
        paragraph30.setAlignment(ParagraphAlignment.BOTH);
        setOrientation(paragraph30, TextOrientation.RTL);

        List<Vehicules> v = ct.getVehicules();


        XWPFTable tab = document.createTable();
        XWPFTableRow row = tab.getRow(0); // First row
        CTTblWidth width = tab.getCTTbl().addNewTblPr().addNewTblW();
        width.setType(STTblWidth.DXA);
        width.setW(BigInteger.valueOf(10900));
        // Columns
        row.getCell(0).setText("Véhicules autorisés");
        row.addNewTableCell().setText("Code selon le catalogue marocain des déchets");
        row.addNewTableCell().setText("Type de déchet");
        for(int i = 0; i < v.size(); i++){

            row = tab.createRow(); // Second Row
            row.getCell(0).setText(v.get(i).getNum_matricule());
            row.getCell(1).setText(v.get(i).getPoint_net());
            row.getCell(2).setText(v.get(i).getPoit_totale_charge());
        }

        //============= Fusion ==========================================


        XWPFParagraph paragraph36 = document.createParagraph();
        XWPFRun run36 = paragraph36.createRun();
        run36.setText("");
        run36.setFontSize(10);
        run36.addBreak();
        run36.addBreak();
        run36.setFontFamily("Times New Roman");
        paragraph36.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph36, TextOrientation.LTR);

        XWPFParagraph paragraph37 = document.createParagraph();
        XWPFRun run37 = paragraph37.createRun();
        run37.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        run37.setFontSize(10);
        run37.setFontFamily("Times New Roman");
        paragraph37.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph37, TextOrientation.LTR);
        paragraph37.setBorderTop(Borders.BASIC_WIDE_INLINE);
        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);




       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateReexamen() throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("إلـــى");
        runIla.setFontSize(14);
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun();
        run0.setBold(true);
        run0.setText("الســيد العامل مدير الماء والتطهير ");
        run0.setFontSize(14);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun();
        run1.setBold(true);
        run1.setText(" المديرية العامة للجماعات المحلية");
        run1.setFontSize(14);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2 = paragraph2.createRun();
        run2.setBold(true);
        run2.setText("وزارة الداخـليــة");
        run2.setFontSize(14);
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe = document.createParagraph();
        XWPFRun runn = paragraphe.createRun();
        runn.setBold(true);
        runn.setText("الموضوع: انعقاد اجتماع اللجنة الوطنية لدراسات التأثير على البيئة.");
        runn.setFontSize(14);
        runn.addBreak();
        runn.setFontFamily("Times New Roman");
        paragraphe.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraphe, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe00 = document.createParagraph();
        XWPFRun run00 = paragraphe00.createRun();
        run00.setBold(true);
        run00.setText("المرفقات: دراسة التأثير على البيئة و دفتر التحملات. ");
        run00.setFontSize(14);
        run00.setFontFamily("Times New Roman");
        paragraphe00.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraphe00, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun();
        run3.setText("سلام تام بوجود مولانا الإمام، وبعد، ");
        run3.setFontSize(12);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph3, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun();
        run4.setText("-");
        run4.addTab();
        run4.setText(" طبقا لمقتضيات القانون 12.03 المتعلق بدراسات التأثير على البيئة ومرسومه التطبيقي رقم ");
        run4.setFontSize(12);
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun();
        run5.setText("-");
        run5.addTab();
        run5.setText("2.04.563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة ");
        run5.setFontSize(12);
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph6 = document.createParagraph();
        XWPFRun run6 = paragraph6.createRun();
        run6.setText("-");
        run6.addTab();
        run6.setText(" خاصة المادة 8، يشرفني أن أدعوكم لإرسال من يمثلــكم في أشغال اللجنـــة الوطنية التــي ستعــقد ");
        run6.setFontSize(12);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph6, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph7 = document.createParagraph();
        XWPFRun run7 = paragraph7.createRun();
        run7.setText("-");
        run7.addTab();
        run7.setText(" اجتمــاعـــا يوم يوم شهر سنة بمقر هذه الوزارة.");
        run7.setFontSize(12);
        paragraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph7, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph8 = document.createParagraph();
        XWPFRun run8 = paragraph8.createRun();
        run8.setText("-");
        run8.addTab();
        run8.setText("ويتضمن جدول أعمال هذا الاجتماع إعادة دراسة المشروع التالي: ");
        run8.setFontSize(12);
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph9 = document.createParagraph();
        XWPFRun run9 = paragraph9.createRun();
        run9.setText("-");
        run9.addTab();
        run9.setText( ": . 10:00");
        paragraph9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph9, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph10 = document.createParagraph();
        XWPFRun run10 = paragraph10.createRun();
        run10.setText("-");
        run10.addTab();
        run10.setText( "وتفضلوا بقبول خالص التحيات والسلام.");
        paragraph10.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph10, TextOrientation.RTL);




        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);




       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }
    public static ByteArrayInputStream generateExamDocument() throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));
        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("إلـــى");
        runIla.setFontSize(18);
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun();
        run0.setBold(true);
        run0.setText("الســيد العامل مدير الماء والتطهير");
        run0.setFontSize(18);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun();
        run1.setBold(true);
        run1.setText(" المديرية العامة للجماعات المحلية");
        run1.setFontSize(18);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2= paragraph2.createRun();
        run2.setBold(true);
        run2.setText("وزارة الداخـليــة");
        run2.setFontSize(16);
        run2.setFontFamily("Times New Roman");
        run2.addBreak();
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun();
        run2.setBold(true);
        run3.setText("الموضوع: انعقاد اجتماع اللجنة الوطنية لدراسات التأثير على البيئة. ");
        run3.setFontSize(16);
        run3.setFontFamily("Times New Roman");
        setOrientation(paragraph3, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun();
        run4.setBold(true);
        run4.setText("المرفقات: دراسة التأثير على البيئة. ");
        run4.setFontSize(14);
        run4.setFontFamily("Times New Roman");

        setOrientation(paragraph4, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun();

        run5.setText("سلام تام بوجود مولانا الإمام، وبعد، ");
        run5.setFontSize(14);
        run5.setFontFamily("Times New Roman");
        run5.addBreak();
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph6 = document.createParagraph();
        XWPFRun run6 = paragraph6.createRun();

        run6.setText("طبقا لمقتضيات القانون 12.03 المتعلق بدراسات التأثير على البيئة ومرسومه التطبيقي رقم    ");
        run6.setFontSize(14);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        run6.setFontFamily("Times New Roman");


        setOrientation(paragraph6, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph7 = document.createParagraph();
        XWPFRun run7 = paragraph7.createRun();

        run7.setText(" 2.04.563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة  ");
        run7.setFontSize(14);
        run7.setFontFamily("Times New Roman");
        paragraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph7, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph8 = document.createParagraph();
        XWPFRun run8 = paragraph8.createRun();

        run8.setText("خاصة المادة 8، يشرفني أن أدعوكم لإرسال من يمثلــكم في أشغال اللجنـــة الوطنية التــي ستعــقد  ");
        run8.setFontSize(14);
        run8.setFontFamily("Times New Roman");
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph9 = document.createParagraph();
        XWPFRun run9 = paragraph9.createRun();

        run9.setText("اجتمــاعـــا يوم يوم شهر سنة بمقر هذه الوزارة.");
        run9.setFontSize(14);
        run9.setFontFamily("Times New Roman");
        run9.addBreak();
        paragraph9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph9, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph10 = document.createParagraph();
        XWPFRun run10 = paragraph10.createRun();

        run10.setText("ويتضمن جدول أعمال هذا الاجتماع دراسة المشروع التالي:  ");
        run10.setFontSize(14);
        run10.setFontFamily("Times New Roman");
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph10, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph11 = document.createParagraph();
        XWPFRun run11 = paragraph11.createRun();
        /*List<Region> r = di.getRegions();
        for(int i=0; i<r.size(); i++){
            run11.setText("10:00:  "+di.getIntitule_projet()+" التابعة لعمالة " + r.get(i).getNom_ar()+ "مقدمة من طرف شركة "+ di.getRaison_social());
        }*/

        run11.setFontSize(14);
        run11.setFontFamily("Times New Roman");

        setOrientation(paragraph11, TextOrientation.RTL);
        // Add new Paragraph to document
        XWPFParagraph paragraph12 = document.createParagraph();
        XWPFRun run12 = paragraph12.createRun();

        run12.setText("وتفضلوا بقبول خالص التحيات والسلام. ");
        run12.setFontSize(14);
        run12.setFontFamily("Times New Roman");
        paragraph12.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph12, TextOrientation.RTL);


        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);

        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }


    public static ByteArrayInputStream generateTransitLettre(Notification n,String urlRest) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(450L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(450L));
        pageMar.setBottom(BigInteger.valueOf(1440L));

        // Add new Paragraph to document
        XWPFParagraph Paraghraph1 = document.createParagraph();
        XWPFRun run1 = Paraghraph1.createRun();
        run1.setBold(true);
        String genre=n.getAutorite().getGenre_A()!=null?n.getAutorite().getGenre_A():"";
        String representant=n.getAutorite().getDenomination()!=null?n.getAutorite().getDenomination():"";
        run1.setText("A " + genre +" "+ representant);
        run1.addBreak();
        String qualite=n.getAutorite().getPoste()!=null?n.getAutorite().getPoste():"";
        run1.setText("du " + qualite);
        run1.addBreak();
        String pays=n.getAutorite().getPays()!=null?n.getAutorite().getPays().getNom_fr():"";
        run1.setText("du " + pays);
        run1.setFontSize(10);
        run1.addBreak();
        Paraghraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph1, TextOrientation.LTR);


        // Add new Paragraph to document
        XWPFParagraph Paraghraph2 = document.createParagraph();
        XWPFRun run2 = Paraghraph2.createRun();
        XWPFRun run3 = Paraghraph2.createRun();
        run2.setBold(true);
        run2.setText("Objet :");
        run2.setText(" ");
        String producteur=n.getProducteur().getNom_fr()!=null?n.getProducteur().getNom_fr():"";
        String eliminateur=n.getEliminateur()!=null?n.getEliminateur().getNom_fr():"";
        run3.setText("Transferts transfrontaliers de déchets dangereux du "+ producteur+" vers "+eliminateur);
        run3.addBreak();
        String num = "...";
        if(n.getNum_notification() !=null){
            num = n.getNum_notification();
        }
        run3.addTab();
        run3.setText("Notification N° " + num);
        run3.setFontSize(10);
        run2.setFontSize(10);
        Paraghraph2.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph2, TextOrientation.LTR);
        // Add new Paragraph to document
        XWPFParagraph Paraghraph4 = document.createParagraph();
        XWPFRun run6 = Paraghraph4.createRun();
        XWPFRun run66 = Paraghraph4.createRun();
        run6.setText("Réf : ");
        run6.setBold(true);
        String numc=n.getNumerCorrespondance()!=null?n.getNumerCorrespondance():".................";
        String datec = "................";
        if(n.getDateCoresspondance()!=null){
            datec = dateFormat.format(n.getDateCoresspondance());
        }
        run66.setText("Votre correspondance "+numc+" du "+datec);
        run6.setFontSize(10);
        run66.setFontSize(10);
        Paraghraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph4, TextOrientation.LTR);
        // Add new Paragraph to document
        XWPFParagraph Paraghraph3 = document.createParagraph();
        XWPFRun run4 = Paraghraph3.createRun();
        XWPFRun run5 = Paraghraph3.createRun();
        run4.setBold(true);
        run4.setText("P.J :");
        run5.setText(" - Document de notification.\n ");
        run5.setFontSize(10);
        run4.setFontSize(10);
        Paraghraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph3, TextOrientation.LTR);



        // Add new Paragraph to document
        XWPFParagraph Paraghraph5 = document.createParagraph();
        XWPFRun run7 = Paraghraph5.createRun();
        run7.setText("        - Format du rapport. ");
        run7.setFontSize(10);
        run7.addBreak();
        Paraghraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph5, TextOrientation.LTR);


        // Add new Paragraph to document
        XWPFParagraph Paraghraph7 = document.createParagraph();
        XWPFRun run9 = Paraghraph7.createRun();
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
            classification = n.getClassification().getNom_fr();
        }
        String eliminateur1 = "...";
        if(n.getEliminateur().getNom_fr() !=null){
            eliminateur1 = n.getEliminateur().getNom_fr();
        }

        run9.setText("Suite à votre correspondance concernant la demande d’autorisation de transit par le Maroc de " + quantite + " " + unite + " de déchets " + classification + ", j’ai l’honneur de vous informer que nous n’avons pas d’objection et donnons notre consentement à l’opération de transit de ces déchets par le Maroc via le port de Tanger Med pour élimination au sein de la société " + eliminateur1 + " en …………………, sous réserves de :");
        run9.setFontSize(10);
        run9.addBreak();
        Paraghraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph7, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph8 = document.createParagraph();
        XWPFRun run10 = Paraghraph8.createRun();
        run10.addTab();
        run10.setText("Respecter la procédure de l’Organisation Maritime Internationale (OMI), à savoir : ");
        run10.setFontSize(10);
        Paraghraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph8, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph9 = document.createParagraph();
        XWPFRun run11 = Paraghraph9.createRun();
        run11.addTab();
        run11.setText("  •  Transmettre à la Direction de la Marine Marchande toutes les six heures à compter du départ du navire, le rapport ci-joint dûment rempli. ");
        run11.setFontSize(10);
        run11.addTab();
        Paraghraph9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph9, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph10 = document.createParagraph();
        XWPFRun run12 = Paraghraph10.createRun();
        run12.addTab();
        run12.setText("  •  Se souscrire à une assurance P&I club (assurance couvrant les dégâts en cas de pollution due aux soutes). " );
        run12.setFontSize(10);
        Paraghraph10.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph10, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph11 = document.createParagraph();
        XWPFRun run13 = Paraghraph11.createRun();
        run13.addTab();
        run13.setText("S’informer auprès du Port de Tanger Med sur son règlement d’exploitation et de l’informer sur la date de départ du navire et la date et l’heure envisagée pour le transit par ledit port.");
        run13.setFontSize(10);
        Paraghraph11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph11, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph12 = document.createParagraph();
        XWPFRun run14 = Paraghraph12.createRun();
        run14.addTab();
        run14.setText("Les déchets dangereux devront être emballés et étiquetés conformément aux règles et normes internationales et conditionnés obligatoirement en conteneurs. ");
        run14.setFontSize(10);
        Paraghraph12.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph12, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph13 = document.createParagraph();
        XWPFRun run15 = Paraghraph13.createRun();
        run15.addTab();
        run15.setText("Si cette opération de transit consisterait également en des opérations de transbordement, les conteneurs devront être déposés au niveau de l’un des terminaux à conteneurs du Port de Tanger Med en attente de leurs expéditions vers la France. ");
        run15.setFontSize(10);
        Paraghraph13.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph13, TextOrientation.LTR);

        // Add new Paragraph to document
        XWPFParagraph Paraghraph14 = document.createParagraph();
        XWPFRun run16 = Paraghraph14.createRun();
        run16.addTab();
        run16.setText("Les navires transportant ces déchets dangereux devront disposer à bord des documents attestant de la sécurité de transport de ce type de déchet et autres documents règlementaires exigés par la Convention de Bâle, le Code International de transport des Marchandises Dangereuses (code IMDG…) et la réglementation nationale en la matière. ");
        run16.setFontSize(10);
        Paraghraph14.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph14, TextOrientation.LTR);
        run16.addBreak();
        run16.addBreak();
        // Add new Paragraph to document
        XWPFParagraph Paraghraph16 = document.createParagraph();
        XWPFRun run18 = Paraghraph16.createRun();
        run18.setBold(true);
        run18.setText("Veuillez agréer Monsieur, l’expression de mes salutations distinguées.");
        run18.setFontSize(10);
        Paraghraph16.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph16, TextOrientation.LTR);

        XWPFParagraph Paraghraph17 = document.createParagraph();
        XWPFRun run19 = Paraghraph17.createRun();
        run19.setBold(true);
        run19.setText("CC. - Direction de la Marine Marchande.");
        run19.addBreak();
        run19.setText("       - Port de Tanger");
        run19.setFontSize(10);
        Paraghraph17.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(Paraghraph17, TextOrientation.LTR);





        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.createParagraph();
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, MonDocument.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);




        //QRCODE

        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph paragraphFooter = footer.createParagraph();
        XWPFRun runFooter = paragraphFooter.createRun();
        try {
            byte[] bs = QRCodeGenerator.getQRCodeImage(urlRest+"/DownloadFile/"+n.getId_notification()+"/"+n.getZf_et()+"/"+1, 500,
                    500);
            runFooter.addPicture(new ByteArrayInputStream(bs), XWPFDocument.PICTURE_TYPE_PNG, "/qrMinistere.png", Units.toEMU(60),
                    Units.toEMU(60));
            setOrientation(paragraphFooter, MonDocument.TextOrientation.LTR);
            paragraphFooter.setAlignment(ParagraphAlignment.LEFT);
        } catch (WriterException e) {
            e.printStackTrace();
        }
       /* // create footer start
        XWPFFooter footer = headerFooterPolicy.createFooter(XWPFHeaderFooterPolicy.DEFAULT);
        px = footer.getParagraphArray(0);
        px.setAlignment(ParagraphAlignment.LEFT);
        runn = px.createRun();
        runn.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        // =========================================*/


        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }

}
