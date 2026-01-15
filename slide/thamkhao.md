Dưới đây là nội dung tài liệu được viết lại dưới dạng Markdown, chia theo từng trang slide. Các phần hình ảnh hoặc sơ đồ sẽ được mô tả thêm trong phần ghi chú.

---

## Trang 1: Trang bìa

**BỘ GIÁO DỤC VÀ ĐÀO TẠO**
**TRƯỜNG ĐẠI HỌC CÔNG NGHỆ KỸ THUẬT TP. HỒ CHÍ MINH**
**KHOA ĐIỆN – ĐIỆN TỬ**
**NGÀNH CNKT MÁY TÍNH**

# BÁO CÁO ĐỒ ÁN TỐT NGHIỆP

## ĐỀ TÀI: ỨNG DỤNG CHUẨN TRUYỀN THÔNG CAN THIẾT KẾ HỆ THỐNG GIÁM SÁT TRÊN Ô TÔ

*   **GVHD:** Th.S Nguyễn Văn Phúc
*   **SVTH1:** Đàm Thuận An (MSSV: 21119325)
*   **SVTH2:** Lâm Quang Vinh (MSSV: 21119161)

**Tp.HCM, tháng 1/2026**

> **Note:** Trang bìa có logo của trường Đại học Sư phạm Kỹ thuật TP.HCM (HCMUTE) bên trái và logo Khoa Điện - Điện Tử (FEEE) bên phải.

---

## Trang 2: Mục lục

**I. GIỚI THIỆU**

**II. NỘI DUNG THỰC HIỆN**

**III. KẾT QUẢ**

**IV. KẾT LUẬN - HƯỚNG PHÁT TRIỂN**

---

## Trang 3: I. Giới thiệu - Lý do chọn đề tài

**1. Lý do chọn đề tài**

*   Ô tô hiện đại ngày nay có mật độ cảm biến vô cùng dày đặc, gây khó khăn để phát hiện sự cố kịp thời.
*   Hệ thống mạng CAN là mạng tiêu chuẩn phổ biến cho phép các ECU (Electrical Control Unit) trao đổi dữ liệu an toàn và nhanh chóng.

> **Note:** Bên phải slide là hình ảnh minh họa khung dây 3D của một chiếc ô tô hiện đại, hiển thị vị trí của rất nhiều hệ thống điện tử và cảm biến (Navi/Car Audio, EPS, Power Window, Airbag, Engine, Brake, Suspension, v.v.) để minh chứng cho mật độ ECU dày đặc.

---

## Trang 4: I. Giới thiệu - Mục tiêu

**2. Mục tiêu của đề tài**

*   Hệ thống có thể giao tiếp và thu thập dữ liệu từ ô tô qua chuẩn truyền thông CAN.
*   Xây dựng ứng dụng trên điện thoại có chức năng theo dõi thông số và cảnh báo người dùng.
*   Xây dựng lưu trữ dữ liệu đám mây.

> **Note:** Bên phải có hình minh họa biểu tượng "Hồng tâm" (Target) thể hiện mục tiêu cần đạt được.

---

## Trang 5: II. Nội dung thực hiện - Giao thức CAN

**1. Giao thức CAN (Controller Area Network)**

*   CAN là chuẩn giao tiếp tiêu chuẩn giữa các thiết bị điện trên ô tô với nhau.
*   CAN hoạt động theo cơ chế giao tiếp tín hiệu, chỉ cần kết nối hai dây CANH và CANL.
*   CAN có khả năng chống nhiễu tốt, truyền dữ liệu tốc độ cao.

> **Note:** Hình minh họa mô tả cáp xoắn đôi gồm hai dây CAN High (màu vàng) và CAN Low (màu xanh lá) xoắn vào nhau để chống nhiễu.

---

## Trang 6: II. Nội dung thực hiện - Kết nối mạng CAN

**1. Giao thức CAN (Controller Area Network)**

