window.addEventListener("load", onPageLoad);
let pageListG = [];

function onPageLoad() {
  localStorage.getItem("lastPage") === null
    ? localStorage.setItem("lastPage", "")
    : localStorage.getItem("lastPage");
  if (localStorage.getItem("pageList") == null) {
    updatePageListAndPage("null");
    localStorage.setItem(
      "pageList",
      JSON.stringify([{ folderId: null, folderName: "My Files" }])
    );
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
      var docList = JSON.parse(htp.responseText);
      createDocs(docList);
    }
  };
  htp.open("GET", `getUserDocs?folderName=${folderId}`, true);
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
    docsContainer.innerHTML =
      docsContainer.innerHTML +
      `<div class="col-xl-4 col-sm-6" style="cursor:pointer" title="double click to access." ondblclick="getInsideFolder(${docList[i].id},'${docList[i].name}')">
                                                            <div class="card shadow-none border">
                                                                <div class="card-body p-2">
                                                                    <div class="">
                                                                        <div class="float-end ms-2">
                                                                            <div class="dropdown mb-2">
                                                                                <a class="font-size-16 text-muted"
                                                                                    role="button"
                                                                                    data-bs-toggle="dropdown"
                                                                                    aria-haspopup="true">
                                                                                    <i
                                                                                        class="mdi mdi-dots-horizontal"></i>
                                                                                </a>

                                                                                <div
                                                                                    class="dropdown-menu dropdown-menu-end">
                                                                                    <a class="dropdown-item"
                                                                                        href="#">Open</a>
                                                                                    <a class="dropdown-item"
                                                                                        href="#">Edit</a>
                                                                                    <a class="dropdown-item"
                                                                                        href="#">Rename</a>
                                                                                    <div class="dropdown-divider"></div>
                                                                                    <a class="dropdown-item"
                                                                                        href="#">Remove</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="avatar-xs me-2 mb-2">
                                                                            <div
                                                                                class="avatar-title bg-transparent rounded">
                                                                                <i
                                                                                    class="bx bxs-folder font-size-24 text-warning"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <div class="overflow-hidden me-auto">
                                                                                <h5
                                                                                    class="font-size-14 text-truncate mb-1">
                                                                                    <a href="javascript: void(0);"
                                                                                        class="text-body">${docList[i].name}</a>
                                                                                </h5>
                                                                                <p
                                                                                    class="text-muted text-truncate mb-0">
                                                                                    20
                                                                                    Files</p>
                                                                            </div>
                                                                            <!-- Keep this until Final. -->
                                                                            <!-- <div class="align-self-end ms-2">
                                                                            <p class="text-muted mb-0">8GB</p>
                                                                        </div> -->
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>`;
  }
}

function getInsideFolder(folderId, folderName) {
  let page = { folderId: folderId, folderName: folderName };
  pageListG.push(page);
  updatePageListAndPage(folderId);
}

function getOutsideFolder() {
  //To do check the flow again
  //This is to update back page button.
  lastPage = pageListG[pageListG.length - 1];
  if (lastPage === null) {
    document
      .getElementById("last-page-button")
      .setAttribute("disabled", "true");
  } else {
    localStorage.setItem("lastPage", JSON.stringify(lastPage));
    document.getElementById("last-page-button").removeAttribute("disabled");
  }

  pageListG.splice(pageListG.length - 1, 1);
  updatePageListAndPage(pageListG[pageListG.length - 1].folderId);
}

function updatePageListAndPage(folderId) {
  localStorage.setItem("pageList", JSON.stringify(pageListG));
  getDocs(folderId);

  //This is to update previous page button.
  if (pageListG.length === 1) {
    document
      .getElementById("previous-page-button")
      .setAttribute("disabled", "true");
  } else {
    document.getElementById("previous-page-button").removeAttribute("disabled");
  }
  updatePageBreadCrumb();
}

//To do check the flow and folder to folder back is incorrect.
function goToLastPage() {
  let { folderId, folderName } = JSON.parse(localStorage.getItem("lastPage"));
  getInsideFolder(folderId, folderName);
  localStorage.setItem("lastPage", "");
  document.getElementById("last-page-button").setAttribute("disabled", "true");
}

function updatePageBreadCrumb() {
  let pagePath = document.getElementById("page-path");
  if (pageListG.length > 3) {
    pagePath.innerHTML = ".. /";
  } else {
    pagePath.innerHTML = "My File /";
  }
  let indexlength;
  for (let index = 1; index < pageListG.length; index++) {
    pagePath.innerHTML =
      pagePath.innerHTML +
      `<a onclick='jumpToPage(${pageListG[index].folderId})'>${pageListG[index].folderName} </a>/`;
  }
}
