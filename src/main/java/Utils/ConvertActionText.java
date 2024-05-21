package Utils;

/**
 *
 * @author Le Tan Kim
 */
public class ConvertActionText {

    public String convertActionText(String act, int status) {
        String messange = "";
        switch (act) {
            case "add-new":
                if (status == 1) {
                    messange = "Thêm thành công";
                } else {
                    messange = "Thêm thất bại. Thử lại";
                }
                break;
            case "update-account":
                if (status == 1) {
                    messange = "Update successfully";
                } else if (status == 2) {
                    messange = "Email is used. Try another email";
                } else {
                    messange = "Update fail. Try again";
                }
                break;
            case "add-voucher":
                if (status == 1) {
                    messange = "Add voucher successfully";
                } else if (status == 0) {
                    messange = "Add voucher fail. Try again";
                } else {
                    messange = "Voucher is exist in system";
                }
                break;
            case "update-voucher":
                if (status == 1) {
                    messange = "Update successfully";
                } else if (status == 2) {
                    messange = "Voucher is exist in system";
                } else {
                    messange = "Update fail. Try again";
                }
                break;
            case "delete":
                if (status == 1) {
                    messange = "Delete successfully";
                } else if (status == 2) {
                    messange = "Please choose account to delete";
                } else {
                    messange = "Delete fail. Try again";
                }
                break;
            case "add-cart":
                if (status == 1) {
                    messange = "Add cart successfully";
                } else if (status == 2) {
                    messange = "Quantities exceeding the quantity are limited ";
                } else {
                    messange = "Add cart fail";
                }
                break;
            case "update-cart":
                if (status == 1) {
                    messange = "Update cart successfully";
                } else if (status == 2) {
                    messange = "Quantities exceeding the quantity are limited ";
                } else {
                    messange = "Update cart fail";
                }
                break;
            case "remove-cart":
                if (status == 1) {
                    messange = "Remove item successfully";
                } else {
                    messange = "Remove item fail. Try again";
                }
                break;
            case "add-staff":
            case "add-candidate":
                if (status == 2) {
                    messange = "Tài khoản này đã tồn tại";
                } else if (status == 1) {
                    messange = "Thêm tài khoản thành công";
                } else if (status == 3) {
                    messange = "Email này đã được sử dụng";
                } else {
                    messange = "Thêm tài khoản thất bại. Thử lại";
                }
                break;
            case "add-company":
                if (status == 2) {
                    messange = "Email này đã được sử dụng";
                } else if (status == 1) {
                    messange = "Thêm tài khoản thành công";
                } else {
                    messange = "Thêm tài khoản thất bại. Thử lại";
                }
                break;
            case "update-candidate":
            case "update-staff":
            case "update-company":
            case "update-profile":
                if (status == 2) {
                    messange = "Email này đã được sử dụng";
                } else if (status == 1) {
                    messange = "Cập nhật tài khoản thành công";
                } else {
                    messange = "Cập nhật tài khoản thất bại. Thử lại";
                }
                break;
            case "update":
                if (status == 1) {
                    messange = "Cập nhật thành công";
                } else {
                    messange = "Cập nhật thất bại. Thử lại";
                }
                break;
            case "update-password":
                if (status == 1) {
                    messange = "Cập nhật mật khẩu thành công";
                } else if (status == 2) {
                    messange = "Mật khẩu cũ không hợp lệ";
                } else {
                    messange = "Cập nhật mật khẩu thất bại. Thử lại";
                }
                break;
            case "update-name":
                if (status == 1) {
                    messange = "Cập nhật thành công";
                } else if (status == 2) {
                    messange = "Tên này đã được sử dụng";
                } else {
                    messange = "Cập nhật thất bại. Thử lại";
                }
                break;
            case "update-profile-candidate":
                if (status == 1) {
                    messange = "Cập nhật thành công";
                } else if (status == 2) {
                    messange = "Email này đã được sử dụng";
                } else if (status == 3) {
                    messange = "Hãy nhập email mới";
                } else {
                    messange = "Cập nhật thất bại. Thử lại";
                }
                break;
            case "send-mail":
                if (status == 1) {
                    messange = "Gửi liên hệ đến ứng viên thành công.";
                } else {
                    messange = "Gửi liên hệ đến ứng viên thất bại.";
                }
                break;
        }
        return messange;
    }
}
