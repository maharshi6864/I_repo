var url = "assets/json/",
  allProjectList = "",
  editList = !1,
  getJSON = function (t, e) {
    var a = new XMLHttpRequest();
    a.open("GET", url + t, !0),
      (a.responseType = "json"),
      (a.onload = function () {
        var t = a.status;
        e(200 === t ? null : t, a.response);
      }),
      a.send();
  };
function addProjectList() {
  var t = sessionStorage.getItem("inputValue");
  t &&
    ((t = JSON.parse(t)),
    Array.from(t).forEach(function (t) {
      allProjectList.push(t),
        $.fn.DataTable.isDataTable("#projectList-table") &&
          $("#projectList-table").DataTable().destroy(),
        loadProjectList(allProjectList);
    }));
  var e = sessionStorage.getItem("editInputValue");
  e &&
    ((e = JSON.parse(e)),
    (allProjectList = allProjectList.map(function (t) {
      return t.id == e.id ? e : t;
    })),
    $.fn.DataTable.isDataTable("#projectList-table") &&
      $("#projectList-table").DataTable().destroy(),
    loadProjectList(allProjectList));
}
function loadProjectList(t) {
  $("#projectList-table").DataTable({
    data: t,
    bLengthChange: !1,
    language: {
      oPaginate: {
        sNext: '<i class="mdi mdi-chevron-right"></i>',
        sPrevious: '<i class="mdi mdi-chevron-left"></i>',
      },
    },
    order: [[0, "desc"]],
    columns: [
      {
        data: "id",
        render: function (t, e, a) {
          return (
            '<div class="d-none">' +
            a.id +
            '</div><div class="avatar-sm bg-light rounded p-2">                    <img src="' +
            a.projectLogoImg +
            '" alt="" class="img-fluid rounded-circle">                    </div>'
          );
        },
      },
      {
        data: null,
        render: function (t, e, a) {
          return (
            '<div>                    <h5 class="text-truncate font-size-14"><a href="javascript: void(0);" class="text-dark">' +
            a.projectTitle +
            '</a></h5>                    <p class="text-muted mb-0">' +
            a.projectDesc +
            "</p>                    </div>"
          );
        },
      },
      { data: "dueDate" },
      {
        data: "status",
        render: function (t, e, a) {
          return isStatus(a.status);
        },
      },
      {
        data: "assignedto",
        render: function (t, e, a) {
          var s,
            r = a.assignedto,
            i = '<div class="avatar-group">';
          return (
            Array.from(r.slice(0, 3)).forEach(function (t) {
              i +=
                '<a href="javascript: void(0);" class="avatar-group-item" data-img="' +
                t.assigneeImg +
                '"  data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="' +
                t.assigneeName +
                '">                                    <img src="' +
                t.assigneeImg +
                '" alt="" class="rounded-circle avatar-xs" />                                </a>';
            }),
            3 < r.length &&
              ((s = r.length - 3),
              (i +=
                '<a href="javascript: void(0);" class="avatar-group-item"  data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="' +
                s +
                ' More">                        <div class="avatar-xs">                        <div class="avatar-title rounded-circle">' +
                s +
                "+</div>                        </div>                    </a>")),
            (i += "</div>")
          );
        },
      },
      {
        data: null,
        bSortable: !1,
        render: function (t, e, a) {
          return (
            '<div class="dropdown">                <a href="#" class="dropdown-toggle card-drop" data-bs-toggle="dropdown" aria-expanded="false">                    <i class="mdi mdi-dots-horizontal font-size-18"></i>                </a>                <ul class="dropdown-menu dropdown-menu-end">                    <li><a href="projects-create.html" class="dropdown-item edit-list" data-edit-id="' +
            a.id +
            '"><i class="mdi mdi-pencil font-size-16 text-success me-1"></i> Edit</a></li>                    <li><a href="#removeItemModal" data-bs-toggle="modal" class="dropdown-item remove-list" data-remove-id="' +
            a.id +
            '"><i class="mdi mdi-trash-can font-size-16 text-danger me-1"></i> Remove</a></li>                </ul>            </div>'
          );
        },
      },
    ],
    drawCallback: function (t) {
      tooltipElm(), projectListActions();
    },
  }),
    $("#searchTableList").keyup(function () {
      $("#projectList-table").DataTable().search($(this).val()).draw();
    }),
    $(".dataTables_length select").addClass("form-select form-select-sm"),
    $(".dataTables_paginate").addClass("pagination-rounded"),
    $(".dataTables_filter").hide();
}
function isStatus(t) {
  switch (t) {
    case "Completed":
      return '<span class="badge bg-success">' + t + "</span>";
    case "Inprogress":
      return '<span class="badge bg-warning">' + t + "</span>";
    case "Delay":
      return '<span class="badge bg-danger">' + t + "</span>";
  }
}
function _toConsumableArray(t) {
  if (Array.isArray(t)) {
    for (var e = 0, a = Array(t.length); e < t.length; e++) a[e] = t[e];
    return a;
  }
  return Array.from(t);
}
function tooltipElm() {
  var t = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  [].concat(_toConsumableArray(t)).map(function (t) {
    return new bootstrap.Tooltip(t);
  });
}
function projectListActions() {
  var a;
  Array.from(document.querySelectorAll(".edit-list")).forEach(function (e) {
    e.addEventListener("click", function (t) {
      (a = e.getAttribute("data-edit-id")),
        (allProjectList = allProjectList.map(function (t) {
          return (
            t.id == a &&
              sessionStorage.setItem("editInputValue", JSON.stringify(t)),
            t
          );
        }));
    });
  }),
    Array.from(document.querySelectorAll(".remove-list")).forEach(function (e) {
      e.addEventListener("click", function (t) {
        (getid = e.getAttribute("data-remove-id")),
          document
            .getElementById("remove-item")
            .addEventListener("click", function () {
              var e,
                t =
                  ((e = getid),
                  allProjectList.filter(function (t) {
                    return t.id != e;
                  }));
              (allProjectList = t),
                $.fn.DataTable.isDataTable("#projectList-table") &&
                  $("#projectList-table").DataTable().destroy(),
                loadProjectList(allProjectList),
                document.getElementById("close-removeProjectModal").click();
            });
      });
    });
}
getJSON("project-list.json", function (t, e) {
  null !== t
    ? console.log("Something went wrong: " + t)
    : (loadProjectList((allProjectList = e)), addProjectList());
}),
  document
    .getElementById("addProject-btn")
    .addEventListener("click", function () {
      sessionStorage.setItem("editInputValue", "");
    });