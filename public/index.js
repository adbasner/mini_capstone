// Sample Page
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

// Home Page
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

// Signup Page
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// Login Page
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

// Logout Page
var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

// Add product
var ProductsNew = {
  template: "#products-new",
  data: function() {
    return {
      name: "",
      description: "",
      price: "",
      supplier_id: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name,
        input_description: this.description,
        input_price: this.price,
        supplier_id: 3
      };
      axios
        .post("/api/products/", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// Carted Products
var CartedProducts = {
  template: "#carted-products",
  data: function() {
    return {
      message: "This is the shopping cart",
      cartedProducts: []
    };
  },
  created: function() {
    console.log('in get cart');
    axios.get('/api/carted_products').then(function(response) {
      console.log(response.data);
      this.cartedProducts = response.data;
    }.bind(this));


  },
  methods: {},
  computed: {}
};

// Orders
var Orders = {
  template: "#orders",
  data: function() {
    return {
      message: "These are your orders",
      orders: []
    };
  },
  created: function() {
    console.log('in orders');
    axios.get('/api/carted_products').then(function(response) {
      console.log(response.data);
      this.cartedProducts = response.data;
    }.bind(this));


  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/sample", component: SamplePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/new", component: ProductsNew },
    { path: "/cartedproducts", component: CartedProducts }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
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
