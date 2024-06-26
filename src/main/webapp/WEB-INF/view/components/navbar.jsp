<nav class="navbar navbar-dark navbar-expand-lg sticky-top p-0 bg-dark ">
    <div class="container">
        <a class="navbar-brand fw-bold fs-5 text-white" href="<%= request.getContextPath() %>/">U.C.S.P</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto me-0 fw-semibold">
                <li class="nav-item me-0 me-lg-3">
                    <a class="nav-link text-white" href="<%= request.getContextPath() %>/">Home</a>
                </li>
                <li class="nav-item me-0 me-lg-3">
                    <a class="nav-link text-white" href="<%= request.getContextPath() %>/cars">Cars</a>
                </li>
                <li class="nav-item me-0 me-lg-3">
                    <a class="nav-link text-white" href="<%= request.getContextPath() %>/user/post-car">Sell</a>
                </li>
            </ul>

            <!-- Login & Logout -->
            <security:authorize access="!isAuthenticated()">
                <div class="nav-button d-flex flex-column flex-lg-row">
                    <a href="<%= request.getContextPath() %>/login" class="btn btn-outline-light me-0 me-lg-3 mb-3 mb-lg-0">Login</a>
                    <a href="<%= request.getContextPath() %>/register" class="btn btn-primary mb-3 mb-lg-0">Register</a>
                </div>
            </security:authorize>

            <!-- User Menu -->
            <security:authorize access="isAuthenticated()">
                <ul class="navbar-nav fw-semibold">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="nav-account me-2">
                                <!-- Profile Picture -->
                                <c:if test="${profileLog.profilePicture == null}">
                                    <img src="/images/user/user-default.png" alt="Profile Picture" />
                                </c:if>
                                <c:if test="${profileLog.profilePicture != null}">
                                    <img src="data:${profileLog.profilePicture.fileType};base64,${profileLog.profilePicture.image}" alt="Profile Picture" />
                                </c:if>
                            </div>
                            ${profileLog.firstName}
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/user"><i class="fa-solid fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/user/my-posted-car"><i class="fa-solid fa-car"></i> My Posted Car</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/user/test-drive"><i class="fa-regular fa-calendar-check"></i> Appointment</a>
                            </li>
                            <!-- Admin Dashboard -->
                            <security:authorize access="hasRole('ADMIN')">
                                <li>
                                    <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/dashboard"><i class="fa-solid fa-gauge-high"></i> Dashboard </a>
                                </li>
                            </security:authorize>

                            <li class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/logout">
                                    <button class="nav-logout btn btn-primary">Logout</button>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </security:authorize>
        </div>
    </div>
</nav>
