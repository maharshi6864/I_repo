window.addEventListener("load", onPageLoad);
let pageListG = [];

function getLastPage() {
  return JSON.parse(localStorage.getItem("lastPage"));
}

function setLastPage(page) {
  return localStorage.setItem("lastPage", JSON.stringify(page));
}

function onPageLoad() {
  document.body.addEventListener("contextmenu", (e) => {
    e.preventDefault();
  });
  localStorage.getItem("lastPage") === null
    ? localStorage.setItem("lastPage", "")
    : localStorage.getItem("lastPage");
  if (localStorage.getItem("pageList") == null) {
    updatePageListAndPage("null");
    localStorage.setItem(
      "pageList",
      JSON.stringify([{ folderId: null, folderName: "My Files" }])
    );
    pageListG.push({ folderId: null, folderName: "My Files" });
  } else {
    pageListG = JSON.parse(localStorage.getItem("pageList"));
    if (pageListG.length !== 0) {
      updatePageListAndPage(pageListG[pageListG.length - 1].folderId);
    } else {
      updatePageListAndPage("null");
    }
  }
}

function getDocs(folderId) {
  let htp = new XMLHttpRequest();
  htp.onreadystatechange = function () {
    if (htp.readyState === 4) {
      var response = JSON.parse(htp.responseText);
      if (response.status) {
        createDocs(response.body);
      }
    }
  };
  htp.open("GET", `getUserDocs?folderId=${folderId}`, true);
  htp.send();
}

