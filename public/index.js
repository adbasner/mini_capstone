console.log('hello');

var productTemplate = document.querySelector('#product-card');
var productContainer = document.querySelector('.row');

// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));
// console.log(productTemplate);
// console.log(productTemplate.content);
// productContainer.appendChild(productTemplate.content.cloneNode(true));


axios.get("/api/products").then(function(response) {
  // console.log(response.data);
  //code
  var products = response.data;
  products.forEach(function(product) {
    console.log(product);

    var productClone = productTemplate.content.cloneNode(true);
    productClone.querySelector('.name').innerText = product.name;
    productClone.querySelector('.description').innerText = product.description;
    productClone.querySelector('.price').innerText = product.price;
    productClone.querySelector('.image-1').innerHTML = "<img src='" + product.images[0].url + "'>";
    productContainer.appendChild(productClone);
  });
});
