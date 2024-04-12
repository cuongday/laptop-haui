package com.ndc.laptopvn.service.Report;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.ndc.laptopvn.domain.Order;
import com.ndc.laptopvn.domain.OrderDetail;
import com.ndc.laptopvn.domain.User;
import com.ndc.laptopvn.service.OrderService;
import com.ndc.laptopvn.service.UserService;
import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Service;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class PdfReportService {

    private final UserService userService;

    private final OrderService orderService;

    private final ServletContext servletContext;

    public PdfReportService(UserService userService,
                            OrderService orderService,
                            ServletContext servletContext) {
        this.userService = userService;
        this.orderService = orderService;
        this.servletContext = servletContext;
    }




    public void createPdfReport(String fileName, long id) throws FileNotFoundException, DocumentException {
        // Create PDF report
        Document document = new Document(PageSize.A6, 20, 20, 20, 20);

        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        fileName = fileName+"- " + timestamp + ".pdf";
        String rootPath = this.servletContext.getRealPath("/resources/reports/");
        String filePath = rootPath + fileName;
        PdfWriter.getInstance(document, new FileOutputStream(filePath));

        String fontPath = this.servletContext.getRealPath("/resources/fonts/times.ttf");
                FontFactory.register(fontPath, "Times New Roman");
        Font font = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 4, Font.NORMAL, BaseColor.BLACK);
        Font fontRed = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 4, Font.NORMAL, BaseColor.RED);
        Font fontBold = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 6, Font.BOLD, BaseColor.BLACK);

        document.open();
        User currentUser = this.userService.getUserById(id);

        List<Order> orders = this.orderService.fetchOrdersByUser(currentUser);

        DecimalFormat df = new DecimalFormat("#");

        Paragraph storeName = new Paragraph("LaptopHaui", fontBold);
        storeName.setIndentationLeft(50);
        document.add(storeName);

        Paragraph title = new Paragraph("Hoá đơn bán hàng", fontBold);
        title.setIndentationRight(50);
        title.setAlignment(Element.ALIGN_RIGHT);
        document.add(title);

        Paragraph storeAddress = new Paragraph("Địa chỉ: Số 68, Cầu Diễn, Từ Liêm, Hà Nội", font );
        storeAddress.setAlignment(Element.ALIGN_LEFT);

        Paragraph storePhone = new Paragraph("Số điện thoại: 0987654321" , font);
        storePhone.setAlignment(Element.ALIGN_LEFT);

        document.add(storeAddress);
        document.add(storePhone);

        document.add(new Paragraph(" "));

        Paragraph  customerName =  new Paragraph("Tên khách hàng: " + currentUser.getFullName(), font);
        customerName.setAlignment(Element.ALIGN_LEFT);
        document.add(customerName);

        Paragraph customerAddress =  new Paragraph("Địa chỉ: " + currentUser.getAddress(), font);
        customerAddress.setAlignment(Element.ALIGN_LEFT);
        document.add(customerAddress);

        document.add(new Paragraph(" "));
        document.add(new Paragraph(" "));


        PdfPTable table = new PdfPTable(5);

        float[] columnWidths = {1f, 3f, 1f, 2f, 2f};
        table.setWidths(columnWidths);


        table.addCell(new Phrase("Thứ tự", font));
        table.addCell(new Phrase("Tên sản phẩm", font));
        table.addCell(new Phrase("Số lượng", font));
        table.addCell(new Phrase("Đơn giá", font));
        table.addCell(new Phrase("Thành tiền", font));

        int index = 1;
        double sum =0;
        for(Order order : orders){
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for(OrderDetail orderDetail : orderDetails){
                table.addCell(new Phrase(String.valueOf(index), font));
                table.addCell(new Phrase(orderDetail.getProduct().getName(), font));
                table.addCell(new Phrase(String.valueOf(orderDetail.getQuantity()), font));
                String formattedPrice = df.format(orderDetail.getPrice());
                table.addCell(new Phrase(formattedPrice, font));
                String formattedTotal = df.format(orderDetail.getPrice() * orderDetail.getQuantity());
                table.addCell(new Phrase(formattedTotal, font));
                sum += orderDetail.getPrice() * orderDetail.getQuantity();
                index++;
            }
        }
        table.addCell("");
        table.addCell(new Phrase("Tổng cộng", font));
        String formattedSum = df.format(sum);
        table.addCell(new Phrase(formattedSum, font));
        document.add(table);

        document.close();
    }
}
