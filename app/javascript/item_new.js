function commission(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input",() =>{
    const tenPercent = Math.floor(itemPrice.value * 0.1)
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = `${tenPercent}`
    const profit = document.getElementById("profit")
    profit.innerHTML = `${itemPrice.value - tenPercent}`
  })
}

window.addEventListener('turbo:load', commission)
window.addEventListener('turbo:render', commission)