# Hướng Dẫn & Nội Dung Thuyết Trình Đồ án Tốt Nghiệp

Tài liệu này được biên soạn dựa trên nội dung Slide `main.tex` và các chương `1, 3, 4` của luận văn. Mục tiêu là cung cấp kiến thức nền tảng, các điểm nhấn quan trọng và số liệu chính xác để bạn tự tin thuyết trình.

---

## ⚠️ Lưu ý Chung
- **Thời gian**: Thường bạn có 15-20 phút. Hãy tập trung vào **Đóng góp của đề tài** (Bạn làm được gì?) và **Kết quả** (Hiệu quả ra sao?).
- **Phong thái**: Tự tin, nói rõ ràng, nhấn mạnh vào các từ khóa (in đậm trong tài liệu này).

---

## PHẦN I: GIỚI THIỆU (Slides 41-69)

### 1. Lý do chọn đề tài (Slide 43)
*   **Nội dung trình bày**:
    *   Bắt đầu bằng **Vấn đề thực tế**: Đô thị hóa nhanh -> Tắc nghẽn giao thông. (Dẫn chứng: Thiệt hại kinh tế, ô nhiễm môi trường).
    *   **Hạn chế hiện tại**: Đèn giao thông chu kỳ cố định (Fixed Signal) đã lỗi thời, không linh hoạt theo lưu lượng thực tế.
    *   **Giải pháp của nhóm**: Kết hợp **Thị giác máy tính (AI)** để "nhìn" đường và **Học tăng cường (RL)** để "điều khiển" đèn thông minh.
*   **Kiến thức cần nắm (Chương 1)**:
    *   Hiểu sơ về thiệt hại do tắc nghẽn (theo OECD, tắc nghẽn gây thiệt hại hàng tỷ USD).
    *   Khái niệm "Chu kỳ cố định": Đèn xanh đỏ được set cứng (ví dụ: 30s xanh, 30s đỏ) bất kể đường vắng hay đông.

### 2. Mục tiêu đề tài (Slide 61)
*   **Nội dung trình bày**: Nhấn mạnh 5 mục tiêu chính theo luồng dữ liệu khép kín:
    1.  **Thu thập**: Tự động lấy ảnh từ camera công cộng (Data Mining).
    2.  **Xử lý (Quan trọng)**: Dùng **Real-ESRGAN** để làm nét ảnh (vì ảnh camera thường mờ) và **YOLOv11** để đếm xe.
    3.  **Dự báo**: Dùng **LSTM** để đoán trước tắc nghẽn (Gridlock) trong tương lai gần (10-15p tới).
    4.  **Điều khiển**: Dùng **DurationAgent (RL)** để chỉnh thời gian đèn xanh.
    5.  **Đánh giá**: Chạy mô phỏng trên **SUMO** để chứng minh hiệu quả.

---

## PHẦN II: THIẾT KẾ HỆ THỐNG (Slides 74-164)

### 1. Sơ đồ khối tổng quát (Slide 76)
*   **Trình bày**: Chỉ vào sơ đồ khối (System Block Diagram) để người xem hình dung luồng đi của dữ liệu:
    *   `Camera` -> `Thu thập & Lưu trữ (Drive)` -> `Tiền xử lý (Upscale)` -> `Nhận diện (YOLO)` -> `Dự báo (LSTM)` -> `Điều khiển (SUMO)`.

### 2. Thu thập & Tiền xử lý (Slide 87)
*   **Nội dung**:
    *   Dữ liệu lấy từ `giaothong.hochiminhcity.gov.vn`.
    *   **Khó khăn**: Ảnh mờ, chất lượng thấp.
    *   **Giải pháp kỹ thuật**: Sử dụng **Real-ESRGAN** (Mạng đối kháng sinh) để tăng độ phân giải (Upscale).
    *   **Kỹ thuật phụ**: Chia ảnh làm 4 phần (Quadrants) để YOLO soi kỹ hơn các chi tiết nhỏ.

### 3. Nhận diện phương tiện - Điểm nhấn về xe máy (Slide 108)
*   **Nội dung**:
    *   Ô tô: Dùng **YOLOv11** (Model mới nhất, nhanh và chính xác).
    *   **Vấn đề Xe máy (Quan trọng)**: Ở VN, xe máy đi thành "bầy", rất khó đếm từng chiếc bằng bounding box thông thường vì chúng che khuất nhau (Occlusion).
    *   **Giải pháp Đột phá của nhóm**: Sử dụng **Phương pháp Lai (Hybrid)**.
        *   Ô tô: Đếm box.
        *   Xe máy: Tính **Độ phủ vùng quan tâm (ROI Coverage %)**.
    *   **Cách hoạt động**: Khoanh vùng (ROI) -> Tính % diện tích xe máy chiếm dụng -> Quy đổi ra số lượng (Ví dụ: 1 xe máy chiếm ~1% diện tích, nếu vùng đó đen 40% -> ước lượng 40 xe).
*   **Kiến thức cần nắm (Chương 3)**:
    *   Các kỹ thuật xử lý ảnh: Polygon Fill, Masking, loại bỏ vùng nhiễu (vạch kẻ đường).

