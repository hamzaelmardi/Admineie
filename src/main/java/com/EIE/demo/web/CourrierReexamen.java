package com.EIE.demo.web;

import com.EIE.demo.model.*;
import com.itextpdf.text.Paragraph;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class CourrierReexamen {

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

    private static void setOrientation(XWPFParagraph par, MonDocument.TextOrientation orientation) {
        if (par.getCTP().getPPr() == null) {
            par.getCTP().addNewPPr();
        }
        if (par.getCTP().getPPr().getBidi() == null) {
            par.getCTP().getPPr().addNewBidi();
        }
        par.getCTP().getPPr().getBidi().setVal(orientation == MonDocument.TextOrientation.RTL ? STOnOff.ON : STOnOff.OFF);
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



}
