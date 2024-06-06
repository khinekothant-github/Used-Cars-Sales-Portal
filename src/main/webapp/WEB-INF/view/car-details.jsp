<%@ include file="components/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="components/header.jsp"%>
<link rel="stylesheet" href="/css/cars.css" />
<style>
/* Custom CSS for Car Details Section */
.car-details-container {
	margin-top: 4rem;
	padding: 0;
}

.car-details-container .car-image {
	padding: 0;
	margin-bottom: 1rem; /* Adjust spacing between image and details */
}

.car-details-container .car-details {
	padding: 0;
}

.car-details-container .car-details h4 {
	font-weight: bold;
	margin-bottom: 1rem;
}

.car-details-container .car-details p {
	margin-bottom: 0.5rem; /* Adjust spacing between paragraphs */
}

.car-details-container .car-button-actions {
	margin-top: 1rem;
}

/* Responsive Styles */
@media ( max-width : 768px) {
	.car-details-container {
		margin-top: 2rem;
	}
}
</style>
</head>
<body>
	<!-- Navbar -->
	<%@ include file="components/navbar.jsp"%>

	<!-- Main -->
	<main>
		<div class="container pt-5">
			<!-- Search Box, Price Range Filter, and Sell Your Car Button -->
			<div class="row align-items-center mb-4">
				<!-- Search Box -->
				<div class="col-md-6 col-lg-4 mb-3 mb-md-0">
					<form action="<%=request.getContextPath()%>/cars" id="searchForm"
						class="d-flex">
						<input class="form-control me-2" type="text" name="keyword"
							required placeholder="Search by Make, Model, or Year" />
						<button type="submit" class="btn btn-primary">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<!-- Price Range Filter -->
				<div class="col-md-6 col-lg-4 mb-3 mb-md-0">
					<form action="<%=request.getContextPath()%>/cars">
						<div class="input-group">
							<input class="form-control me-2" type="number" name="low"
								required placeholder="Min price" /> <input
								class="form-control me-2" type="number" name="high" required
								placeholder="Max price" />
							<button type="submit" class="btn btn-secondary">Apply
								Filters</button>
						</div>
					</form>
				</div>
				<!-- Sell Car Button -->
				<div class="col-lg-4 text-center text-lg-end">
					<a href="<%=request.getContextPath()%>/user/post-car"
						class="btn btn-warning"><i class="fa-solid fa-car me-2"></i>Sell
						Your Car</a>
				</div>
			</div>

			<!-- Car Details Container -->
			<div
				class="car-details-container row align-items-center justify-content-center mx-auto">
				<!-- Image -->
				<div
					class="car-image col-12 col-sm-4 order-sm-2 text-center mb-3 mb-sm-0">
					<img class="img-fluid" alt="${car.make}"
						src="data:${car.carPicture.fileType};base64,${car.carPicture.image}" />
				</div>
				<!-- Details -->
				
				<div class="car-details col-12 col-sm-4 order-sm-1 m-3 text-center text-sm-start">
					<h4 class="fw-bold">${car.make}${car.model}${car.year}</h4>
					<p class="text-secondary m-0">STARTING PRICE:</p>
					<p class="text-black fs-5">$${car.price}</p>
					<c:if test="${highestBidding != 0}">
						<p class="text-secondary m-0">HIGHEST BID:</p>
						<p class="text-black fs-5">$${highestBidding}</p>
					</c:if>
					<c:if test="${highestBidding == 0}">
						<p class="text-secondary m-0">HIGHEST BID:</p>
						<p class="text-black fs-5">$${highestBidding}</p>
					</c:if>
					<div class="car-button-actions">
						<a class="text-decoration-none"
							href="<%= request.getContextPath() %>/car-bid?id=${car.idCar}">
							<button class="btn btn-primary">Place Bid</button>
						</a> <a class="text-decoration-none"
							href="<%= request.getContextPath() %>/test-drive/${car.idCar}">
							<button class="btn btn-warning">Schedule a Test Drive</button>
						</a>
					</div>
				</div>
			</div>


		</div>
	</main>

	<!-- Footer -->
	<%@ include file="components/footer.jsp"%>
</body>
</html>