function createDocs(docList) {
  let docsContainer = document.getElementById("docs");
  docsContainer.innerHTML = "";
  if (docList.length == 0) {
    docsContainer.innerHTML = `<div class="d-flex justify-content-center align-items-center"
    style="height: 400px; width: 100%;">
    <div>Empty Folder.</div>
</div>`;
  }

  for (let i = 0; i < docList.length; i++) {
    // docsContainer.innerHTML =
    //   docsContainer.innerHTML +
    //   `<div class="col-xl-4 col-sm-6 " style="cursor:pointer" title="double click to access." ondblclick="getInsideFolder(${docList[i].id},'${docList[i].name}')">
    //                                                         <div class="card folder-icon shadow-none border">
    //                                                             <div class="card-body p-2">
    //                                                                 <div class="">
    //                                                                     <div class="float-end ms-2">
    //                                                                         <div class="dropdown mb-2">
    //                                                                             <a class="font-size-16 text-muted"
    //                                                                                 role="button"
    //                                                                                 data-bs-toggle="dropdown"
    //                                                                                 aria-haspopup="true">
    //                                                                                 <i
    //                                                                                     class="mdi mdi-dots-horizontal"></i>
    //                                                                             </a>

    //                                                                             <div
    //                                                                                 class="dropdown-menu dropdown-menu-end">
    //                                                                                 <a class="dropdown-item"
    //                                                                                     href="#">Open</a>
    //                                                                                 <a class="dropdown-item"
    //                                                                                     href="#">Edit</a>
    //                                                                                 <a class="dropdown-item"
    //                                                                                     href="#">Rename</a>
    //                                                                                 <div class="dropdown-divider"></div>
    //                                                                                 <a class="dropdown-item"
    //                                                                                     href="#">Remove</a>
    //                                                                             </div>
    //                                                                         </div>
    //                                                                     </div>
    //                                                                     <div class="avatar-xs me-2 mb-2">
    //                                                                         <div
    //                                                                             class="avatar-title bg-transparent rounded">
    //                                                                             <i
    //                                                                                 class="bx bxs-folder font-size-24 text-warning"></i>
    //                                                                         </div>
    //                                                                     </div>
    //                                                                     <div class="d-flex">
    //                                                                         <div class="overflow-hidden me-auto">
    //                                                                             <h5
    //                                                                                 class="font-size-14 text-truncate mb-1">
    //                                                                                 <a href="javascript: void(0);"
    //                                                                                     class="text-body">${docList[i].name}</a>
    //                                                                             </h5>
    //                                                                             <p
    //                                                                                 class="text-muted text-truncate mb-0">
    //                                                                                 20
    //                                                                                 Files</p>
    //                                                                         </div>
    //                                                                         <!-- Keep this until Final. -->
    //                                                                         <!-- <div class="align-self-end ms-2">
    //                                                                         <p class="text-muted mb-0">8GB</p>
    //                                                                     </div> -->
    //                                                                     </div>

    //                                                                 </div>
    //                                                             </div>

    //                                                         </div>
    //                                                     </div>`;
    docsContainer.innerHTML +=
      docList[i].docType === "FOLDER"
        ? // Folder structure
          `<div class="col-xl-4 col-sm-6" style="cursor:pointer" title="double click to access." oncontextmenu="onrightClickEventToOpenFolderMenu(${docList[i].id})" onclick="onclickEventToFolder('${docList[i].name}', ${docList[i].id})" ondblclick="getInsideFolder(${docList[i].id},'${docList[i].name}')">
            <div class="card border folder-icon folder-hover shadow-none mb-2" id="folder${docList[i].id}">
              <div class="p-2" style="padding:0.75rem !important">
                <div class="d-flex">
                  <div class="avatar-xs align-self-center me-2">
                    <div class="avatar-title bg-transparent rounded">
                      <i class="bx bxs-folder font-size-24 text-warning"></i>
                    </div>
                  </div>
                  <div class="overflow-hidden me-auto">
                    <h5 class="font-size-13 text-truncate mb-1">${docList[i].name}</h5>
                    <p class="text-muted text-truncate mb-0">${docList[i].docSize}</p>
                  </div>
                  <div class="float-end ms-2">
                    <div class="dropdown mb-2">
                      <a class="font-size-16 text-muted" id="${docList[i].id}" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                        <i class="mdi mdi-dots-horizontal"></i>
                      </a>
                      <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="#" onclick="getInsideFolder(${docList[i].id},'${docList[i].name}')">Open</a>
                        <a class="dropdown-item" href="#">Edit</a>
                        <a class="dropdown-item" href="#">Rename</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" style="color:#f46a6a" onclick="deleteFolder(${docList[i].id})" href="#">Remove</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>`
        : // File structure
          `<div class="col-xl-4 col-sm-6" style="cursor:pointer" title="double click to download."ondblclick="downloadFile('${docList[i].docPath}')">
            <div class="card border file-icon file-hover shadow-none mb-2" id="file${docList[i].id}">
              <div class="p-2" style="padding:0.75rem !important">
                <div class="d-flex">
                  <div class="avatar-xs align-self-center me-2">
                    <div class="avatar-title bg-transparent rounded">
                      <i class="bx bxs-file font-size-24 align-middle text-primary me-2"></i>
                    </div>
                  </div>
                  <div class="overflow-hidden me-auto">
                    <h5 class="font-size-13 text-truncate mb-1">${docList[i].name}</h5>
                    <p class="text-muted text-truncate mb-0">${docList[i].docSize}</p>
                  </div>
                  <div class="float-end ms-2">
                    <div class="dropdown mb-2">
                      <a class="font-size-16 text-muted" id="${docList[i].id}" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                        <i class="mdi mdi-dots-horizontal"></i>
                      </a>
                      <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="#" onclick="downloadFile('${docList[i].docPath}')">Download</a>
                        <a class="dropdown-item" href="#">Edit</a>
                        <a class="dropdown-item" href="#">Rename</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" style="color:#f46a6a" onclick="deleteFile(${docList[i].id})" href="#">Remove</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>`;
  }
}

//This function is for the right click functionality
function onrightClickEventToOpenFolderMenu(menuId) {
  document.getElementById(menuId).click();
}

