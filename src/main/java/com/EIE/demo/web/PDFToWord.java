package com.EIE.demo.web;

import com.spire.pdf.FileFormat;
import com.spire.pdf.PdfDocument;

public class PDFToWord {
    public static void main(String[] args) {
        //create a PdfDocument object
        PdfDocument doc = new PdfDocument();

        //load a sample PDF file
        doc.loadFromFile("C:\\Users\\Test1\\Desktop\\Sample.pdf");

        //save as .doc file
        doc.saveToFile("output/ToDoc.doc", FileFormat.DOC);

        //save as. docx file
        doc.saveToFile("output/ToDocx.docx",FileFormat.DOCX);
        doc.close();
    }
}