﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelfEvaluation.aspx.cs" Inherits="ArmourCyberSecurity.SelfEvaluation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #wrapper {
            /*                    background: linear-gradient(#626d8d, #efefef,#c3c5cb);*/
            background: url(./assets/images/bground.jpg);
            /*                background:linear-gradient(120deg,#3498db,#224ee3,#3498db);*/
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: auto;
        }

        .menu-logo {
            width: 100%;
            height: 3.3rem;
            background: #333333;
            position: sticky;
            top: 0;
        }

        .navbar-logo {
            float: left;
            padding-left: 3rem;
            margin-bottom: 1rem;
        }

        #sec1Div {
            margin-top: 4px;
            width: 96%;
            padding-left: 2rem;
            height: 100vh;
        }

        h2 {
            text-align: center;
            background: #3498db !important;
            color: white;
            border-radius: 30px;
            padding: 1rem;
        }

        #ddlAns1,
        #ddlAns2,
        #ddlAns3,
        #ddlAns4,
        #ddlAns5,
        #ddlAns8,
        #ddlAns9,
        #ddlAns10,
        #ddlAns11,
        #ddlAns12,
        #ddlAns13,
        #ddlAns14,
        #ddlAns15,
        #ddlAns16,
        #ddlAns17,
        #ddlAns18,
        #ddlAns19,
        #ddlAns20,
        #ddlAns21,
        #ddlAns22,
        #ddlAns23,
        #ddlAns24,
        #ddlAns25,
        #ddlAns26,
        #ddlAns27,
        #ddlAns28,
        #ddlAns29 {
            display: block;
            margin-left: 3rem;
            width: 50%;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: rgba(255, 255, 255, 1);
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        #btn_section1,
        #btn_section2,
        #btn_section3 {
            padding: 1rem 3rem;
            border-radius: 50px !important;
            background: transparent;
            color: white;
            border-color: #149dcc !important;
            font-weight: 700;
            font-size: large;
            align-self: center;
            width: 100%;
            margin-bottom: 2rem;
        }

        #btn_Submit {
            padding: 1rem 3rem;
            border-radius: 50px !important;
            color: white;
            font-weight: 700;
            font-size: large;
            align-self: center;
            width: 100%;
            margin-bottom: 2rem;
        }

        #lblQues1,
        #lblQues2,
        #lblQues3,
        #lblQues4,
        #lblQues5,
        #lblQues8,
        #lblQues9,
        #lblQues10,
        #lblQues11,
        #lblQues12,
        #lblQues13,
        #lblQues14,
        #lblQues15,
        #lblQues16,
        #lblQues17,
        #lblQues18,
        #lblQues19,
        #lblQues20,
        #lblQues21,
        #lblQues22,
        #lblQues23,
        #lblQues24,
        #lblQues25,
        #lblQues26,
        #lblQues27,
        #lblQues28,
        #lblQues29 {
            color: floralwhite;
            font-size: large;
            font-weight: 600;
        }

        #lblQues24,
        #lblQues25,
        #lblQues26,
        #lblQues27,
        #lblQues28,
        #lblQues29 {
        }

        table {
            margin-left: 7rem;
        }

        label {
            color: floralwhite;
            font-size: large;
            font-weight: 500;
        }

        #btn_section1:hover,
        #btn_section2:hover,
        #btn_section3:hover {
            box-shadow: inset -4px -4px 10px rgba(225, 225, 225, 0.5), inset 4px 4px 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            background-position: right;
            background: linear-gradient(120deg, #3498db, #3a4953) !important;
            transition: .5s;
        }


        .cid-rSxbAyIsnT {
            padding-top: 30px;
            padding-bottom: 30px;
            background-color: #2e2e2e;
        }

            .cid-rSxbAyIsnT .row-links {
                width: 100%;
                -webkit-justify-content: center;
                justify-content: center;
            }

            .cid-rSxbAyIsnT .social-row {
                width: 100%;
                -webkit-justify-content: center;
                justify-content: center;
            }

            .cid-rSxbAyIsnT .media-container-row {
                -webkit-flex-direction: column;
                flex-direction: column;
                -webkit-justify-content: center;
                justify-content: center;
                -webkit-align-items: center;
                align-items: center;
            }

                .cid-rSxbAyIsnT .media-container-row .foot-menu {
                    list-style: none;
                    display: flex;
                    -webkit-justify-content: center;
                    justify-content: center;
                    -webkit-flex-wrap: wrap;
                    flex-wrap: wrap;
                    padding: 0;
                    margin-bottom: 0;
                }

                    .cid-rSxbAyIsnT .media-container-row .foot-menu li {
                        padding: 0 1rem 1rem 1rem;
                    }

                        .cid-rSxbAyIsnT .media-container-row .foot-menu li p {
                            margin: 0;
                        }

                .cid-rSxbAyIsnT .media-container-row .social-list {
                    padding-left: 0;
                    margin-bottom: 0;
                    list-style: none;
                    display: flex;
                    -webkit-flex-wrap: wrap;
                    flex-wrap: wrap;
                    -webkit-justify-content: flex-end;
                    justify-content: flex-end;
                }

                    .cid-rSxbAyIsnT .media-container-row .social-list .mbr-iconfont-social {
                        font-size: 1.5rem;
                        color: #ffffff;
                    }

                    .cid-rSxbAyIsnT .media-container-row .social-list .soc-item {
                        margin: 0 .5rem;
                    }

                    .cid-rSxbAyIsnT .media-container-row .social-list a {
                        margin: 0;
                        opacity: .5;
                        -webkit-transition: .2s linear;
                        transition: .2s linear;
                    }

                        .cid-rSxbAyIsnT .media-container-row .social-list a:hover {
                            opacity: 1;
                        }

        @media (max-width: 767px) {
            .cid-rSxbAyIsnT .media-container-row .social-list {
                -webkit-justify-content: center;
                justify-content: center;
            }
        }

        .cid-rSxbAyIsnT .media-container-row .row-copirayt {
            word-break: break-word;
            width: 100%;
        }

            .cid-rSxbAyIsnT .media-container-row .row-copirayt p {
                width: 100%;
            }
        
        #PrivacyCulture{
            height:18rem;
            
        }
        @media (max-width: 1414px) {
            #PrivacyCulture{
            height:22rem;
            
        }}
     
        @media (max-width: 1501px) {
        #ddlAns3{ 
            margin-top: 20px;
            }
        }
        
        @media (max-width: 1411px) {
             #ddlAns2{ 
            margin-top: 5px;
            }
             #ddlAns3{ 
            margin-top: 25px;
            }
             #ddlAns4{ 
            margin-top: 20px;
            }
             #ddlAns5{ 
            margin-top: 10px;
            }
            }
        
        
        @media (max-width: 1405px) {
             #ddlAns2{ 
            margin-top: 15px;
            }
             #ddlAns3{ 
            margin-top: 30px;
            }
             #ddlAns4{ 
            margin-top: 30px;
            }
             #ddlAns5{ 
            margin-top: 15px;
            }
            }
        
        #lblQues6,
         #lblQues7{
            padding-left: 8%;
           color: floralwhite;
            font-size: large;
            font-weight: 600;
            width: 80%;
            margin: 1em auto;
        }
        
        
        @media(max-width:703px){
           #lblQues6,
         #lblQues7{
             font-weight: 0;
        }
        }
        
        
            @media(max-width:703px){
                 #lblQues6,
                #lblQues7{
                    font-size: small;
                    
                }
                
            }
            
        
        #ddlAns11{
           margin-top: -20px;
        }
        #Ques8{
                padding-bottom: 1rem;
            }
        @media (max-width: 1408px) {
            #Ques8{
                padding-bottom: 0px;
            }
        }
        
        #Ques9{
                padding-bottom: 1rem;
            }
        @media (max-width: 1408px) {
            #Ques9{
                padding-bottom: 0px;
            }
        }
        
        #PrivacyEngg{
            height:18rem;
            
        }
        @media (max-width: 1275px) {
            #PrivacyEngg{
            height:22rem;
            
        }}
        
        @media (max-width: 1128px) {
            #PrivacyEngg{
            height:25rem;
            
        }}
        
        
        
        @media (max-width: 1411px) {
             #ddlAns18{ 
            margin-top: 5px;
            }
             #ddlAns21{ 
            margin-top: 5px;
            }
            }
         
        @media (max-width: 1101px) {
             #ddlAns20{ 
            margin-top: 25px;
            }
            #ddlAns21{ 
            margin-top: 20px;
            }
            
        
        
        
        @media (max-width: 1372px) {
             #ddlAns27{ 
            margin-top: 5px;
            }
             #ddlAns28{ 
            margin-top: 10px;
            }
             #ddlAns29{ 
            margin-top: 10px;
            }
            }
         
        @media (max-width: 1101px) {
             #ddlAns27{ 
            margin-top: 25px;
            }
            #ddlAns28{ 
            margin-top: 20px;
            }
        
            }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#sec2Div").hide();
            $("#sec3Div").hide();
            $("#sec4Div").hide();

        });

        $(document).on('click', '[id*=btn_section1]', function () {
            var v1 = document.getElementById("<%=reqAns1.ClientID%>");
            var v2 = document.getElementById("<%=reqAns2.ClientID%>");
            var v3 = document.getElementById("<%=reqAns3.ClientID%>");
            var v4 = document.getElementById("<%=reqAns4.ClientID%>");
            var v5 = document.getElementById("<%=reqAns5.ClientID%>");
            var v6 = document.getElementById("<%=cvDemoList.ClientID%>");
            var v7 = document.getElementById("<%=cvDemoList2.ClientID%>");
            ValidatorValidate(v1);
            ValidatorValidate(v2);
            ValidatorValidate(v3);
            ValidatorValidate(v4);
            ValidatorValidate(v5);
            ValidatorValidate(v6);
            ValidatorValidate(v7);
            if (v1.isvalid && v2.isvalid && v3.isvalid && v4.isvalid && v5.isvalid && v6.isvalid && v7.isvalid) {
                $("#sec1Div").slideUp(1000);
                $("#sec2Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });

        $(document).on('click', '[id*=btn_section2]', function () {
            $("#sec2Div").slideUp(1000);
            $("#sec3Div").slideDown(1000);
        });

        $(document).on('click', '[id*=btn_section3]', function () {
            var v16 = document.getElementById("<%=reqAns16.ClientID%>");
            var v17 = document.getElementById("<%=reqAns17.ClientID%>");
            var v18 = document.getElementById("<%=reqAns18.ClientID%>");
            var v19 = document.getElementById("<%=reqAns19.ClientID%>");
            var v20 = document.getElementById("<%=reqAns20.ClientID%>");
            var v21 = document.getElementById("<%=reqAns21.ClientID%>");
            var v22 = document.getElementById("<%=reqAns22.ClientID%>");
            ValidatorValidate(v16);
            ValidatorValidate(v17);
            ValidatorValidate(v18);
            ValidatorValidate(v19);
            ValidatorValidate(v20);
            ValidatorValidate(v21);
            ValidatorValidate(v22);
            if (v16.isvalid && v17.isvalid && v18.isvalid && v19.isvalid && v20.isvalid && v21.isvalid && v22.isvalid) {
                $("#sec3Div").slideUp(1000);
                $("#sec4Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });


        function ValidateDemoList(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns6.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        function ValidateDemoList2(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns7.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }
    </script>
</head>
<body style="background-image: url(./assets/images/bground.jpg)">
    <form id="form1" runat="server">
        <div id="wrapper" class="container-fluid">
            <div class="menu-logo">
                <div class="navbar-brand" style="text-align: center;">
                    <span class="navbar-logo">
                        <a href="#">
                            <img src="assets/images/Logo.png" alt="Armour Logo" style="height: 2.8rem;" />
                        </a>
                    </span>
                    <span class="navbar-caption-wrap" style="padding-top: 2rem;">
                        <a class="navbar-caption text-white display-4" href="#" style="color: white; text-decoration: none;">
                            <h1>Privacy Regulation Assessment</h1>
                        </a>
                    </span>
                </div>
            </div>


            <div id='sec1Div'>
                <h2>Privacy Culture</h2>
                <div id="PrivacyCulture">

                    <div id="float_left" style="float: left; width: 37%; margin-left: 4rem; padding-left: 2rem;">
                        <asp:Label ID="lblQues1" runat="server" Text="" /><br />
                        <br />
                        <br />
                        <asp:Label ID="lblQues2" runat="server" Text="" /><br />
                        <br />
                        <br />
                        <asp:Label ID="lblQues3" runat="server" Text="" /><br />
                        <br />
                        <br />
                        <asp:Label ID="lblQues4" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues5" runat="server" Text="" /><br />
                        <br />
                    </div>

                    <div id="float_right" style="float: right; width: 40%; margin-right: 3rem">
                        <asp:DropDownList runat="server" ID="ddlAns1">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns2">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns3">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns4">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns5">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />
                    </div>
                </div>


                <div id="RegionalSpecific">
                    <h2>Regional Specific</h2>
                    <asp:Label ID="lblQues6" runat="server" Text=""/>
                    <asp:CheckBoxList ID="chkbxAns6" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns6_SelectedIndexChanged1" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ID="cvDemoList" ClientValidationFunction="ValidateDemoList" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                    <br />

                    <asp:Label ID="lblQues7" runat="server" Text=""/>
                    <asp:CheckBoxList ID="chkbxAns7" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns7_SelectedIndexChanged" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ID="cvDemoList2" ClientValidationFunction="ValidateDemoList2" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                    <br />
                </div>

                <asp:Button ID="btn_section1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false; Validate();" Style="padding: 1rem 3rem; border-radius: 50px!important; background: transparent; color: white; border-color: #149dcc !important; font-weight: 600; align-self: center; width: 100%" />
            </div>



            <div id='sec2Div'>

                <div id="RegionalSpecificReflexive" style="height: 20rem;">
                    <h2>Regional Specific </h2>
                    <div id="Ques8Div" runat="server">
                        <div id="Ques8" style="float: left; width: 35%; padding-left: 4rem;">
                            <asp:Label ID="lblQues8" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem; margin-top: -10px;">
                            <asp:DropDownList runat="server" ID="ddlAns8" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            <br />
                        </div>
                        <br />
                    </div>

                    <div id="Ques9Div" runat="server">
                        <div id="Ques9" style="margin-top: 36px; width: 35%; padding-left: 4rem;">
                            <asp:Label ID="lblQues9" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem; margin-top: -50px;">
                            <asp:DropDownList runat="server" ID="ddlAns9" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            <br />
                        </div>
                        <br />
                    </div>

                    <div id="Ques10Div" runat="server">
                        <div id="Ques10" style="float: left; width: 35%; padding-left: 4rem;">
                            <asp:Label ID="lblQues10" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem; margin-top: -7px;">
                            <asp:DropDownList runat="server" ID="ddlAns10" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        </div>
                        <br />
                    </div>

                    <div id="Ques11Div" runat="server">
                        <div style="float: left; width: 35%; padding-left: 4rem; padding-top: 1rem;">
                            <asp:Label ID="lblQues11" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; margin-top: 18px; width: 40%; margin-right: 3rem; padding-top: 0.7rem;">
                            <asp:DropDownList runat="server" ID="ddlAns11" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        </div>
                        <br />
                    </div>

                </div>



                <div id="RegionalFines" style="height: 15rem">
                    <h2>Regional Fines</h2>
                    <div id="Ques12Div" runat="server">
                        <div style="float: left; width: 40%; padding-left: 4rem;">
                            <asp:Label ID="lblQues12" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem; margin-top: -10px;">
                            <asp:DropDownList runat="server" ID="ddlAns12" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        </div>
                        <br />
                    </div>

                    <div id="Ques13Div" runat="server">
                        <div style="width: 40%; padding-left: 4rem; margin-top:3rem;">
                            <asp:Label ID="lblQues13" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem;margin-top: -40px;">
                            <asp:DropDownList runat="server" ID="ddlAns13" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        </div>
                        <br />
                    </div>

                    <div id="Ques14Div" runat="server">
                        <div style="float: left; width: 40%; padding-left: 4rem;">
                            <asp:Label ID="lblQues14" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem;">
                            <asp:DropDownList runat="server" ID="ddlAns14" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        </div>
                        <br />
                    </div>

                    <div id="Ques15Div" runat="server">
                        <div style="width: 40%; padding-left: 4rem;margin-top:3rem;">
                            <asp:Label ID="lblQues15" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem; margin-top: -25px;">
                            <asp:DropDownList runat="server" ID="ddlAns15" Visible="false">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        </div>
                        <br />
                    </div>
                </div>

                <asp:Button ID="btn_section2" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
            </div>



            <div id='sec3Div'>
                <h2>Privacy Engineering</h2>
                <div id="PrivacyEngg">
                    <div style="float: left; width: 35%; margin-left: 4rem; padding-left: 2rem;">
                        <asp:Label ID="lblQues16" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues17" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues18" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues19" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues20" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues21" runat="server" Text="" /><br />
                        <br />
                    </div>

                    <div style="float: right; width: 40%; margin-right: 3rem">
                        <asp:DropDownList runat="server" ID="ddlAns16">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns17">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns17" ControlToValidate="ddlAns17" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns18">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns19">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns20">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns21">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />
                    </div>
                </div>


                <div id="DataControl" style="height: 18rem;">
                    <h2>Data Control</h2>
                    <div style="float: left; width: 35%; margin-left: 4rem; padding-left: 2rem;">
                        <asp:Label ID="lblQues22" runat="server" Text="" />
                    </div>
                    <div style="float: right; width: 40%; margin-right: 3rem">
                        <asp:DropDownList runat="server" ID="ddlAns22">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    </div>
                              <br/>
                    <div runat="server" id="Ques23Div">
                        <div style="width: 35%; margin-left: 4rem; padding-left: 2rem;margin-top: 3rem;">
                            <asp:Label ID="lblQues23" runat="server" Text="" Visible="false" />
                        </div>
                        <div style="float: right; width: 40%; margin-right: 3rem">
                            <asp:DropDownList runat="server" ID="ddlAns23" Visible="false" style="margin-top: -25px;">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            <br />
                        </div>
                    </div>
                </div>

                <asp:Button ID="btn_section3" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
            </div>



            <div id='sec4Div'>

                <div id="Consent" style="height: 15rem;">
                    <h2>Consent</h2>
                    <div style="float: left; width: 35%; margin-left: 4rem; padding-left: 2rem;">
                        <asp:Label ID="lblQues24" runat="server" Text="" /><br />
                        <asp:Label ID="lblQues25" runat="server" Text="" /><br />
                    </div>
                    <div style="float: right; width: 40%; margin-right: 3rem">
                        <asp:DropDownList runat="server" ID="ddlAns24">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns25">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns25" ControlToValidate="ddlAns25" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />
                    </div>
                </div>


                <div id="IncidentResp">
                    <h2>Incident Response</h2>
                    <div style="float: left; width: 35%; margin-left: 4rem; padding-left: 2rem;">
                        <asp:Label ID="lblQues26" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues27" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues28" runat="server" Text="" /><br />
                        <br />
                        <asp:Label ID="lblQues29" runat="server" Text="" /><br />
                        <br />
                    </div>

                    <div style="float: right; width: 40%; margin-right: 3rem">
                        <asp:DropDownList runat="server" ID="ddlAns26">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns26" ControlToValidate="ddlAns26" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns27">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns27" ControlToValidate="ddlAns27" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns28">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns28" ControlToValidate="ddlAns28" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />


                        <asp:DropDownList runat="server" ID="ddlAns29">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqAns29" ControlToValidate="ddlAns29" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                        <br />
                    </div>






                    </div>


                    <asp:Button ID="btn_Submit" runat="server" Text="Finish" OnClick="btn_Submit_Click" Style="padding: 1rem 3rem; border-radius: 50px!important; background: transparent; color: white; border-color: #149dcc !important; font-weight: 600; align-self: center; width: 100%" />
                </div>
            </div>

            <!-- Footer section-->
            <section once="footers" class="cid-rSxbAyIsnT" id="footer7-e">
                <div class="container">
                    <div class="media-container-row align-center mbr-white">
                        <div class="row row-links">
<!--
                            <ul class="foot-menu">
                                <li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank" style="color: aliceblue; text-decoration: none;">Services</a>
                                </li>
                                <li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank" style="color: aliceblue; text-decoration: none;">Get In Touch</a>
                                </li>
                                <li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank" style="color: aliceblue; text-decoration: none;">Work</a>
                                </li>
                            </ul>
-->
                        </div>
                        <div class="row social-row">
                            <div class="social-list align-right pb-2">
                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row row-copirayt" style="color: white; font-weight: 300; text-align: center">
                            <p class="mbr-text mb-0 mbr-fonts-style mbr-white align-center display-7">
                                © Copyright 2020 Armour Cyber Security &nbsp;
<!--
                                <br />
                                Powered By AI HUB
                                <br />
-->
                                - All Rights Reserved
                            </p>
                        </div>
                    </div>
                </div>
            </section>
    </form>
</body>
</html>