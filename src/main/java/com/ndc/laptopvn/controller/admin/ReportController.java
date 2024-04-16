package com.ndc.laptopvn.controller.admin;

import com.ndc.laptopvn.service.Report.PdfReportService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReportController {
    private final PdfReportService pdfReportService;

    public ReportController(PdfReportService pdfReportService) {
        this.pdfReportService = pdfReportService;
    }

    @GetMapping("/admin/report/{id}")
    public String getReport(@PathVariable long id){
        try {
            this.pdfReportService.createPdfReport("reportOrder", id);
            return "Bill create success!";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

}
