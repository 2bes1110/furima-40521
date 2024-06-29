// window.addEventListener('turbo:load', () => {
// });


// const priceInput = document.getElementById("item-price");
// const addTaxDom = document.getElementById("add-tax-price");
// const profit = document.getElementById("profit");
// priceInput.addEventListener("input", () => {
//   const inputValue = priceInput.value;

//   addTaxDom.innerHTML = Math.ceil(inputValue * 0.1);
//   addProfit.innerHTML = Math.floor(inputValue - addTaxDom);
// })


  
window.addEventListener("DOMContentLoaded", () => {
  if ( document.getElementById('item-price')!= null) {
    // 読み込まれたページに'item-price'というid名の要素があれば発火
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString(); 
        profitDom.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString();
    })
  }
});