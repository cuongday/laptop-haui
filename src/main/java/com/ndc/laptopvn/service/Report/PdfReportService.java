package com.ndc.laptopvn.service.Report;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.ndc.laptopvn.domain.Order;
import com.ndc.laptopvn.domain.OrderDetail;
import com.ndc.laptopvn.service.OrderService;
import com.ndc.laptopvn.service.UserService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class PdfReportService {

    private final OrderService orderService;

    private final ServletContext servletContext;
    private final HttpServletRequest request;

    public PdfReportService(UserService userService,
                            OrderService orderService,
                            ServletContext servletContext,
                            HttpServletRequest request) {
        this.orderService = orderService;
        this.servletContext = servletContext;
        this.request = request;
    }


    public String createPdfReport(String fileName, long id) throws FileNotFoundException, DocumentException {
        // Create PDF report
        try {
            Document document = new Document(PageSize.A6, 20, 20, 20, 20);

            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            fileName = fileName+"- " + timestamp + ".pdf";
            String rootPath = this.servletContext.getRealPath("/resources/reports/");
            String filePath = rootPath + fileName;
            PdfWriter.getInstance(document, new FileOutputStream(filePath));

            String fontPath = this.servletContext.getRealPath("/resources/fonts/times.ttf");
            FontFactory.register(fontPath, "Times New Roman");
            Font font = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 4, Font.NORMAL, BaseColor.BLACK);
            Font fontRed = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 6, Font.BOLD, BaseColor.RED);
            Font fontBoldBig = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 6, Font.BOLD, BaseColor.BLACK);
            Font fontBold = FontFactory.getFont("Times New Roman", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 4, Font.BOLD, BaseColor.BLACK);


            Optional<Order> orderOptional = this.orderService.fetchOrderById(id);
            if (orderOptional.isPresent()){
                document.open();
                Order order = orderOptional.get();
                List<OrderDetail> orderDetails = order.getOrderDetails();
                DecimalFormat df = new DecimalFormat("#");

                Paragraph storeName = new Paragraph("LaptopHaui", fontRed);
                document.add(storeName);

                Paragraph title = new Paragraph("Hoá đơn bán hàng", fontBoldBig);
                title.setAlignment(Element.ALIGN_RIGHT);
                document.add(title);

                Paragraph storeAddress = new Paragraph("Địa chỉ: Số 68, Cầu Diễn, Từ Liêm, Hà Nội", font );
                storeAddress.setAlignment(Element.ALIGN_LEFT);

                Paragraph storePhone = new Paragraph("Số điện thoại: 0987654321" , font);
                storePhone.setAlignment(Element.ALIGN_LEFT);

                // lấy ra tên nhân viên đang đăng nhập
                String employyName = (String) request.getSession().getAttribute("fullName");
                Paragraph sellerName = new Paragraph("Nhân viên xuất hoá đơn: "+ employyName, font);

                document.add(storeAddress);
                document.add(storePhone);
                document.add(sellerName);

                document.add(new Paragraph(" "));

                Paragraph  customerName =  new Paragraph("Tên khách hàng: " + order.getUser().getFullName(), font);
                customerName.setAlignment(Element.ALIGN_LEFT);
                document.add(customerName);

                Paragraph customerAddress =  new Paragraph("Địa chỉ: " + order.getUser().getAddress(), font);
                customerAddress.setAlignment(Element.ALIGN_LEFT);
                document.add(customerAddress);

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
                table.addCell("");
                table.addCell("");
                table.addCell("");
                table.addCell(new Phrase("Tổng cộng", font));
                String formattedSum = df.format(sum);
                table.addCell(new Phrase(formattedSum, fontBold));
                document.add(table);

                // Lấy ra thời gian hiện tại
                LocalDate currentDate = LocalDate.now();

                // Định dạng thời gian theo "dd/MM/yyyy"
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String formattedDate = currentDate.format(formatter);

                // Tạo một đoạn văn bản với thời gian đã được định dạng
                Paragraph time = new Paragraph("Hà Nội, ngày " + formattedDate, font);
                time.setAlignment(Element.ALIGN_RIGHT);
                time.setIndentationRight(20);
                document.add(new Paragraph(" "));

                document.add(time);
                document.close();


                return fileName;

            }else {
                System.err.println("Order with id " + id + " does not exist.");
                // Ném ra ngoại lệ
                throw new IllegalArgumentException("Order with id " + id + " does not exist.");
            }
        }catch (FileNotFoundException e) {
            // Xử lý ngoại lệ FileNotFoundException
            System.err.println("File not found: " + e.getMessage());
        } catch (DocumentException e) {
            // Xử lý ngoại lệ DocumentException
            System.err.println("Error while creating PDF document: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            // Xử lý ngoại lệ IllegalArgumentException
            System.err.println("Invalid argument: " + e.getMessage());
        }
        return "";
    }
}