//This function is for the onclick functionality
function onclickEventToFolder(folderName, folderId) {
  let folderList = document.getElementsByClassName("folder-icon");
  for (let i = 0; i < folderList.length; i++) {
    const element = folderList[i];
    element.style.backgroundColor = "#ffffff";
    element.classList.add("folder-hover");
  }
  let selectedElement = document.getElementById("folder" + folderId);
  selectedElement.style.backgroundColor = "rgb(223 227 231 / 60%)";
  selectedElement.classList.remove("folder-hover");

  let nextPathElement = document.getElementById("next-path");
  nextPathElement.innerHTML = "";
  nextPathElement.innerHTML = ` ${folderName} / `;
}

function getInsideFolder(folderId, folderName) {
  document.getElementById("next-path").innerHTML = "";
  let page = { folderId: folderId, folderName: folderName };
  pageListG.push(page);
  setLastPage(pageListG);
  updatePageListAndPage(folderId);
  if (getLastPage().length === pageListG.length) {
    document
      .getElementById("last-page-button")
      .setAttribute("disabled", "true");
  } else {
    document.getElementById("last-page-button").removeAttribute("disabled");
  }
}

function getOutsideFolder() {
  let lastPage = getLastPage();
  let pageListDupl = [...pageListG];
  pageListG.splice(pageListG.length - 1, 1);
  if (lastPage.length === pageListG.length) {
    document
      .getElementById("last-page-button")
      .setAttribute("disabled", "true");
  } else {
    document.getElementById("last-page-button").removeAttribute("disabled");
  }
  setLastPage(pageListDupl);
  updatePageListAndPage(pageListG[pageListG.length - 1].folderId);
}

function updatePageListAndPage(folderId) {
  localStorage.setItem("pageList", JSON.stringify(pageListG));
  getDocs(folderId);
  if (pageListG.length === 1) {
    document
      .getElementById("previous-page-button")
      .setAttribute("disabled", "true");
  } else {
    document.getElementById("previous-page-button").removeAttribute("disabled");
  }
  updatePageBreadCrumb();
}

function goToLastPage() {
  let lastPage = getLastPage();
  pageListG = lastPage;
  updatePageListAndPage(pageListG[pageListG.length - 1].folderId);
  document.getElementById("last-page-button").setAttribute("disabled", "true");
}

function updatePageBreadCrumb() {
  let pagePath = document.getElementById("page-path");
  pagePath.innerHTML = `<a href="#" onclick='jumpToPage(${1})' style="cursor:pointer">Home / </a>`;
  for (let index = 1; index < pageListG.length; index++) {
    pagePath.innerHTML =
      pagePath.innerHTML +
      `<a href="#" onclick='jumpToPage(${index + 1})' style="cursor:pointer"> ${
        pageListG[index].folderName
      } / </a>`;
  }
  document.getElementById("next-path").innerHTML = "";
}

function jumpToPage(pagesToJump) {
  setLastPage(pageListG);
  pageListG.splice(pagesToJump);
  updatePageListAndPage(pageListG[pageListG.length - 1].folderId);
}

function getFolderDetailsToCreate() {
  let currentFolder = pageListG[pageListG.length - 1];
  let newFolderName = document.getElementById("create-new-folder-name").value;
  createFolder({
    currentFolderId:
      currentFolder.folderId === null ? 0 : currentFolder.folderId,
    currentFolderName: currentFolder.folderName,
    newFolderName: newFolderName,
  });
}

function createFolder(obj) {
  var htp = new XMLHttpRequest();
  htp.open("POST", "createFolder", true);
  htp.setRequestHeader("Content-Type", "application/json");
  htp.onreadystatechange = function () {
    if (htp.readyState == 4) {
      var response = JSON.parse(htp.responseText);
      let createFolderInput = document.getElementById("create-new-folder-name");
      if (response.status) {
        createFolderInput.classList.remove("is-invalid");
        createFolderInput.value = "";
        document.getElementById("create-folder-close-button").click();
        getDocs(pageListG[pageListG.length - 1].folderId);
      } else {
        createFolderInput.classList.add("is-invalid");
      }
    }
  };
  htp.send(JSON.stringify(obj));
}

