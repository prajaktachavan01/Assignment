﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Registeration.aspx.cs" Inherits="Inductotherm_Assignment.Student_Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="CSS/StyleSheet1.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <div>
            <h1><center>Registration Form</center></h1>
        </div>
        <div></div>
        <div></div>
        <div><center>
        <div>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>First Name :   </label>
            <asp:TextBox ID="Txt_FirstName" runat="server" placeholder="First Name" CssClass="customTextbox" ></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <label >Last Name : </label>
            <asp:TextBox ID="Txt_LastName" runat="server" placeholder="Last Name"></asp:TextBox>
        </div>
        <div></div>
            <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>Gender :   </label>
                <asp:RadioButton ID="RD_Male" runat="server" Text="MALE" CssClass="customTextbox" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RD_Female" runat="server" Text="FEMALE" CssClass="customTextbox" />
            &nbsp;&nbsp;&nbsp;
            <label>Nationality : </label>
                <asp:DropDownList ID="DDL_Nationality" runat="server" CssClass="customTextbox">
                                                    <asp:ListItem Value="Indian"></asp:ListItem>
                                                    <asp:ListItem Value="Chinese"></asp:ListItem>
                                                    <asp:ListItem Value="French"></asp:ListItem>
                                                    <asp:ListItem Value="American"></asp:ListItem>
                                                    <asp:ListItem Value="Korean"></asp:ListItem>
                                                </asp:DropDownList>
            <%--<asp:TextBox ID="Txt_nationality" runat="server" placeholder="Nationality" CssClass="customTextbox"></asp:TextBox>--%>
        </div>
        <div></div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>Date of Birth :   </label>
            <asp:TextBox ID="Txt_DOB" runat="server" TextMode="Date" CssClass="customTextbox" ></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <label>Course : </label>
            <asp:TextBox ID="Txt_Course" runat="server" placeholder="Course"></asp:TextBox>
        </div>
        <div></div>
        </center></div>
        <div>
            <center>
                <asp:Button CssClass="custombutton" ID="btn_Insert" runat="server" Text="Insert" OnClick="btn_Insert_Click" /></center>
        </div>



        <div><h1><center>Student List</center></h1></div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div><center>
                                <asp:GridView ID="GridView1" runat="server" DataKeyNames="Student_ID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" >
                                    <Columns>
                      
                                        <asp:TemplateField HeaderText="First Name"> 
                                           <ItemTemplate>
                                                <%#Eval("First_Name") %>
                                            </ItemTemplate>
                                            
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtFirstName" runat="server" Text='<%#Bind("First_Name") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Last Name">
                                           <ItemTemplate>
                                                <%#Eval("Last_Name") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtLastName" runat="server" Text='<%#Bind("Last_Name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Gender">
                                           <ItemTemplate>
                                                <%#Eval("Gender") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtGender" runat="server" Text='<%#Bind("Gender") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Nationality">
                                           <ItemTemplate>
                                                <%#Eval("Nationality") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DDL_Nationality" runat="server">
                                                    <asp:ListItem Value="Indian"></asp:ListItem>
                                                    <asp:ListItem Value="Chinese"></asp:ListItem>
                                                    <asp:ListItem Value="French"></asp:ListItem>
                                                    <asp:ListItem Value="American"></asp:ListItem>
                                                    <asp:ListItem Value="Korean"></asp:ListItem>
                                                </asp:DropDownList>
                                                <%--<asp:TextBox ID="txtNationality" runat="server" Text='<%#Bind("Nationality") %>'></asp:TextBox>--%>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Date of Birth">
                                          <ItemTemplate>
                                                <%#Eval("Date_Of_Birth") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Text='<%#Bind("Date_Of_Birth") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%#Eval("Course") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCourse" runat="server" TextMode="Date" Text='<%#Bind("Course") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </center></div>
                                </div>
        </form>
               </body> 
    </html>