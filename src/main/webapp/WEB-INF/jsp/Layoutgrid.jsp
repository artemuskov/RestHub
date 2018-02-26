<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">

    <div class="col1" style="text-align: right; padding-top: 10px;">
        <div class="btn-group">
            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                Sort by
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="/menu/${category}/sort/byPrice">Price</a>
                <a class="dropdown-item" href="/menu/${category}/sort/ByCalories">Calories</a>
                <a class="dropdown-item" href="/menu/${category}/sort/ByPreparingtime">Preparing time</a>
            </div>
        </div>
    </div>

    <div class="row1">

        <c:forEach items="${menuItems}" step="4" varStatus="loop">
            <div class="card-deck">
                <c:forEach items="${menuItems}" begin="${loop.index}" end="${loop.index+3}" var="item">
                    <div id="menudish${item.id}" class="card">

                        <a href="/dish/${item.id}">
                            <div id="dishCarousel${item.id}" class="carousel slide card-img-top" data-interval="false" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="${item.images[0].url}" alt="${item.name}">
                                </div>
                                <c:forEach items="${item.images}" begin="1" var="img">
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${img.url}" alt="${item.name}">
                                    </div>
                                </c:forEach>
                            </div>
                            <a class="carousel-control-prev" href="#dishCarousel${item.id}" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#dishCarousel${item.id}" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                            </div>
                        </a>

                        <c:if test="${orderMap.containsKey(item)}">
                            <div class="card-header">
                                In order (${orderMap.get(item)})
                            </div>
                        </c:if>
                        <div class="card-body">
                            <h4 class="card-title">${item.name}</h4>
                            <p class="card-text">${item.description}</p>
                        </div>

                        <div class="card-footer">
                            <h5 class="card-title inline">${item.price}$</h5>
                            <a href="/addToOrder/${item.id}" class="btn btn-primary inline">Add to cart</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
    </div>
</div>