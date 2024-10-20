<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Shopping.Admin.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <%@ Register Src="~/Admin/Include/header.ascx" TagName="Header" TagPrefix="uc" %>
     <uc:Header runat="server" />

            
              <main>

         <!-- breadcrumb area start -->
         <section class="breadcrumb__area include-bg text-center pt-95 pb-50">
            <div class="container">
               <div class="row">
                  <div class="col-xxl-12">
                     <div class="breadcrumb__content p-relative z-index-1">
                        <h3 class="breadcrumb__title">Add Product</h3>
                        <div class="breadcrumb__list">
                           <span><a href="#">Dashboard</a></span>
                           <span>Add Product</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- breadcrumb area end -->
          <script>
        function previewFile() {
            const preview = document.getElementById('file-preview');
            const file = document.querySelector('input[type=file]').files[0];
            const reader = new FileReader();

            reader.onloadend = function () {
                const img = document.createElement('img');
                img.src = reader.result;
                preview.innerHTML = ''; // Clear previous preview
                preview.appendChild(img);
            }

            if (file) {
                reader.readAsDataURL(file); // Read file as data URL
            } else {
                preview.innerHTML = 'No file selected';
            }
        }
          </script>
          <style>
    /* Style for the file preview */
    .file-preview {
        margin-top: none;
        border: 1px solid #ccc;
        padding: 5px;
        width: 56px; /* Adjust width as needed */
        height: 56px; /* Adjust height as needed */
        overflow: hidden;
    }

    /* Style for the image within the file preview */
    .file-preview img {
        max-width: 100%;
        max-height: 100%;
        display: flex;
        margin: auto; /* Center the image */
    }
</style>
         <!-- login area start -->
         <section class="tp-login-area pb-140 p-relative z-index-1 fix">
            <div class="tp-login-shape">
               <img class="tp-login-shape-1" src="../assets/img/login/login-shape-1.png" alt="">
               <img class="tp-login-shape-2" src="../assets/img/login/login-shape-2.png" alt="">
               <img class="tp-login-shape-3" src="../assets/img/login/login-shape-3.png" alt="">
               <img class="tp-login-shape-4" src="../assets/img/login/login-shape-4.png" alt="">
            </div>
            <div class="container">
               <div class="row justify-content-center">
                   <div class="row">
                  <div class="col-xl-12 col-lg-8">
                     <div class="tp-login-wrapper">
                        <div class="tp-login-option">
                           <div class="tp-login-input-wrapper">
                                <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <div class="row" style="margin-left:1px;">
                                     <asp:FileUpload  ID="txtproimage"  onchange="previewFile()" style="padding:12px;width:93.30%;padding-left:25px; margin-right:10px;" runat="server" required="required"/>
                                      <div class="file-preview" id="file-preview"></div>
                                     </div>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="name">Upload Product Image :</label>
                                 </div>

                              </div>
                              <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <asp:TextBox ID="txtproname" runat="server" placeholder="Enter product name" required="required"></asp:TextBox>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="name">Product Name :</label>
                                 </div>
                              </div>
                              <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <asp:DropDownList ID="txtprocategory" style="height:55px;width:100%;" runat="server">
                                         <asp:ListItem></asp:ListItem>
                                     </asp:DropDownList>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="email">Select Category</label>
                                 </div>
                              </div>

                                <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <asp:TextBox ID="txtproprice" type="text" runat="server" placeholder="Enter product price" required="required"></asp:TextBox>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="tp_password">Product Price</label>
                                 </div>
                              </div>

                                <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <asp:TextBox ID="txtprodetail" type="text" runat="server" placeholder="Enter product detail" required="required"></asp:TextBox>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="tp_password">Product Detail</label>
                                 </div>
                              </div>

                                <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <asp:TextBox ID="txtprodescription" type="text" runat="server" placeholder="Enter product description" required="required"></asp:TextBox>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="tp_password">Product Description</label>
                                 </div>
                              </div>

                                <div class="tp-login-input-box">
                                 <div class="tp-login-input">
                                     <asp:TextBox ID="txtprostock" type="text" runat="server" placeholder="Enter product stock" required="required"></asp:TextBox>
                                 </div>
                                 <div class="tp-login-input-title">
                                    <label for="tp_password">Product Stock</label>
                                 </div>
                              </div
                           </div>          
                        </div>
                     </div>
                  </div>
                        <div class="tp-login-bottom p-3">
                               <asp:Button ID="btnadd"  class="tp-login-btn w-100" runat="server" Text="Add" OnClick="btnadd_Click"/>
                           </div>
               <div>
                   </div>
            </div>
         </section>
         <!-- login area end -->

      </main>


            <%@ Register Src="~/Admin/Include/footer.ascx" TagName="Footer" TagPrefix="uc" %>
     <uc:Footer runat="server" />

        </div>
    </form>
</body>
</html>
