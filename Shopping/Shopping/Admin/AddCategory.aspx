<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Shopping.Admin.AddCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%@ Register Src="~/Admin/Include/header.ascx" TagName="Header" TagPrefix="uc" %>
            <uc:Header runat="server" />

            <main>

                <!-- breadcrumb area start -->
                <section class="breadcrumb__area include-bg text-center pt-95 pb-50">
                    <div class="container">
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="breadcrumb__content p-relative z-index-1">
                                    <h3 class="breadcrumb__title">Add Category</h3>
                                    <div class="breadcrumb__list">
                                        <span><a href="#">Dashboard</a></span>
                                        <span>Add Category</span>
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
                                    <div class="col-xl-6 col-lg-8">
                                        <div class="tp-login-wrapper">
                                            <div class="tp-login-option">
                                                <div class="tp-login-input-wrapper">

                                                    <!-- breadcrumb area start -->
                                                    <section class="breadcrumb__area include-bg text-center  pb-50">
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-xxl-12">
                                                                    <div class="breadcrumb__content p-relative z-index-1">
                                                                        <h3 class="breadcrumb__title">Main Category</h3>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </section>
                                                    <!-- breadcrumb area end -->

                                                    <div class="tp-login-input-box">
                                                        <div class="tp-login-input">
                                                            <div class="row" style="margin-left: 1px;">
                                                                <asp:FileUpload ID="txtimage" onchange="previewFile()" Style="padding: 12px; width: 82%; padding-left: 25px; margin-right: 10px;" runat="server" required="required" />
                                                                <div class="file-preview" id="file-preview"></div>
                                                            </div>
                                                        </div>
                                                        <div class="tp-login-input-title">
                                                            <label for="name">Upload Profile Image :</label>
                                                        </div>
                                                    </div>
                                                    <div class="tp-login-input-box">
                                                        <div class="tp-login-input">
                                                            <asp:TextBox ID="txtcategory" runat="server" placeholder="Category Name"></asp:TextBox>
                                                        </div>
                                                        <div class="tp-login-input-title">
                                                            <label for="name">Category :</label>
                                                        </div>
                                                    </div>
                                                    <div class="tp-login-bottom">
                                                        <asp:Button ID="AddMain" class="tp-login-btn w-100" runat="server" Text="Add" OnClick="AddMain_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                      <div class="col-xl-6 col-lg-8">
                                    <div class="tp-login-wrapper">
                                        <div class="tp-login-option">
                                            
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" CellSpacing="10" ForeColor="#333333" GridLines="None" BorderColor="Black" BorderStyle="Double" HorizontalAlign="Center">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Category_Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category_Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Category_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Category_Image_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Category_Image") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    </asp:GridView>

                                             </div>
                                    </div>
                                </div>
                                            <%-- 
                                            <div class="tp-login-input-wrapper">
                                                 <!-- breadcrumb area start -->
                                                <section class="breadcrumb__area include-bg text-center  pb-50">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-xxl-12">
                                                                <div class="breadcrumb__content p-relative z-index-1">
                                                                    <h3 class="breadcrumb__title">Add SubCategory</h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                                <!-- breadcrumb area end -->
                                                 <div class="tp-login-input-box">
                                                    <div class="tp-login-input">
                                                        <asp:DropDownList ID="ddtxtcategory" runat="server" style="padding:19px;width:100%">
                                                            <asp:ListItem Value="-">--Select Category--</asp:ListItem>
                                                        </asp:DropDownList>  
                                                     </div>
                                                    <div class="tp-login-input-title">
                                                        <label for="name">Category :</label>
                                                    </div>
                                                </div>
                                               
                                                <div class="tp-login-input-box">
                                                    <div class="tp-login-input">
                                                        <asp:TextBox ID="txtsubcategory" runat="server" placeholder="Sub Category" ></asp:TextBox>
                                                    </div>
                                                    <div class="tp-login-input-title">
                                                        <label for="name">Sub Category :</label>
                                                    </div>
                                                </div>
                                                  <div class="tp-login-bottom">
                                    <asp:Button ID="AddSub" class="tp-login-btn w-100" runat="server" Text="Add" OnClick="AddSub_Click" />
                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                    <div>
                                    </div>
                            </div>
                </section>
                <!-- login area end -->


            </main>


            <%@ Register Src="~/Admin/Include/footer.ascx" TagName="Footer" TagPrefix="uc" %>
            <uc:Footer runat="server" />
        </div>
    </form>
</body>
</html>
