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
  // 販売手数料（表示）
  tax_price_text = document.getElementById('add-tax-price');
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
  // item-price要素がある場合のみ実行
  if ( document.getElementById('item-price') != null ){
    let input = document.getElementById('item-price');
    input.addEventListener("input", calc);
  }
}

window.addEventListener('load',execute);