function deleteFolder(folderId) {
  var htp = new XMLHttpRequest();
  htp.open("GET", "deleteFolder?folderId=" + folderId, true);
  htp.onreadystatechange = function () {
    if (htp.readyState == 4) {
      let response = htp.responseText;
      if (response === "valid") {
      } else {
        window.alert("File name already exists");
      }
    }
  };
  htp.send();
}

function uploadFile() {
  let uploadFile = document.getElementById("create-new-file-name");
  let file = uploadFile.files[0]; // Get the selected file
  let fileName = uploadFile.value;
  let slice = fileName.lastIndexOf("\\");
  let newFileName = fileName.slice(slice + 1, fileName.length);
  let currentFolder = pageListG[pageListG.length - 1];

  let formData = new FormData();
  formData.append("file", file); // File data
  formData.append("fileName", newFileName); // File name
  formData.append(
    "folderId",
    currentFolder.folderId === null ? 0 : currentFolder.folderId
  );

  var htp = new XMLHttpRequest();
  htp.open("POST", "uploadFile", true);
  htp.onreadystatechange = function () {
    if (htp.readyState == 4) {
      var response = JSON.parse(htp.responseText);
      let createFileInput = document.getElementById("create-new-file-name");
      if (response.status) {
        createFileInput.classList.remove("is-invalid");
        createFileInput.value = "";
        document.getElementById("create-file-close-button").click();
        getDocs(pageListG[pageListG.length - 1].folderId);
      } else {
        createFileInput.classList.add("is-invalid");
      }
    }
  };
  htp.send(formData);
}

function checkForFileNameAvailablity(data) {
  console.log(data);
}

// function uploadFile() {
//   let fileName = document.getElementById("upload-file");
//   console.log(fileName.value);
// }

function startUploadingFile(obj) {
  var htp = new XMLHttpRequest();
  htp.open("POST", "checkForFileNameAvailablity", true);
  htp.setRequestHeader("Content-Type", "application/json");
  htp.onreadystatechange = function () {
    if (htp.readyState == 4) {
      let response = htp.responseText;
      if (response === "valid") {
      } else {
        window.alert("File name already exists");
      }
    }
  };
  htp.send(JSON.stringify(obj));
}

function extractFilename(url) {
  const lastSlashIndex = url.lastIndexOf("/");
  return url.substring(lastSlashIndex + 1);
}

function downloadFile(docId) {
  var obj = { filePath: docId };
  console.log(docId);
  var htp = new XMLHttpRequest();
  htp.open("POST", "/user/downloadFile", true);
  htp.setRequestHeader("Content-Type", "application/json");
  htp.responseType = "blob"; // Expecting a binary file (blob) in response

  htp.onload = function () {
    if (htp.status === 200) {
      var blob = new Blob([htp.response], {
        type: htp.getResponseHeader("Content-Type"),
      });

      var link = document.createElement("a");
      link.href = window.URL.createObjectURL(blob);

      var contentDisposition = htp.getResponseHeader("Content-Disposition");
      var fileName = extractFilename(docId); // Default file name

      if (
        contentDisposition &&
        contentDisposition.indexOf("attachment") !== -1
      ) {
        var fileNameMatch = contentDisposition.match(/filename="?([^"]*)"?/);
        if (fileNameMatch.length > 1) {
          fileName = fileNameMatch[1];
        }
      }

      link.download = fileName;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    } else {
      console.error("Failed to download file. Status:", htp.status);
    }
  };

  htp.onerror = function () {
    console.error("An error occurred while downloading the file.");
  };

  htp.send(JSON.stringify(obj));
}