*   **Hình ảnh mô tả kết nối trên mạng CAN:**
    *   Hệ thống gồm các ECU (Node A, Node B, Node C...) kết nối song song vào Bus.
    *   Mỗi ECU gồm: MCU <-> Transceiver <-> Connector <-> CAN Bus.
    *   Bus gồm 2 dây: CAN HIGH và CAN LOW.
    *   Hai đầu mạng có điện trở đầu cuối (Termination).
    *   Cấu trúc gói tin: ID + DATA.

---

## Trang 7: II. Nội dung thực hiện - Điện áp CAN

**1. Giao thức CAN (Controller Area Network)**

*   **Biểu đồ điện áp trên hai dây CANH và CANL:**
    *   Trạng thái nghỉ (Recessive): Cả CAN High và CAN Low đều ở mức điện áp khoảng 2.5V.
    *   Chênh lệch điện áp gần bằng 0V.

---

## Trang 8: II. Nội dung thực hiện - Mức Logic 1

**1. Giao thức CAN (Controller Area Network)**

*   **Biểu đồ điện áp mức Logic 1 (Recessive):**
    *   Mức điện áp: CAN High $\approx$ 2.5V, CAN Low $\approx$ 2.5V.
    *   Hiệu điện thế: $2.5V - 2.5V = 0V$.
    *   Tương ứng với bit **1**.

---

## Trang 9: II. Nội dung thực hiện - Mức Logic 0

**1. Giao thức CAN (Controller Area Network)**

*   **Biểu đồ điện áp mức Logic 0 (Dominant):**
    *   Mức điện áp: CAN High lên 3.5V, CAN Low xuống 1.5V.
    *   Hiệu điện thế: $3.5V - 1.5V = 2V$.
    *   Tương ứng với bit **0**.

---

## Trang 10: II. Nội dung thực hiện - Khả năng chống nhiễu

**1. Giao thức CAN (Controller Area Network)**

*   Nhờ vào việc kiểm tra chênh lệch điện áp giữa CANH và CANL, giao thức CAN có khả năng chống nhiễu tốt.

> **Note:** Hình ảnh minh họa tín hiệu khi bị nhiễu (gai điện áp) tác động lên cả 2 dây cùng lúc. Do CAN đọc hiệu điện thế ($V_{diff} = V_{CANH} - V_{CANL}$), nhiễu tác động đồng thời lên cả hai dây sẽ bị triệt tiêu khi tính hiệu số, giúp dữ liệu toàn vẹn.

---

## Trang 11: II. Nội dung thực hiện - Sơ đồ khối

**2. Sơ đồ khối của hệ thống**

*   **Khối nguồn:** Cấp điện cho hệ thống.
*   **Nhánh thu thập dữ liệu:**
    *   Khối định vị (GPS).
    *   Khối mô phỏng -> Khối giao tiếp CAN -> Khối thu thập và xử lý dữ liệu.
*   **Khối xử lý trung tâm:** Nhận dữ liệu từ khối thu thập.
    *   Gửi dữ liệu lên **Cloud** <-> **Khối giao diện người dùng (APP)**.
    *   Xuất ra **Khối hiển thị**.
    *   Điều khiển **Khối cảnh báo**.

---

## Trang 12: II. Nội dung thực hiện - Sơ đồ nguyên lý

**3. Sơ đồ nguyên lý**

> **Note:** Hình ảnh là bản vẽ thiết kế mạch điện tử (Schematic) chi tiết bao gồm các phần:
> *   Khối truyền nhận CAN (Sử dụng MCP2515).
> *   Khối thu thập và xử lý dữ liệu (Arduino Nano).
> *   Khối xử lý trung tâm (Raspberry Pi/Board nhúng tương tự).
> *   Khối định vị (Module GPS).
> *   Khối cảnh báo (Buzzer).
> *   Khối hiển thị (Màn hình LCD 7 inch).
> *   Khối mô phỏng dữ liệu (Biến trở).

---

## Trang 13: II. Nội dung thực hiện - Lưu đồ giải thuật (Tổng quan)

**4. Lưu đồ giải thuật hệ thống**

