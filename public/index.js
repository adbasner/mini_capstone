/* global Vue, VueRouter, axios */
var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Sample Page"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    console.log('in create function');
    axios.get('api/products').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));


  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/sample", component: SamplePage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});


// console.log('hello');

// var productTemplate = document.querySelector('#product-card');
// var productContainer = document.querySelector('.row');


// axios.get("/api/products").then(function(response) {
//   // console.log(response.data);
//   //code
//   var products = response.data;
//   products.forEach(function(product) {
//     console.log(product);

//     var productClone = productTemplate.content.cloneNode(true);
//     productClone.querySelector('.name').innerText = product.name;
//     productClone.querySelector('.description').innerText = product.description;
//     productClone.querySelector('.price').innerText = product.price;
//     productClone.querySelector('.image-1').innerHTML = "<img src='" + product.images[0].url + "'>";
//     productContainer.appendChild(productClone);
//   });
// });
