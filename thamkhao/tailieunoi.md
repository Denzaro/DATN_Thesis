# PHẠM VI ĐỀ TÀI

## 1. Phạm vi về Dữ liệu Thu thập

### Bao gồm:
- Dữ liệu ảnh snapshot từ camera giao thông công cộng tại TP.HCM (nguồn: giaothong.hochiminhcity.gov.vn)

### Giới hạn:
- Chỉ thu thập tại **giờ cao điểm** (sáng và chiều), không bao phủ toàn bộ 24h
- Chất lượng ảnh **phụ thuộc vào điều kiện môi trường** (ánh sáng, thời tiết)
- Camera có **vị trí và góc quay cố định**, không thể điều chỉnh
- Dữ liệu **rời rạc** (snapshot), không phải video liên tục

---

## 2. Phạm vi về Nhận diện Phương tiện

### Bao gồm:
- Nhận diện và đếm **ô tô** bằng YOLOv11 (bounding box)
- Nhận diện **xe máy** bằng phương pháp lai (Hybrid Method: YOLO + ROI Coverage)

### Giới hạn:
- Độ chính xác **giảm trong điều kiện bất lợi** (mưa, sương mù, bóng đổ, che khuất)
- Chưa nhận diện **người đi bộ, xe đạp, xe buýt** hoặc các loại phương tiện khác
- Phương pháp ROI cho xe máy dựa trên **hệ số quy đổi thực nghiệm**, có thể sai lệch ở các khu vực khác

---

## 3. Phạm vi về Dự báo Tắc nghẽn

### Bao gồm:
- Dự báo **mức độ tắc nghẽn** (gridlock level 0-5) cho **10-15 phút tiếp theo**
- Sử dụng mô hình **LSTM** với dữ liệu chuỗi thời gian

### Giới hạn:
- Chỉ dự báo **ngắn hạn** (10-15 phút), không dự báo dài hạn
- Mô hình huấn luyện trên **dữ liệu giờ cao điểm**, có thể kém chính xác với tình huống bất thường (tai nạn, sự kiện đặc biệt)
- Chỉ tập trung vào **mật độ phương tiện**, chưa tích hợp đầy đủ các yếu tố khác (loại xe, tốc độ, hành vi lái xe, thời tiết)

---

## 4. Phạm vi về Mô phỏng Giao thông

### Bao gồm:
- Mô phỏng **vi mô** trên nền tảng SUMO
- Bản đồ thực tế từ **OpenStreetMap** (khu vực nghiên cứu cụ thể tại TP.HCM)
- Mô phỏng **hành vi phương tiện** theo các tham số được hiệu chỉnh

### Giới hạn:
Mô phỏng **không hoàn toàn bám sát thực tế** do:
- Chưa mô hình hóa đầy đủ **hành vi vi phạm giao thông** (phổ biến tại VN)
- Chưa tính **tương tác phức tạp** giữa xe máy, ô tô, người đi bộ
- Chưa tích hợp **ảnh hưởng thời tiết, sự cố giao thông**
- Mô phỏng chỉ tại **một số nút giao cụ thể**, chưa mở rộng toàn mạng lưới

---

## 5. Phạm vi về Điều khiển Đèn tín hiệu

### Bao gồm:
- Điều chỉnh **thời gian đèn xanh** (Green Duration) trong khoảng **40-80 giây**
- Sử dụng **DurationAgent** (Reinforcement Learning - Actor-Critic)
- Tối ưu hóa **thông lượng** (throughput) và **reward** toàn mạng

### Giới hạn:
- Chỉ điều chỉnh **thời gian đèn xanh**, không điều chỉnh **tỷ lệ làn đường** hoặc **chu kỳ đèn**
- Hiệu quả **giảm khi giao thông bão hòa** (vượt quá sức chứa hạ tầng)
- Chưa triển khai **thực tế**, chỉ dừng ở mức mô phỏng
- Hàng đợi (queue) có thể **tăng nhẹ** do chiến lược tối ưu toàn cục

---

## 6. Phạm vi về Khu vực Nghiên cứu

### Bao gồm:
- Một số nút giao thông tại **TP. Hồ Chí Minh**

### Giới hạn:
- Chưa mở rộng ra **nhiều nút giao** hoặc **toàn mạng lưới đô thị**
- Kết quả có thể **không khái quát hóa** sang các thành phố khác có đặc điểm giao thông khác biệt

---

## 7. Phạm vi về Triển khai Thực tế

### Bao gồm:
- Xây dựng **Dashboard trực quan** để giám sát và đánh giá
- Hệ thống hoạt động trong **môi trường mô phỏng**

### Giới hạn:
- Chưa triển khai trên **thiết bị nhúng** (Jetson Nano) hoặc hệ thống thực tế
- Chưa tính toán **chi phí triển khai, bảo trì** trong thực tế
- Chưa đánh giá **phản ứng của người tham gia giao thông** khi áp dụng