1.  **Bắt đầu**.
2.  **Tạo dữ liệu mô phỏng**.
3.  **Gửi dữ liệu vào mạng CAN**.
4.  **Thu thập, xử lý dữ liệu và gửi vào khối xử lý trung tâm**.
5.  **Gửi dữ liệu lên Firebase**.
6.  **Kết thúc**.

---

## Trang 14: II. Nội dung thực hiện - Lưu đồ giải thuật (GPS & Mô phỏng)

**4. Lưu đồ giải thuật hệ thống**

*   **Lưu đồ giải thuật thu thập GPS (Trái):**
    1.  Bắt đầu -> Thu thập dữ liệu GPS.
    2.  Kiểm tra: Có tín hiệu GPS?
        *   Sai: Quay lại thu thập.
        *   Đúng: Đọc dữ liệu GPS -> Gửi đến khối thu thập dữ liệu -> Kết thúc.
*   **Lưu đồ giải thuật mô phỏng dữ liệu (Phải):**
    1.  Bắt đầu -> Thiết lập cấu hình CAN.
    2.  Đọc giá trị từ các biến trở.
    3.  Thêm các mã CAN ID, DLC cho dữ liệu.
    4.  Gửi dữ liệu vào mạng CAN -> Kết thúc.

---

## Trang 15: II. Nội dung thực hiện - Lưu đồ giải thuật (Xử lý & Firebase)

**4. Lưu đồ giải thuật hệ thống**

*   **Lưu đồ thu thập và xử lý dữ liệu (Trái):**
    1.  Bắt đầu -> Thiết lập cấu hình CAN.
    2.  Đọc dữ liệu trên CAN BUS.
    3.  Kiểm tra: Có dữ liệu trên CAN BUS?
        *   Sai: Quay lại đọc.
        *   Đúng: Thu thập và gửi qua bộ xử lý trung tâm -> Kết thúc.
*   **Lưu đồ gửi dữ liệu Firebase (Phải):**
    1.  Bắt đầu -> Thiết lập IP, auth của Firebase.
    2.  Nhận dữ liệu từ khối thu thập và xử lý.
    3.  Kiểm tra: Có dữ liệu được gửi?
        *   Sai: Quay lại nhận.
        *   Đúng: Gửi dữ liệu vào các thông điệp tương ứng trên Firebase -> Kết thúc.

---

## Trang 16: II. Nội dung thực hiện - Lưu đồ giải thuật (Cảnh báo & Bản đồ)

**4. Lưu đồ giải thuật hệ thống**

*   **Lưu đồ giải thuật cảnh báo (Trái):**
    1.  Bắt đầu -> Cài đặt cảnh báo.
    2.  Kiểm tra: Có thông số vượt mức quy định?
        *   Sai: Quay lại kiểm tra.
        *   Đúng: Hiển thị cảnh báo -> Kích hoạt còi báo -> Kết thúc.
*   **Lưu đồ giải thuật xử lý bản đồ và điều hướng (Phải):**
    1.  Bắt đầu -> Khởi tạo bản đồ -> Cập nhật vị trí hiện tại lên bản đồ.
    2.  Yêu cầu dẫn đường?
        *   Sai: Cập nhật vị trí.
        *   Đúng: Tìm kiếm và chọn địa điểm cần đến -> Lấy tuyến đường từ API -> Cập nhật tuyến đường trên bản đồ.
    3.  Đã đến điểm cần đến?
        *   Sai: Cập nhật tuyến đường.
        *   Đúng: Kết thúc dẫn đường -> Kết thúc.

---

## Trang 17: II. Nội dung thực hiện - Use Case

**4. Lưu đồ giải thuật hệ thống**

*   **Biểu đồ use case của ứng dụng:**
    *   **User (Người dùng)** tương tác với các chức năng:
        *   Đăng nhập (Include: Màn hình chính).
        *   Đăng kí.
        *   Quên mật khẩu.
    *   **Màn hình chính** mở rộng (Extend) ra các chức năng:
        *   Thông tin xe.
        *   Cảnh báo.
        *   Biểu đồ của xe.
        *   Định vị xe.
        *   Thông tin cá nhân (Extend: Thay đổi thông tin, Thêm/xóa xe, Đăng xuất).

