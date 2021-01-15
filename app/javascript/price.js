function price(){
  const path = location.pathname
  const pathRegex = /^(?=.*item)(?=.*edit)/
  if (path === "/items/new" || path === "/items" || pathRegex.test(path)) {
    const priceInput = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const profitPrice = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        let tax = Math.floor(inputValue * 0.1).toLocaleString(); 
        addTaxPrice.innerHTML = tax ;
        profitPrice.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString();
    })
   }
};


window.addEventListener('load', price)