---

## TÓM TẮT NGẮN GỌN (Để thêm vào Slide/Báo cáo)

> **Với mục tiêu xây dựng hệ thống điều khiển đèn tín hiệu thông minh, đề tài giới hạn phạm vi nghiên cứu như sau:**
>
> - **Dữ liệu**: Ảnh snapshot từ camera công cộng tại TP.HCM, tập trung giờ cao điểm
> - **Nhận diện**: Chỉ ô tô và xe máy (phương pháp YOLO + ROI)
> - **Dự báo**: Ngắn hạn 10-15 phút, mức độ tắc nghẽn 0-5
> - **Mô phỏng**: Vi mô trên SUMO, một số nút giao cụ thể, chưa bao gồm đầy đủ hành vi vi phạm giao thông
> - **Điều khiển**: Chỉ điều chỉnh thời gian đèn xanh (40-80s), chưa triển khai thực tế
> - **Độ bám sát thực tế**: Mô phỏng đơn giản hóa một số yếu tố (thời tiết, sự cố, hành vi người lái), kết quả mang tính tham khảo cho nghiên cứu

---

## 8. Phạm vi về Hệ thống Điều khiển Đèn Giao thông (Traffic TLS LSTM)

### Bao gồm:
- Sử dụng **Deep Reinforcement Learning** với kiến trúc phân cấp (Hierarchical):
  - **DurationAgent**: Mô hình LSTM điều chỉnh thời gian đèn xanh (40-80 giây)
  - **LaneRatioAgent**: Mô hình Beta Distribution phân bổ tỷ lệ làn đường
- Huấn luyện song song với **16 workers** (parallel training)
- Tổng **2000 episodes** training trên môi trường SUMO
- Input: 3 đặc trưng (lưu lượng, mật độ, thời gian chờ)
- Output: Thời gian đèn xanh tối ưu và tỷ lệ phân bổ làn đường

### Giới hạn:
- **Kiến trúc LSTM đơn giản**: Chỉ 1 lớp LSTM với 64 hidden units, chưa thử nghiệm với kiến trúc phức tạp hơn (Multi-layer LSTM, Transformer)
- **Số đặc trưng đầu vào hạn chế**: Chỉ 3 features (lưu lượng, mật độ, thời gian chờ), chưa tích hợp:
  - Dự báo tắc nghẽn từ LSTM Gridlock Prediction
  - Thông tin thời tiết, sự kiện đặc biệt
  - Dữ liệu lịch sử dài hạn (giờ cao điểm, ngày trong tuần)
- **Phạm vi điều chỉnh**: 
  - Chỉ điều chỉnh **thời gian đèn xanh** (40-80s) và **tỷ lệ làn đường**
  - Không điều chỉnh **chu kỳ đèn** hoặc **thứ tự pha tín hiệu**
- **Training time**: Yêu cầu **2000 episodes** (thời gian training dài), chưa tối ưu hóa tốc độ hội tụ
- **Hardware requirements**: Cần GPU mạnh (NVIDIA V100+, 16GB VRAM) và 16+ CPU cores cho parallel training
- **Khả năng khái quát hóa**:
  - Model được train trên **một mạng lưới cụ thể** (khu vực nghiên cứu tại TP.HCM)
  - Chưa kiểm chứng khả năng **transfer learning** sang mạng lưới khác
  - Có thể cần **retrain** khi thay đổi topology mạng
- **Reward function đơn giản**: Chỉ tối ưu throughput và giảm thời gian chờ, chưa tính:
  - Công bằng giữa các hướng (fairness)
  - Tiêu thụ nhiên liệu, khí thải
  - Ưu tiên xe ưu tiên (xe cứu thương, xe buýt)
- **Chưa tích hợp với Gridlock Prediction**: Hai hệ thống (LSTM dự báo tắc nghẽn và RL điều khiển đèn) hoạt động **độc lập**, chưa kết nối để tận dụng dự báo cho quyết định điều khiển

### Kết quả đạt được:
- **Best Episode Reward**: 4388.3 (Episode 1011)
- **Throughput tăng**: +88.5% so với đèn cố định
- **Reward cải thiện**: +40.5%
- **Trade-off**: Hàng đợi tăng nhẹ (2.25 → 4.25 xe) do chiến lược tối ưu toàn cục

---

## Gợi ý Sử dụng

Bạn có thể sử dụng nội dung này để bổ sung vào:
1. **Phần "Phạm vi đề tài"** trong Chương 1 của báo cáo
2. **Slide thuyết trình** khi giới thiệu giới hạn nghiên cứu
3. **Phần trả lời câu hỏi phản biện** về phạm vi và giới hạn của đề tài