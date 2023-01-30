
	<div class="header bg-dark text-white">
		<div class="headerleft">
			<h1>My Website</h1>
			<!-- <img src="./img/mobile-phones-38.png" width="100%"> -->
		</div>

		<div class="headerright">
			<form class="searchbar" name="searchform" action="SearchController2"
				method="get">
				<select name="categories" class="selectcategories">
					<option value="category1">Category 1</option>
					<option value="category2">Category 2</option>
				</select> 
				<input class="itename" type="text" name="s"
					placeholder="What are you looking for?" /> 
				<input
					class="searchbutton" type="image"
					src="./img/Magnify-Search-icon.png" alt="Submit"
					style="width: 20px; height: 20px" />
			</form>
		</div>
	</div>

	<div class="topnav">
		<a href="/PRJ321x_Project_3_ngocntFX17334/HomeProductController">Home</a>
		<a
			href="/PRJ321x_Project_3_ngocntFX17334/URLController?action=products">Products</a>
		<a href="/PRJ321x_Project_3_ngocntFX17334/URLController?action=about">About
			us</a> 
			
	<%-- <a style="float: right;background: yellow;" 
			href="/PRJ321x_Project_3_ngocntFX17334/AddToCartController?id=${product.id}&action=add">CART</a> --%>
					
			<a style="float: right;background: green;" 
			href="/PRJ321x_Project_3_ngocntFX17334/URLController?action=register">Register</a>
		<a style="float: right;background: green;" 
			href="/PRJ321x_Project_3_ngocntFX17334/URLController?action=login">Login</a>
	</div>
