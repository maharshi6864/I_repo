<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>I-Repo | Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="adminResource/images/favicon.ico">

    <!-- owl.carousel css -->
    <link rel="stylesheet" href="adminResource/css/owl.carousel.min.css">

    <link rel="stylesheet" href="adminResource/css/owl.theme.default.min.css">

    <!-- Bootstrap Css -->
    <link href="adminResource/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="adminResource/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="adminResource/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <!-- App js -->
    <script src="adminResource/js/plugin.js"></script>

</head>

<body class="auth-body-bg">

    <div>
        <div class="container-fluid p-0">
            <div class="row g-0">
                <div class="col-xl-3">
                    <div class="auth-full-page-content p-md-5 p-4">
                        <div class="w-100">

                            <div class="d-flex flex-column h-100">
                                <div class="mb-4 mb-md-5">
                                    <a href="index.html" class="d-block card-logo">
                                        <!-- <img src="adminResource/images/logo-dark.png" alt="" height="18"
                                            class="card-logo-dark">
                                        <img src="adminResource/images/logo-light.png" alt="" height="18"
                                            class="card-logo-light"> -->
                                            <h2>Logo here</h2>
                                    </a>
                                </div>
                                <div class="my-auto">

                                    <div>
                                        <h5 class="text-primary">Welcome Back !</h5>
                                    </div>

                                    <div class="mt-4">
                                        <form action="/j_spring_security_check" method="post">

                                            <div class="mb-3">
                                                <label for="username" class="form-label">Username</label>
                                                <input type="text" class="form-control" id="username" name="username"
                                                    placeholder="Enter username">
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Password</label>
                                                <div class="input-group auth-pass-inputgroup">
                                                    <input type="password" class="form-control"
                                                        placeholder="Enter password" aria-label="Password"
                                                        aria-describedby="password-addon" name="password">
                                                    <button class="btn btn-light " type="button" id="password-addon"><i
                                                            class="mdi mdi-eye-outline"></i></button>
                                                </div>
                                                <div class="float-end mt-1">
                                                    <a href="" class="text-muted">Forgot
                                                        password?</a>
                                                </div>
                                            </div>

                                            <div class="form-check">
                                               <!-- Dont remove this even it is empty! -->
                                            </div>

                                            <div class="mt-3 d-grid">
                                                <button class="btn btn-primary waves-effect waves-light"
                                                    type="submit">Log In</button>
                                            </div>

                                        </form>
                                    
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="col-xl-9">
                    <div class="auth-full-bg pt-lg-5 p-4">
                        <div class="w-100">
                            <div class="bg-overlay"></div>
                            <div class="d-flex h-100 flex-column">

                                <div class="p-4 mt-auto">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-7">
                                            <div class="text-center">

                                                <h4 class="mb-3"><i
                                                        class="bx bxs-quote-alt-left text-primary h1 align-middle me-3"></i><span
                                                        class="text-primary">5k</span>+ Satisfied clients</h4>

                                                <div dir="ltr">
                                                    <div class="owl-carousel owl-theme auth-review-carousel"
                                                        id="auth-review-carousel">
                                                        <div class="item">
                                                            <div class="py-3">
                                                                <p class="font-size-16 mb-4">" Fantastic theme with a
                                                                    ton of options. If you just want the HTML to
                                                                    integrate with your project, then this is the
                                                                    package. You can find the files in the 'dist'
                                                                    folder...no need to install git and all the other
                                                                    stuff the documentation talks about. "</p>

                                                                <div>
                                                                    <h4 class="font-size-16 text-primary">Abs1981</h4>
                                                                    <p class="font-size-14 mb-0">- Skote User</p>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="item">
                                                            <div class="py-3">
                                                                <p class="font-size-16 mb-4">" If Every Vendor on Envato
                                                                    are as supportive as Themesbrand, Development with
                                                                    be a nice experience. You guys are Wonderful. Keep
                                                                    us the good work. "</p>

                                                                <div>
                                                                    <h4 class="font-size-16 text-primary">nezerious</h4>
                                                                    <p class="font-size-14 mb-0">- Skote User</p>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end col -->

               
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container-fluid -->
    </div>

    <!-- JAVASCRIPT -->
    <script src="adminResource/js/jquery.min.js"></script>
    <script src="adminResource/js/bootstrap.bundle.min.js"></script>
    <script src="adminResource/js/metisMenu.min.js"></script>
    <script src="adminResource/js/simplebar.min.js"></script>
    <script src="adminResource/js/waves.min.js"></script>
    <script src="adminResource/js/custom/loginOnLoad.js"></script>
	
    <!-- apexcharts -->
    <script src="adminResource/js/apexcharts.min.js"></script>

    <!-- owl.carousel js -->
    <script src="adminResource/js/owl.carousel.min.js"></script>

    <!-- auth-2-carousel init -->
    <script src="adminResource/js/auth-2-carousel.init.js"></script>

    <!-- file-manager js -->
    <script src="adminResource/js/file-manager.init.js"></script>

    <script src="adminResource/js/app.js"></script>

</body>

</html>