### 4. Dự báo tắc nghẽn - LSTM (Slide 128)
*   **Nội dung**:
    *   Tại sao cần dự báo? -> Để đèn tín hiệu "chuẩn bị trước", không phải tắc rồi mới chỉnh.
    *   Mô hình: **LSTM** (Long Short-Term Memory).
    *   **Đầu vào**: Dữ liệu giao thông 10 phút trước (Lookback window).
    *   **Đầu ra**: Mức độ tắc nghẽn (Level 0-5).
*   **Kiến thức cần nắm**:
    *   LSTM tốt cho chuỗi thời gian (Time-series) vì nó có "trí nhớ" (Memory Cell), nhớ được xu hướng kẹt xe từ quá khứ.

### 5. Mô phỏng & Điều khiển - SUMO & RL (Slide 145)
*   **Nội dung**:
    *   Môi trường: **SUMO** (Simulation of Urban Mobility) - chuẩn mực nghiên cứu giao thông.
    *   Bản đồ: Lấy từ **OpenStreetMap** (thực tế khu vực nghiên cứu).
    *   **Bộ não (Agent)**:
        *   Tên: **DurationAgent**.
        *   Thuật toán: **Actor-Critic** (Học tăng cường).
        *   Hành động: Quyết định thời gian đèn xanh (Green Duration) trong khoảng **40s - 80s**. (Baseline cố định là 30s).

---

## PHẦN III: KẾT QUẢ (Slides 169-239)

### 1. Nhận diện (Slide 171)
*   **Trình bày**: Show ảnh kết quả.
    *   Chỉ rõ sự khác biệt giữa ảnh chỉ có Box (YOLO thuần) và ảnh có vùng tô màu (ROI cho xe máy).
    *   Khẳng định: Phương pháp ROI giúp đếm được xe máy trong đám đông mà YOLO thường bỏ sót.

### 2. Dashboard (Slide 186)
*   **Trình bày**:
    *   Giới thiệu giao diện web trực quan.
    *   Tính năng: Xem camera, xem biểu đồ dự báo, điều khiển mô phỏng.
    *   Biểu đồ so sánh: Đường Dự báo (Đỏ) bám rất sát Đường Thực tế (Xanh) -> Độ chính xác cao.

### 3. Hiệu quả điều khiển (Quan trọng nhất - Slide 195-224)
*   **Số liệu "ăn tiền" (Cần thuộc lòng)**:
    *   **Thông lượng (Throughput)**: Tăng **+88.5\%** (Từ 115.9 xe lên 218.6 xe). -> *Nghĩa là cùng một khoảng thời gian, hệ thống của nhóm cho phép lượng xe đi qua gấp đôi.*
    *   **Reward (Điểm thưởng)**: Tăng **+40.5\%**. -> *Phản ánh tổng thể hiệu quả (ít chờ, đi nhanh).*
    *   **Hàng đợi (Queue)**: Tăng nhẹ (2.25 -> 4.25 xe).
        *   *Giải thích khéo*: Hàng đợi tăng là do chiến lược "giữ xe để xả một lần cho hiệu quả" (gom đủ xe mới cho đi để tối ưu thời gian xanh), nhưng đổi lại thông lượng tăng vọt. Đây là sự đánh đổi (trade-off) chấp nhận được.
*   **Bảng so sánh tổng thể (Slide 225)**:
    *   Nhấn mạnh dòng **Throughput** và **Reward**.

---

## PHẦN IV: KẾT LUẬN (Slides 244-278)

### 1. Tổng kết
*   Nhắc lại 3 thành tựu lớn:
    1.  Xây dựng quy trình khép kín từ Camera thực tế -> Mô phỏng.
    2.  Giải quyết bài toán xe máy bằng Hybrid Method (YOLO + ROI).
    3.  Tối ưu hóa đèn tín hiệu tăng 88.5% thông lượng bằng RL.

### 2. Hướng phát triển
*   Đưa mô hình xuống thiết bị nhúng (Jetson Nano) để ra thực tế (Edge Computing).
*   Mở rộng mạng lưới ra nhiều ngã tư hơn.

---

## ❓ Câu Hỏi Phản Biện Thường Gặp (Chuẩn bị thêm)

1.  **Tại sao chọn LSTM mà không phải Transformer/RNN khác?**
    *   *Trả lời*: LSTM nhẹ hơn Transformer, đủ tốt cho chuỗi thời gian ngắn (10 phút), và khắc phục được điểm yếu quên lãng (vanishing gradient) của RNN thường.
2.  **Tại sao hàng đợi (Queue) lại tăng?**
    *   *Trả lời*: Hệ thống ưu tiên **Thông lượng toàn mạng** (Global Throughput). Đôi khi cần giữ đèn đỏ lâu một chút ở nhánh phụ để nhánh chính xả được hết xe, tránh kẹt dây chuyền (Gridlock).
3.  **Dữ liệu camera lấy như thế nào?**
    *   *Trả lời*: Dùng **Web Scraping** (Request API) từ cổng thông tin giao thông TPHCM, chu kỳ 12s/ảnh, lưu vào Google Drive.
4.  **Làm sao đếm chính xác xe máy bằng ROI?**
    *   *Trả lời*: Nhóm đã thực nghiệm để tìm ra "hệ số quy đổi" (ví dụ trung bình 1 xe máy chiếm bao nhiêu pixel), sau đó lấy tổng diện tích ROI chia cho hệ số này.
