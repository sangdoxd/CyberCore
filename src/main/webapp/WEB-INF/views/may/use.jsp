<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="pageTitle" value="Sử Dụng Máy"/>
<c:set var="pageContent">
    <h3>${pageTitle}</h3>
    <form method="post">
        <div class="form-group">
            <label for="maKH">Mã Khách Hàng</label>
            <input list="khachHangList" id="maKH" name="maKH" class="form-control"/>
            <datalist id="khachHangList">
                <option value="" disabled ${empty suDungMay.id.maKH ? 'selected' : ''}>Vui lòng chọn khách hàng sử dụng
                    máy
                </option>
                <c:forEach var="khachHang" items="${khachHangList}">
                    <option
                            value="${khachHang.maKH}"
                        ${suDungMay.id.maKH eq khachHang.maKH ? 'selected' : ''}
                    >${khachHang.maKH} - ${khachHang.tenKH}</option>
                </c:forEach>
            </datalist>
                <%--            <select--%>
                <%--                    id="maKH"--%>
                <%--                    class="form-control ${not empty error.get("id.maKH") ? 'is-invalid' : ''}"--%>
                <%--                    name="id.maKH"--%>
                <%--            >--%>
                <%--                <option value="" disabled ${empty suDungMay.id.maKH ? 'selected' : ''}>Vui lòng chọn khách hàng sử dụng--%>
                <%--                    máy--%>
                <%--                </option>--%>
                <%--                <c:forEach var="khachHang" items="${khachHangList}">--%>
                <%--                    <option--%>
                <%--                            value="${khachHang.maKH}"--%>
                <%--                        ${suDungMay.id.maKH eq khachHang.maKH ? 'selected' : ''}--%>
                <%--                    >${khachHang.maKH} - ${khachHang.tenKH}</option>--%>
                <%--                </c:forEach>--%>
                <%--            </select>--%>
            <div class="invalid-feedback">${error.get("id.maKH")}</div>
        </div>

        <div class="form-group">
            <label for="maMay">Mã Máy</label>
            <input list="maMayList" id="maMay" name="maMay" class="form-control" placeholder="Chọn máy đi em">
            <datalist id="maMayList">
                <option value="" disabled ${empty suDungMay.id.maMay ? 'selected' : ''}>Vui lòng chọn máy được sử dụng
                </option>
                <c:forEach var="khachHang" items="${mayList}">
                    <option
                            value="${khachHang.maMay}"
                        ${suDungMay.id.maMay eq khachHang.maMay ? 'selected' : ''}
                    >${khachHang.maMay} - ${khachHang.trangThai} - ${khachHang.viTri}</option>
                </c:forEach>
            </datalist>
            <div class="invalid-feedback">${error.get("id.maMay")}</div>
        </div>

        <div class="form-group">
            <label for="ngayBatDauSuDung">Ngày Bắt Đầu Sử Dụng</label>
            <input type="date" id="ngayBatDauSuDung"
                   class="form-control ${not empty error.get('id.ngayBatDauSuDung') ? 'is-invalid' : ''}"
                   name="id.ngayBatDauSuDung"
                   value="${suDungMay.id.ngayBatDauSuDung}"

            >
            <div class="invalid-feedback">${error.get('id.ngayBatDauSuDung')}</div>
        </div>

        <div class="form-group">
            <label for="gioBatDauSuDung">Giờ Bắt Đầu Sử Dụng ${error.id}</label>
            <input type="time" id="gioBatDauSuDung"
                   class="form-control ${not empty error.get('id.gioBatDauSuDung') ? 'is-invalid' : ''}"
                   name="id.gioBatDauSuDung"
                   value="${suDungMay.id.gioBatDauSuDung}"
            >
            <div class="invalid-feedback">${error.get('id.gioBatDauSuDung')}</div>
        </div>

        <div class="form-group">
            <label for="thoiGianSuDung">Thời Gian Sử Dụng (Phút)</label>
            <input type="number" id="thoiGianSuDung"
                   class="form-control ${not empty error.thoiGianSuDung ? 'is-invalid' : ''}"
                   name="thoiGianSuDung"
                   value="${suDungMay.thoiGianSuDung}"
            >
            <div class="invalid-feedback">${error.thoiGianSuDung}</div>
        </div>
        <div class="text-success">${successMessage}</div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <script>
        $(document).ready(function () {
            let maKH = $('#maKH');
            let maMay = $('#maMay');
            let ngayBatDauSuDung = $('#ngayBatDauSuDung');
            let gioBatDauSuDung = $('#gioBatDauSuDung');
            let thoiGianSuDung = $('#thoiGianSuDung');

            [maKH, maMay, ngayBatDauSuDung, gioBatDauSuDung].forEach(item => item.on('change', function () {
                $(this).removeClass('is-invalid');
            }));

            [thoiGianSuDung].forEach(item => item.on('input', function () {
                $(this).removeClass('is-invalid');
            }))

        })
    </script>
</c:set>

<%@include file="../layout/main.jsp" %>