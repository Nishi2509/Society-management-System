<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center">
        <a class="navbar-brand brand-logo" href="index">
            <h2>SocietEase</h2>
        </a> <a class="navbar-brand brand-logo-mini" href="index">
        <h2>SE</h2>
    </a>
    </div>
    <div
            class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center"
                type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
        </button>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item dropdown"><a
                    class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center"
                    id="notificationDropdown" href="#" data-toggle="dropdown"> <span
                    class="" style="position: absolute; left: 36%; top: -6px;"
                    id="count"></span> <i class="mdi mdi-bell-outline mx-0 m-0"></i>
            </a>
                <div
                        class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list "
                        style="width: 425px;" aria-labelledby="notificationDropdown">
                    <div class="d-flex flex-column"
                         style="overflow-y: hidden; min-height: 50px; max-height: 250px">
                        <p class="mb-0 font-weight-normal float-left dropdown-header pt-0 pb-2"
                           style="font-size: 17px !important; font-weight: 500 !important;">Notifications</p>
                        <hr class="m-0 border border-1 mb-2">
                        <ul
                                style="overflow-x: hidden; overflow-y: scroll; scrollbar-width: none; list-style-type: disc !important;"
                                id="user-notifications">
                            <li><a>
                                <div class="preview-item-content">
                                    <h6 class="preview-subject font-weight-normal">Application
                                        Error</h6>
                                    <p class="font-weight-light small-text mb-0 text-muted">
                                        Just now</p>
                                </div>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="nav-item nav-profile dropdown"><a class="nav-link"
                                                         href="#" data-toggle="dropdown" id="profileDropdown">
                <img
                        src=""
                        id="headerProfileImage"
                        alt="profile"/>
            </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                     aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="profile"> <i class="mdi mdi-account"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="/logout"> <i class="mdi mdi-logout"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
        <button
                class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
                type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>
</nav>
