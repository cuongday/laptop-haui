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

    @GetMapping("/api/admin/report/{id}")
    public String getReport(@PathVariable long id){
        try {
            String filePath = this.pdfReportService.createPdfReport("reportOrder", id);
            return filePath;
        } catch (Exception e) {
            return e.getMessage();
        }
    }

}
