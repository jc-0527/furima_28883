function calc() {
  const commission = 10 / 100;    //  販売手数料（％）
  let price_text = "";            //  価格（表示）
  let tax_price_text = "";        //  販売手数料（表示）
  let profit_text = "";           //  販売利益（表示）
  let price = 0;                  //  価格（計算用）
  let sales_commission = 0;       //  販売手数料（計算結果/計算用）
  let sales_profit = 0;           //  販売利益（計算用）

  // 価格（表示）
  price_text = document.getElementById('item-price');
  console.log(price_text);
  // 販売手数料（表示）
  tax_price_text = document.getElementById('add-tax-price');
  console.log(tax_price_text);
  // 価格（数値）
  price = price_text.value;

  // 入力された値によって、販売手数料（計算結果/計算用）を算出
  sales_commission = parseInt(price * commission, 10);
  // 販売手数料を表示
  tax_price_text.textContent = String(sales_commission);

  // 価格 - 販売手数料の計算をして、販売利益を表示する
  sales_profit = price - sales_commission;
  profit_text = document.getElementById('profit');
  profit_text.textContent = String(sales_profit);
}

function execute(){
  // "http://localhost:3000/items/new"にアクセスがあった場合
  if ( "http://localhost:3000/items/new" == location.href){
    console.log(location.href);
    let input = document.getElementById('item-price');
    console.log(input);
    input.addEventListener("input", calc);
  }
}

window.addEventListener('turbolinks:load',execute);
