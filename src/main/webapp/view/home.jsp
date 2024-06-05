<%@ include file="components/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="components/header.jsp"%>
<link rel="stylesheet" href="/css/home.css" />
</head>
<body>
	<!-- Navbar -->
	<%@ include file="components/navbar.jsp"%>

	<!-- Main Content -->
	<main>
		<!-- Hero Banner -->
		<!-- 	<div class="container-fluid jumbotron">
			<div
				class="container d-flex justify-content-center align-items-center">
				<div class="jumbotron-content pt-4">
					
					<form id="searchForm" action="cars" class="d-flex">
						<input class="form-control" type="text" name="keyword" required
							placeholder="Search by Make, Model, or Year" />
						<button type="submit" class="btn btn-light">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
					
					<div class="jumbotron-text">
						<h2 class="fw-bolder m-0">Own</h2>
						<h2 class="fw-bolder">Your Dream Car</h2>
						<p>24-hr test drives & 30-day returns (up to 1500 mi)</p>
					</div>
					
				</div>
			</div>
		</div>
 -->
		<div class="jumbotron">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-6 col-lg-6 col-md-12 jumbotron-text mt-4">
						<div>
							<h1 class="display-6 fw-bold text-warning mt-3">Welcome to
								the U.C.S.P</h1>
							<p class="mb-4 lead text-white display-8 fw-bold fw-bold mt-3">Looking
								to buy or sell a used car? You're in the right place! Our
								platform connects buyers and sellers, offering a seamless
								experience for all. Join us and be a part of shaping the future
								of car sales.</p>
							<a href="<%=request.getContextPath()%>/cars"
								class="btn-search btn btn-primary text-uppercase mt-3 text-decoration-none">Search
								Cars Now!</a>
						</div>
					</div>
				</div>
			</div>
		</div>




		<!-- Hero Banner -->

		<!-- Cars Card -->
		<div class="container mt-4 p-3">
			<div class="text-center mb-4">
				<h2 class="fw-bolder mt-4 mb-4">Explore Our Featured Cars</h2>
				<a class="text-decoration-none btn btn-warning btn-md"
					href="<%=request.getContextPath()%>/cars"> <i
					class="mdi mdi-car mdi-18px me-1"></i> <span
					class="">View All Available Cars</span>
				</a>


			</div>
			<div class="wrapper row">
				<c:forEach items="${listCar}" var="car">
					<div class="col-12 col-md-6 col-lg-4 mb-3">
						<div class="card">
							<img class="card-img-top"
								src="data:${car.carPicture.fileType};base64,${car.carPicture.image}"
								alt="${car.make}" />
							<div class="card-body">
								<p class="car-details fw-bold">${car.make}${car.model}
									${car.year}</p>
								<p class="car-price">$${car.price}</p>
								<a
									href="<%= request.getContextPath() %>/cars/${car.make}/${car.model}/${car.year}/${car.idCar}">
									<button class="btn btn-primary">Car Details</button>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- Cars Card -->

		<!-- Services -->
		<!-- <div class="container mt-4">
        <div class="sell-your-car text-center">
          <h3 class="fw-bold">Sell Your Car For The Best Price</h3>
          <button class="btn btn-outline-light mb-3 mt-2">Sell Car Now</button>
          <p class="text-uppercase m-0">100% Verified Buyers</p>
        </div>
      </div> -->
	</main>

	<!-- Footer -->
	<%@ include file="components/footer.jsp"%>
</body>
</html>
