function sizeChanged(buttonId, lastSize) {
  let sizeInput = document.getElementById(`inp-size-${buttonId}`);
  let allocateButton = document.getElementById(`but-size-${buttonId}`);
  if (lastSize == sizeInput.value || sizeInput.value == "") {
    allocateButton.setAttribute("disabled", "true");
  } else {
    allocateButton.removeAttribute("disabled");
  }
}

function setSize(id) {
  let sizeInput = document.getElementById(`inp-size-${id}`);
  let allocateButton = document.getElementById(`but-size-${id}`);
  let size = sizeInput.value;
  const regex = /^-?\d*(\.\d+)?$/; // Allows integers and decimals, with optional negative sign
  if (regex.test(sizeInput.value)) {
    sizeInput.classList.remove("is-invalid");
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
      if (htp.readyState == 4) {
        if (htp.status == 200) {
          allocateButton.setAttribute("disabled", "true");
          sizeInput.setAttribute("onkeyup", `sizeChanged('${id}','${size}')`);
        }
      }
    };
    htp.open("GET", `setSize?userId=${id}&size=${size}`, true);
    htp.send();
  } else {
    sizeInput.classList.add("is-invalid");
    console.log("invaliu");
  }
}
