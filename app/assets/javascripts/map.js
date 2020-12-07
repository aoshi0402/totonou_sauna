let map
  let marker = [];
  let infoWindow = [];
  let markerData = gon.saunas;

  function initMap() {
    
      if (!navigator.geolocation) {
        alert("Geolocation not supported");
        return;
      }

    // 位置情報を取得
    navigator.geolocation.getCurrentPosition(
      function (position) {
        console.log(position.coords.latitude)
        console.log(position.coords.longitude)
        LatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        // 取得した位置情報を中心に表示
        map = new google.maps.Map(document.getElementById("map"), {
          center: LatLng,
          zoom: 13
        });
        for (var i = 0; i < markerData.length; i++) {
          let id = markerData[i]["id"]

          // 各地点にマーカーを立てる
          markerLatLng = new google.maps.LatLng({
            lat: markerData[i]["latitude"],
            lng: markerData[i]["longitude"]
          });
          marker[i] = new google.maps.Marker({
            position: markerLatLng,
            map: map
          });

          // 各地点の吹き出しを作成
          infoWindow[i] = new google.maps.InfoWindow({
            // 吹き出しに表示する内容
            content: `<a href="/user/saunas/${id}">サウナ詳細を見る</a>` + markerData[i]["name"]
          });

          // マーカーにクリックイベントを追加
          markerEvent(i);
        }
      },
    );
  }
  // マーカーをクリックすると吹き出しが表示される
  function markerEvent(i) {
    marker[i].addListener("click", function () {
      infoWindow[i].open(map, marker[i]);
    });
  }