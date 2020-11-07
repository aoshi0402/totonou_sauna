$(function () {
  return $("#sauna_postcode").jpostal({
    postcode: ["#sauna_postcode"],
    address: {
      "#sauna_prefecture_code": "%3",
      "#sauna_address_city": "%4",
      "#sauna_address_street": "%5%6%7"
    }
  });
});