---

## Trang 18: III. Kết quả thực hiện - Phần cứng (Arduino Uno)

**1. Kết quả phần cứng**

*   **Arduino Uno:** Sử dụng đọc dữ liệu từ cảm biến gửi lên mạng CAN.
*   **Hình ảnh:** Mô hình hệ thống trong hộp thực tế, mũi tên chỉ vào mạch Arduino Uno.

---

## Trang 19: III. Kết quả thực hiện - Phần cứng (Arduino Nano)

**1. Kết quả phần cứng**

*   **Arduino Nano:** Đọc dữ liệu trên mạng CAN, xử lý và gửi cho khối xử lý trung tâm.
*   **Hình ảnh:** Mũi tên chỉ vào mạch Arduino Nano màu xanh dương nhỏ.

---

## Trang 20: III. Kết quả thực hiện - Phần cứng (GPS)

**1. Kết quả phần cứng**

*   **Mô-đun GPS-6M:** Dùng để đọc dữ liệu GPS (vị trí, tọa độ).
*   **Hình ảnh:** Mũi tên chỉ vào module GPS có anten gốm vuông.

---

## Trang 21: III. Kết quả thực hiện - Phần cứng (MCP2515)

**1. Kết quả phần cứng**

*   **Hai mô-đun CAN MCP2515:** Được kết nối với nhau để tiến hành giao tiếp trên mạng CAN (một module gắn với Uno, một module gắn với Nano).
*   **Hình ảnh:** Mũi tên khoanh vùng 2 module CAN màu xanh dương.

---

## Trang 22: III. Kết quả thực hiện - Phần cứng (Biến trở)

**1. Kết quả phần cứng**

*   **Các cảm biến được thay thế bằng biến trở** để điều khiển giá trị mô phỏng như:
    *   Tốc độ vòng tua (RPM).
    *   Tốc độ xe (Speed).
    *   Nhiên liệu (Fuel).
    *   Nhiệt độ nước mát (Temp).
*   **Hình ảnh:** Mũi tên chỉ vào hàng 4 núm vặn biến trở bên phải hộp.

---

## Trang 23: III. Kết quả thực hiện - Toàn bộ mô hình

**1. Kết quả phần cứng**

*   **Mô hình hệ thống hoàn chỉnh:** Bao gồm hộp thiết bị điều khiển (biến trở, mạch), màn hình LCD hiển thị giao diện dashboard và bản đồ, cùng với điện thoại di động chạy ứng dụng giám sát.

---

## Trang 24: III. Kết quả thực hiện - Phần mềm (CAN ID)

**2. Kết quả phần mềm**

*   **Hình ảnh Log dữ liệu CAN:** Bảng hiển thị ID, DLC, DATA, DECODED.
*   **Chi tiết:** Khung đỏ khoanh vào cột **ID** (Ví dụ: 0x0B4, 0x2C4, 0x344...).
*   **Chú thích:** Mã CAN dùng để định danh dữ liệu (Ví dụ 0x0B4 là Vehicle Speed).

---

## Trang 25: III. Kết quả thực hiện - Phần mềm (DLC)

**2. Kết quả phần mềm**

*   **Hình ảnh Log dữ liệu CAN.**
*   **Chi tiết:** Khung đỏ khoanh vào cột **DLC** (Giá trị toàn là 8).
*   **Chú thích:** Data Length Code là độ dài bytes được gửi lên mạng CAN.

---

## Trang 26: III. Kết quả thực hiện - Phần mềm (DATA)

**2. Kết quả phần mềm**

*   **Hình ảnh Log dữ liệu CAN.**
*   **Chi tiết:** Khung đỏ khoanh vào cột **DATA** (Các byte Hex: 00 55 00...).
*   **Chú thích:** Dữ liệu đọc được trên mạng CAN (Dữ liệu thô).

---

## Trang 27: III. Kết quả thực hiện - Phần mềm (DECODED)

