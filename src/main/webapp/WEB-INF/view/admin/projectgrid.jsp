<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Projects Grid | Skote - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResource/images/favicon.ico" />

    <!-- Bootstrap Css -->
    <link href="<%=request.getContextPath()%>/adminResource/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<%=request.getContextPath()%>/adminResource/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<%=request.getContextPath()%>/adminResource/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <!-- App js -->
    <script src="<%=request.getContextPath()%>/adminResource/js/plugin.js"></script>
</head>

<body data-sidebar="dark">
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
        <jsp:include page="header.jsp"></jsp:include>        <!-- ========== Left Sidebar Start ========== -->
        
        
        <jsp:include page="menu.jsp"></jsp:include>
        
                <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0 font-size-18">Projects Grid</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item">
                                            <a href="javascript: void(0);">Projects</a>
                                        </li>
                                        <li class="breadcrumb-item active">Projects Grid</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-1.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">New admin Design</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                It will be as simple as Occidental
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-4.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-5.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <div class="avatar-xs">
                                                            <span
                                                                class="avatar-title rounded-circle bg-success text-white font-size-16">
                                                                A
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-2.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-success">Completed</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 15 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 214
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-2.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">Brand logo design</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                To achieve it would be necessary
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-8.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-2.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-warning">Pending</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 22 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 183
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-3.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">New Landing Design</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                For science, music, sport, etc
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <div class="avatar-xs">
                                                            <span
                                                                class="avatar-title rounded-circle bg-info text-white font-size-16">
                                                                K
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-2.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-danger">Delay</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 13 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 175
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-4.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">Redesign - Landing
                                                    page</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                If several languages coalesce
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-1.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-6.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-7.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-success">Completed</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 14 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 202
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-5.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">Skote Dashboard UI</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                Separate existence is a myth
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-1.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-3.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <div class="avatar-xs">
                                                            <span
                                                                class="avatar-title rounded-circle bg-danger text-white font-size-16">
                                                                3+
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-success">Completed</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 13 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 194
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-6.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">Blog Template UI</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                For science, music, sport, etc
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-4.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-5.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-warning">Pending</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 24 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 122
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-3.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">Multipurpose
                                                    Landing</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                It will be as simple as Occidental
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-5.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <div class="avatar-xs">
                                                            <span
                                                                class="avatar-title rounded-circle bg-warning text-white font-size-16">
                                                                R
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-danger">Delay</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 15 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 214
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-4.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">App Landing UI</a>
                                            </h5>
                                            <p class="text-muted mb-4">
                                                To achieve it would be necessary
                                            </p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <div class="avatar-xs">
                                                            <span
                                                                class="avatar-title rounded-circle bg-pink text-white font-size-16">
                                                                L
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-2.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-success">Completed</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 11 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 185
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 me-4">
                                            <div class="avatar-md">
                                                <span
                                                    class="avatar-title rounded-circle bg-light text-danger font-size-16">
                                                    <img src="<%=request.getContextPath()%>/adminResource/images/img-2.png" alt="" height="30" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-truncate font-size-15">
                                                <a href="javascript: void(0);" class="text-dark">New admin Design</a>
                                            </h5>
                                            <p class="text-muted mb-4">Their most common words.</p>
                                            <div class="avatar-group">
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-4.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-5.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <div class="avatar-xs">
                                                            <span
                                                                class="avatar-title rounded-circle bg-success text-white font-size-16">
                                                                A
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="avatar-group-item">
                                                    <a href="javascript: void(0);" class="d-inline-block">
                                                        <img src="<%=request.getContextPath()%>/adminResource/images/avatar-2.jpg" alt=""
                                                            class="rounded-circle avatar-xs" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top">
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item me-3">
                                            <span class="badge bg-success">Completed</span>
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-calendar me-1"></i> 12 Oct, 19
                                        </li>
                                        <li class="list-inline-item me-3">
                                            <i class="bx bx-comment-dots me-1"></i> 106
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="pagination pagination-rounded justify-content-center mt-2 mb-5">
                                <li class="page-item disabled">
                                    <a href="javascript: void(0);" class="page-link"><i
                                            class="mdi mdi-chevron-left"></i></a>
                                </li>
                                <li class="page-item">
                                    <a href="javascript: void(0);" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="javascript: void(0);" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="javascript: void(0);" class="page-link">3</a>
                                </li>
                                <li class="page-item">
                                    <a href="javascript: void(0);" class="page-link">4</a>
                                </li>
                                <li class="page-item">
                                    <a href="javascript: void(0);" class="page-link">5</a>
                                </li>
                                <li class="page-item">
                                    <a href="javascript: void(0);" class="page-link"><i
                                            class="mdi mdi-chevron-right"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- end row -->
                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->

    <!-- Right Sidebar -->
    
    <!-- /Right-bar -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <!-- JAVASCRIPT -->
    <script src="<%=request.getContextPath()%>/adminResource/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResource/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResource/js/metisMenu.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResource/js/simplebar.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResource/js/waves.min.js"></script>

    <script src="<%=request.getContextPath()%>/adminResource/js/app.js"></script>
</body>

</html>