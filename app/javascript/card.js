const pay = () => {
  console.log("aaaa")
  let bool = Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵
  console.log(bool);
  const form = document.getElementById("charge-form");
  console.log(form);
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // debugger
    const formResult = document.getElementById("charge-form");
    console.log(formResult);
    const formData = new FormData(formResult);
    console.log(formData);
 
    // const card = {
    //   number: formData.get("purchase_info[number]"),
    //   cvc: formData.get("cvc"),
    //   exp_month: formData.get("exp_month"),
    //   exp_year: `20${formData.get("exp_year")}`,
    // };

    // const card = {
    //   number = document.getElementById("card-number"),
    //   cvc = document.getElementById("cvc"),
    //   exp_month = document.getElementById("card-exp-month"),
    //   exp_year = `20${document.getElementById("card-exp-month")}`,
    // };

    const number = document.getElementById("card-number").value;
    const cvc = document.getElementById("card-cvc").value;
    const exp_month = document.getElementById("card-exp-month").value;
    const exp_year = `20${document.getElementById("card-exp-year").value}`;

    const card = {
      number,
      cvc,
      exp_month,
      exp_year,
    };

    console.log(card);

    Payjp.createToken(card, (status, response) => {
      debugger
      console.log(status)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
 
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);