**2. Kết quả phần mềm**

*   **Hình ảnh Log dữ liệu CAN.**
*   **Chi tiết:** Khung đỏ khoanh vào cột **DECODED** (Ví dụ: Speed: 85 km/h, RPM: 3200...).
*   **Chú thích:** Dữ liệu sau khi đã được xử lý (Giải mã từ Hex sang giá trị thực tế).

---

## Trang 28: III. Kết quả thực hiện - Màn hình LCD

**2. Kết quả phần mềm**

*   **Màn hình hiển thị giá trị đọc từ mô phỏng:**
    *   Giao diện Dashboard trên màn hình LCD.
    *   Hiển thị đồng hồ tốc độ (Speed), vòng tua (RPM), Nhiệt độ (90°C), Nhiên liệu (75%).
    *   Bản đồ định vị bên phải.

---

## Trang 29: III. Kết quả thực hiện - Kết nối WiFi

**2. Kết quả phần mềm**

*   **Màn hình lựa chọn WiFi kết nối:** Giao diện cho phép thiết bị kết nối với mạng WiFi (Danh sách: Lucy 5G, Phuong Phi, Dui De...).

---

## Trang 30: III. Kết quả thực hiện - Firebase

**2. Kết quả phần mềm**

*   **Hình bên trái:** Cấu trúc Realtime Database trên Firebase (CAR_001 -> Dashboard -> fuel, rpm, speed, temp, GPS). -> *Dữ liệu được gửi lên Firebase*.
*   **Hình bên phải:** Dữ liệu log lịch sử trong Firestore (car_logs). -> *Dữ liệu được lưu trữ vào Firestore*.

---

## Trang 31: III. Kết quả thực hiện - Cảnh báo (Tốc độ/RPM)

**2. Kết quả phần mềm**

*   **Hệ thống cảnh báo khi có thông số vượt mức:**
    *   **(a) Khi tốc độ vòng tua động cơ cao:** Hiển thị thông báo đỏ "RPM quá cao! 7537".
    *   **(b) Khi tốc độ xe cao:** Hiển thị thông báo đỏ "Vượt tốc độ! 122 km/h".

---

## Trang 32: III. Kết quả thực hiện - Cảnh báo (Nhiệt/Nhiên liệu)

**2. Kết quả phần mềm**

*   **Hệ thống cảnh báo khi có thông số vượt mức:**
    *   **(c) Khi nhiệt độ nước mát quá cao:** Hiển thị thông báo đỏ "Nhiệt độ cao! 112°C".
    *   **(d) Khi nhiên liệu thấp:** Hiển thị thông báo đỏ "Nhiên liệu thấp! 11%".

---

## Trang 33: III. Kết quả thực hiện - Tìm đường

**2. Kết quả phần mềm**

*   **Tìm địa điểm trên màn hình:**
    *   **(a) Danh sách gợi ý địa điểm:** Hiển thị bàn phím ảo và danh sách gợi ý khi nhập liệu.
    *   **(b) Địa điểm được chọn hiện trên bản đồ:** Hiển thị marker vị trí trường ĐH Sư phạm Kỹ thuật trên bản đồ.

---

## Trang 34: III. Kết quả thực hiện - Dẫn đường

**2. Kết quả phần mềm**

*   **Bắt đầu chế độ dẫn đường:**
    *   **(a) Lựa chọn chế độ dẫn đường:** Hiển thị thông tin quãng đường (18.5 km), thời gian (43 phút) và nút "Bắt đầu".
    *   **(b) Bắt đầu dẫn đường:** Giao diện điều hướng 3D, hiển thị mũi tên chỉ đường và thông báo giọng nói/văn bản (Lái xe hướng đông...).

---

## Trang 35: III. Kết quả thực hiện - Ứng dụng di động (Auth)

**3. Kết quả ứng dụng**

*   **Giao diện đăng nhập:** Cho phép người dùng đăng nhập vào hệ thống (Email, Mật khẩu).
*   **Giao diện đăng kí:** Cho phép người dùng tạo tài khoản trên hệ thống (Email, Mật khẩu, Nhập lại mật khẩu).

