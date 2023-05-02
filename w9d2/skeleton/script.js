document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  
  const favForm = document.querySelector(".list-container");
  
  favForm.addEventListener("submit", e => {
    e.preventDefault();
    
    const favPlaceInput = document.querySelector(".favorite-input");
    const favPlaceName = favPlaceInput.value;
    favPlaceInput.value = "";
    
    const ul = document.getElementById("sf-places");
    const li = document.createElement('li');
    li.textContent = favPlaceName;
    ul.appendChild(li);
  })
  
  // alternative way, define function first then pass it into event listener later

  // const favSubmit = (e) => {
  //   e.preventDefault();

  //   const favPlaceInput = document.querySelector(".favorite-input");
  //   const favPlaceName = favPlaceInput.value;
  //   favPlaceInput.value = "";

  //   const ul = document.getElementById("sf-places");
  //   const li = document.createElement('li');
  //   li.textContent = favPlaceName;
  //   ul.appendChild(li);
  // };

  // const favPlaceSubmitBtn = document.querySelector(".favorite-submit");
  // favPlaceSubmitBtn.addEventListener("click", favSubmit);


  // adding new photos

  // --- your code here!

  const togglePhotoForm = (e) => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.className = "photo-form-container";
    } else {
      photoForm.className = "photo-form-container hidden"
    }
  }
  const photoFormShowBtn = document.querySelector(".photo-show-button");
  photoFormShowBtn.addEventListener("click", togglePhotoForm);
  

  const photoForm = document.querySelector(".photo-form-container");
  
  photoForm.addEventListener("submit", e => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const ul = document.querySelector(".dog-photos")
    const img = document.createElement("img");
    img.src = photoUrl;
    const li = document.createElement('li');
    li.appendChild(img);
    ul.appendChild(li);
  })



});
