window.addEventListener('turbo:load', () => {
});

// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profit = document.getElementById("profit");


priceInput.addEventListener("input", () => {
  const inputValue = document.getElementById("item-price").value;
  
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString(); 
    profit.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString();
})