---

## Trang 36: III. Kết quả thực hiện - Ứng dụng di động (Dashboard)

**3. Kết quả ứng dụng**

*   **Giao diện màn hình chính:**
    *   Hiển thị các thông số (Nhiệt độ, Nhiên liệu, Tốc độ, Vòng tua) đang được gửi lên Firebase theo thời gian thực.
    *   Giúp người dùng theo dõi thông số hiện tại của xe từ xa.
    *   Từ màn hình chính người dùng có thể đổi qua các màn hình khác (Alerts, Chart, Map, Profile).

---

## Trang 37: III. Kết quả thực hiện - Ứng dụng di động (Charts)

**3. Kết quả ứng dụng**

*   **Biểu đồ dữ liệu:**
    *   Cho phép người dùng truy xuất dữ liệu được lưu trên cơ sở dữ liệu (Lịch sử hành trình).
    *   Hiển thị dưới dạng biểu đồ cột (Tốc độ, Nhiên liệu, RPM, Nhiệt độ) giúp dễ dàng so sánh theo thời gian.

---

## Trang 38: III. Kết quả thực hiện - Ứng dụng di động (Map)

**3. Kết quả ứng dụng**

*   **Hiển thị vị trí của xe:**
    *   Dựa vào GPS hiện tại được lưu trên Firebase hiển thị vị trí trên bản đồ Google Maps tích hợp trong ứng dụng.
    *   Hiển thị địa chỉ cụ thể và tọa độ (lat, lon).

---

## Trang 39: III. Kết quả thực hiện - Ứng dụng di động (Thông báo)

**3. Kết quả ứng dụng**

*   **Hiển thị cảnh báo:**
    *   Giao diện thông báo chứa danh sách lịch sử các cảnh báo.
    *   Ghi nhận khi có thông số của phương tiện vượt quá các mức quy định (Ví dụ: Vượt quá tốc độ, RPM vượt ngưỡng, Nhiệt độ quá cao...).
    *   Hiển thị thời gian và giá trị cụ thể lúc xảy ra cảnh báo.

---

## Trang 40: IV. Kết luận và Hướng phát triển - Kết luận

**1. Kết luận**

*   Thu thập dữ liệu từ ô tô qua chuẩn truyền thông CAN.
*   Hiển thị các thông số trên màn hình.
*   Theo dõi và hiển thị dữ liệu GPS.
*   Lưu trữ dữ liệu trên cơ sở dữ liệu đám mây.
*   Giám sát các thông số thông qua ứng dụng điện thoại.
*   Truy xuất biểu đồ dữ liệu lưu trữ trong cơ sở dữ liệu.
*   Cảnh báo các thông số vượt ngưỡng, hiển thị cảnh báo trên màn hình và thông báo ứng dụng điện thoại.

---

## Trang 41: IV. Kết luận và Hướng phát triển - Hạn chế

**2. Hạn chế**

*   Dữ liệu sử dụng của hệ thống vẫn chỉ là dữ liệu mô phỏng chưa đúng với thực tế.
*   Không tập trung vào bảo mật dữ liệu.
*   Phần cứng hệ thống còn cồng kềnh, chưa tối ưu về kích thước và khả năng chống rung, chống nhiễu trong môi trường ô tô.

---

## Trang 42: IV. Kết luận và Hướng phát triển - Hướng phát triển

**3. Hướng phát triển**

1.  Kết nối trực tiếp với hệ thống CAN thực tế của ô tô để thu thập dữ liệu từ các ECU thay vì sử dụng dữ liệu mô phỏng.
2.  Kết hợp theo dõi nhiều thông số quan trọng hơn trên xe như: áp suất lốp xe, môi trường xung quanh.
3.  Cải tiến thuật toán xử lý dữ liệu CAN nhằm tăng độ chính xác và ổn định.

---

## Trang 43: Kết thúc

**CẢM ƠN CÁC THẦY CÔ ĐÃ LẮNG NGHE**