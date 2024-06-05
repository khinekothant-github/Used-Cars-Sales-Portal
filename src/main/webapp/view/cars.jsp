<%@ include file="components/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="components/header.jsp"%>
<link rel="stylesheet" href="/css/cars.css" />
</head>
<body>
	<!-- Navbar -->
    <%@ include file="components/navbar.jsp"%>

    <!-- Main -->
    <main>
        <div class="container pt-5">
            <!-- Heading -->
            <h2 class="text-center mb-4">Explore Our Available Cars</h2>

            <!-- Search Box, Price Range Filter, and Sell Your Car Button -->
            <div class="row align-items-center mb-4">
                <!-- Search Box -->
                <div class="col-md-6 col-lg-4 mb-3 mb-md-0">
                    <form action="<%=request.getContextPath()%>/cars" id="searchForm" class="d-flex">
                        <input class="form-control me-2" type="text" name="keyword" required placeholder="Search by Make, Model, or Year" />
                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
                <!-- Price Range Filter -->
                <div class="col-md-6 col-lg-4 mb-3 mb-md-0">
                    <form action="<%=request.getContextPath()%>/cars">
                        <div class="input-group">
                            <input class="form-control me-2" type="number" name="low" required placeholder="Min price" />
                            <input class="form-control me-2" type="number" name="high" required placeholder="Max price" />
                            <button type="submit" class="btn btn-secondary">Apply Filters</button>
                        </div>
                    </form>
                </div>
                <!-- Sell Car Button -->
                <div class="col-lg-4 text-center text-lg-end">
                    <a href="<%=request.getContextPath()%>/user/post-car" class="btn btn-warning"><i class="fa-solid fa-car me-2"></i>Sell Your Car</a>
                </div>
            </div>

            <!-- Car Listing -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="mt-4 row">
                        <c:if test="${!listCar.isEmpty()}">
                            <c:forEach items="${listCar}" var="car">
                                <c:if test="${car.status.equals('ACTIVE')}">
                                    <div class="col-12 col-md-6 col-lg-3 mb-3">
                                        <div class="card">
                                            <img class="card-img-top" src="data:${car.carPicture.fileType};base64,${car.carPicture.image}" alt="${car.make}" />
                                            <div class="card-body">
                                                <p class="car-details fw-bold">${car.make}${car.model} ${car.year}</p>
                                                <p class="car-price">$${car.price}</p>
                                                <a href="<%= request.getContextPath() %>/cars/${car.make}/${car.model}/${car.year}/${car.idCar}">
                                                    <button class="btn btn-primary">View Details</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <c:if test="${listCar.isEmpty()}">
                            <h4 class="fw-bold text-secondary text-center">No Cars Found</h4>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <%@ include file="components/footer.jsp"%></body></html>
