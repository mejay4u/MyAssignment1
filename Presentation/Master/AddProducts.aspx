<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="Presentation_Master_AddProducts" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../assets/js/validator/validator.js"></script>
    <link href="../../assets/fonts/css/font-awesome.css" rel="stylesheet" />
    <link href="../../assets/css/icheck/flat/green.css" rel="stylesheet" />
    <script src="../../assets/js/select/select2.full.js"></script>
    <link href="../../assets/css/select/select2.min.css" rel="stylesheet" />
    <link href="../../assets/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/datatables/css/select.dataTables.css" rel="stylesheet" />
    <script src="../../assets/js/jquery.multifile.js"></script>

    <script>
        $(document).ready(function () {
            $(".select2_single").select2({
                placeholder: "Select a Item Group",
                allowClear: true
            });

            $(".select2_group").select2({});
            $(".select2_multiple").select2({
                maximumSelectionLength: 4,
                placeholder: "With Max Selection limit 4",
                allowClear: true
            });
        });
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>
    <script src="../../assets/js/input_mask/jquery.inputmask.js"></script>
    <script src="../../assets/js/select/select2.full.js"></script>
    <script src="../../assets/js/nicescroll/jquery.nicescroll.min.js"></script>
    <link href="../../assets/css/select/select2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server" class="form-horizontal form-label-left">
        <div class="row">
            <div class="x_panel">
                <div class="x_title col-sm-12">
                    <h2>Add Product</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"></a>
                        </li>
                        <li><a class="collapse-link"></a>
                        </li>
                        <li><a class="collapse-link"></a>
                        </li>
                        <li><a class="collapse-link"></a>
                        </li>
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <section style="background-color: white;">
                        <div class="form-group">
                            <div style="text-align: right">
                                <button id="btnNew" type="button" class="btn btn-default" runat="server" onclick="NewItem(); return false;">New</button>
                                <%--   <button id="btnSelectUp" type="button" class="btn btn-default" onclick="UpdateItem(); return false;">Update</button>
                                <button id="btnDelete" type="button" class="btn btn-default" onclick="RemoveItem(); return false;">Delete</button>--%>
                            </div>
                            <div class="table-responsive">
                                <table id="ProductList" height="100%" width="100%" class="table table-striped table-bordered table-responsive">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Product Name</th>
                                            <th>Product Code</th>
                                            <th>Product Description</th>
                                            <th>Price</th>
                                            <th>Qty</th>
                                            <th>Contact Name</th>
                                            <th>Conatct Phone</th>
                                            <th>Contact Email</th>
                                            <th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="6" class="dataTables_empty">Loading data from server</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div id="myModalNew" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" onclick="reset();return false;" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add New Product</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">

                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Product Code<span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <asp:TextBox runat="server" onkeypress="return restrictInput(this,event,alphaAndNum);" type="text" ID="txtProductCode" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Product Name<span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtProductName" onkeypress="return restrictInput(this,event,alphaAndNum);" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Description <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" TextMode="MultiLine" ID="txtProductDescription" onkeypress="return restrictInput(this,event,alphaAndNum);" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Price <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtPrice" onkeypress="return restrictInput(this,event,integerOnly);" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Qty <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtProductQty" onkeypress="return restrictInput(this,event,integerOnly);" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Contact Name <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtContactName" onkeypress="return restrictInput(this,event,alphaAndNum);" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Contact Phone <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtContactTelephone" onkeypress="return restrictInput(this,event,digitsOnly);" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Contact Email <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtConatctEmail" required="required" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Upload Images <span class="red">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:FileUpload ID="FileUpload1" name="files[]" AllowMultiple="true" maxlength="3" multiple runat="server" />

                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <div class="col-md-12">
                                <div class="col-lg-8">
                                </div>
                                <div class="col-lg-2">
                                    <asp:Button runat="server" TabIndex="11" ID="btnSave" Text="Save" OnClick="btnSave_Click" class="btn btn-success"></asp:Button>
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" tabindex="12" onclick="reset();return false;" class="btn btn-primary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- View Modal -->

            <div id="myModalView" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" onclick="reset();return false;" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">View Product</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">

                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Product Code:
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <asp:TextBox runat="server" onkeypress="return restrictInput(this,event,alphaAndNum);" type="text" ID="txtViewProductCode" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Product Name:
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtViewProductName" onkeypress="return restrictInput(this,event,alphaAndNum);" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Description :
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" TextMode="MultiLine" ID="txtViewDescription" onkeypress="return restrictInput(this,event,alphaAndNum);" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Price :
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtViewPrice" onkeypress="return restrictInput(this,event,integerOnly);" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Qty :
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtViewQty" onkeypress="return restrictInput(this,event,integerOnly);" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Contact Name :
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtVIewContactName" onkeypress="return restrictInput(this,event,alphaAndNum);" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Contact Phone :
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtViewContactPhone" onkeypress="return restrictInput(this,event,digitsOnly);" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Contact Email :
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox runat="server" TabIndex="1" type="text" ID="txtViewEmail" class="form-control col-md-7 col-xs-12" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Images :
                                </label>
                                <div id="ImagesDiv" class="row">
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <div class="col-md-12">
                                <div class="col-lg-8">
                                </div>

                                <div class="col-lg-2">
                                    <button type="button" tabindex="12" onclick="reset();return false;" class="btn btn-primary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

         <div id="myModalremoveItems" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Delete </h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Are you sure want to delete this Product?"></asp:Label>
                                <asp:Label ID="lblItem" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-md-12">
                                <div class="col-lg-8">
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" id="btnRemove" class="btn btn-danger">Delete</button>
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" autopostback="false">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
  
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContentPlaceHolder" runat="Server">
    <!-- Datatables-->

    <script src="../../assets/js/datatables/jquery.dataTables.min.js"></script>
    <script src="../../assets/js/datatables/dataTables.bootstrap.js" async></script>
    <script src="../../assets/js/datatables/dataTables.buttons.min.js" async></script>
    <script src="../../assets/js/datatables/buttons.bootstrap.min.js" async></script>
    <script src="../../assets/js/datatables/jszip.min.js" async></script>
    <script src="../../assets/js/datatables/pdfmake.min.js" async></script>
    <script src="../../assets/js/datatables/vfs_fonts.js" async></script>
    <script src="../../assets/js/datatables/buttons.html5.min.js" async></script>
    <script src="../../assets/js/datatables/buttons.print.min.js" async></script>
    <script src="../../assets/js/datatables/dataTables.fixedHeader.min.js" async></script>
    <script src="../../assets/js/datatables/dataTables.keyTable.min.js" async></script>
    <script src="../../assets/js/datatables/dataTables.responsive.min.js" async></script>
    <script src="../../assets/js/datatables/responsive.bootstrap.min.js" async></script>
    <script src="../../assets/js/datatables/dataTables.scroller.min.js" async></script>
    <script src="../../assets/js/datatables/dataTables.select.js"></script>
    <script src="../../assets/js/notify/pnotify.core.js"></script>
    <script src="../../assets/js/notify/pnotify.nonblock.js"></script>
    <script src="../../assets/js/notify/pnotify.buttons.js"></script>
    <!-- pace -->
    <script src="../../assets/js/pace/pace.min.js"></script>
    <script type="text/javascript">
      
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
        var arr = new Array();
        arr.push('norecord');
        var d;
        $(document).ready(function () {
            $(".sorting, .sorting_asc, .sorting_desc").unbind('click');
            $('#ProductList').DataTable({
                "bFilter": false,
                "lengthChange": false,
                processing: true,
                serverSide: true,
                "bJQueryUI": false,
                "bInfo": false,
                "sDom": 'lfrtip',
                "bPaginate": false,
                ajax: {

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../../Presentation/Master/AddProducts.aspx/Data",
                    data: function (d) {
                        return JSON.stringify({ parameters: d });
                    }
                }

            });

            var table = $('#ProductList').DataTable();
           
          
            // table.column(9).visible(false);
            $('#ProductList tbody').on('click', 'tr', function () {

                d = table.row(this).data();
                arr = new Array();
                arr = d;
               

                var ValuePresent = jQuery.inArray(d[1], arr);

                if ($(this).hasClass('active')) {
                    $(this).removeClass('active');
                }
                else {
                    table.$('tr.active').removeClass('active');
                    $(this).addClass('active');
                }
            });

        });

        function NewItem() {

            $('#myModalNew').modal('show');
          
          
        }
        function ViewModal() {

            $('#myModalView').modal('show');
            setTimeout(function () {
                GetProductData();
              
            }, 500);
          
        }
        function DeleteItem() {

            $('#myModalremoveItems').modal('show');
           
          
        }



        function RemoveItem() {
            if (arr[0] == 'norecord') {
                new PNotify({
                    title: 'No Record Selected',
                    text: 'Please select a row',
                    type: 'error'
                });
            }
            else{
                $('#myModalremoveItems').modal('show');
            }}
        function UpdateItem() {
            if (arr[0] == 'norecord') {
                new PNotify({
                    title: 'No Record Selected',
                    text: 'Please select a row',
                    type: 'error'
                });
            }
            else{
                $('#myModalUpdate').modal('show');
              
            }}

        function ValidateRegForm() {
            var email = document.getElementById("<%=txtConatctEmail.ClientID%>");
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(email.value)) {

                notify('Alert','Please enter valid email address','error');
                email.focus;

                return false;
            }
            return true;
         
        }

        $('#ContentPlaceHolder1_btnSave').click(function () {
        


            if (document.getElementById('<%=txtProductCode.ClientID %>').value == "")
            {
                <%=txtProductCode.ClientID %>.focus();
                notify('Alert','Please enter product code','error');

                return false;
            }
            if (document.getElementById('<%=txtProductName.ClientID %>').value == "")
            {
                <%=txtProductName.ClientID %>.focus();
                notify('Alert','Please enter product name','error');
                return false;
            }
            if (document.getElementById('<%=txtProductDescription.ClientID %>').value == "")
            {
                <%=txtProductDescription.ClientID %>.focus();
                notify('Alert','Please enter product description','error');
                return false;
            }
            if (document.getElementById('<%=txtPrice.ClientID %>').value == "")
            {
                <%=txtPrice.ClientID %>.focus();
                notify('Alert','Please enter product price','error');
                return false;
            }
            if (document.getElementById('<%=txtProductQty.ClientID %>').value == "")
            {
                <%=txtProductQty.ClientID %>.focus();
                notify('Alert','Please enter product qty','error');
                return false;
            }
            if (document.getElementById('<%=txtProductQty.ClientID %>').value == "0")
            {
                <%=txtProductQty.ClientID %>.focus();
                notify('Alert','Please enter valid product qty','error');
                return false;
            }
           
            if (document.getElementById('<%=txtContactName.ClientID %>').value == "")
            {
                <%=txtContactName.ClientID %>.focus();
                notify('Alert','Please enter contact name','error');
                return false;
            }
            if (document.getElementById('<%=txtContactTelephone.ClientID %>').value == "")
            {
                <%=txtContactTelephone.ClientID %>.focus();
                notify('Alert','Please enter contact telephone no','error');
                return false;
            }
            if (document.getElementById('<%=txtConatctEmail.ClientID %>').value == "")
            {
                <%=txtConatctEmail.ClientID %>.focus();
                notify('Alert','Please enter contact email','error');
                return false;
            }
            return ValidateRegForm();
           
         
        });
       
       
      
        jQuery(function($)
        {
            $('#ContentPlaceHolder1_FileUpload1').multifile();
        });
       
        function GetProductData()
        {
            var ProductId =  arr[0];

            $.ajax({

                url: "../../Presentation/Master/AddProducts.aspx/GetSelectedProductData",
                type: "POST",
                contentType: "application/json",
                datatype: "json",
                data: JSON.stringify({ par: ProductId }),
                success: function (data) {
                   
                    $("#ContentPlaceHolder1_txtViewProductCode").val(data.d[0]);
                    $("#ContentPlaceHolder1_txtViewProductName").val(data.d[1]);
                    $("#ContentPlaceHolder1_txtViewDescription").val(data.d[2]);
                    $("#ContentPlaceHolder1_txtViewPrice").val(data.d[3]);
                    $("#ContentPlaceHolder1_txtViewQty").val(data.d[4]);
                    $("#ContentPlaceHolder1_txtVIewContactName").val(data.d[5]);
                    $("#ContentPlaceHolder1_txtViewContactPhone").val(data.d[6]);
                    $("#ContentPlaceHolder1_txtViewEmail").val(data.d[7]);
                    GetImageURL();
                   

                   
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function GetImageURL()
        {
            $("#ImagesDiv").html("");
            $.ajax({

                url: "../../Presentation/Master/AddProducts.aspx/GetImageURL",
                type: "POST",
                contentType: "application/json",
                datatype: "json",
                success: function (data) {
                   

                    $.each(data.d, function(i, item) {
                        
                        $("#ImagesDiv").append('<div class="col-lg-2" > <img src=../../ProductImages/'+ data.d[i]+' class="img-rounded" width="100" height="100" /> </div>'); 
                         
                    });
                    
               
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        $('#btnRemove').click(function () {
            $.ajax({

                url: "../../Presentation/Master/AddProducts.aspx/RemoveProduct",
                type: "POST",
                contentType: "application/json",
                datatype: "json",
                data: JSON.stringify({ par: d[0] }),
                success: function (data) {
                    $("#ProductList").dataTable().fnDraw();
                    $('#myModalremoveItems').modal('hide');
                    arr[0] = 'norecord';
                    notify('Success','Product deleted successfully','success');
                },
                failure: function (response) {
                    alert(response.d);
                }
            });

        });

    </script>

    <script type="text/javascript">
        // Restrict user input in a text field
        // create as many regular expressions here as you need:
        var digitsOnly = /[1234567890]/g;
        var integerOnly = /[0-9\.]/g;
        var alphaOnly = /[A-Za-z ]/g;
        var alphaAndNum = /[A-Za-z0-9 ]/g;
        var usernameOnly = /[0-9A-Za-z\._-]/g;
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        function restrictInput(myfield, e, restrictionType, checkdot) {
            if (!e) var e = window.event
            if (e.keyCode) code = e.keyCode;
            else if (e.which) code = e.which;
            var character = String.fromCharCode(code);
            // if user pressed esc... remove focus from field...
            if (code == 27) { this.blur(); return false; }
            // ignore if the user presses other keys
            // strange because code: 39 is the down key AND ' key...
            // and DEL also equals .
            if (!e.ctrlKey && code != 9 && code != 8 && code != 36 && code != 37 && code != 38 && (code != 39 || (code == 39 && character == "'")) && code != 40) {
                if (character.match(restrictionType)) {
                    if (checkdot == "checkdot") {
                        return !isNaN(myfield.value.toString() + character);
                    } else {
                        return true;
                    }
                } else {
                    return false;
                }
            }
        }
    </script>

</asp:Content>
