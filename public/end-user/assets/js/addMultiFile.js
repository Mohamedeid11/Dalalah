$(function () {
  let fileINPs = $('.multi_image_input');

  fileINPs.each(function () {
    let container = $(this).parent().parent();
    let fileINP = $(this);
    let dtFile = new DataTransfer();
    dtFile.files = $(this).files;

    $(this).change(function () {
      let files = this.files;
      if (files.length) {
        $.each(files, function (idx, file) {
          // statment
          dtFile.items.add(file);
          makeFileURL(file);
        });
      }
      $(this).prop("files", dtFile.files);
    });

    function makeFileURL(file) {
      let FR = new FileReader(file);
      FR.onload = function (e) {
        addIMG(file.name, e.target.result);
      };
      FR.readAsDataURL(file);
    }

    function addIMG(name, src) {
      let img = `<div class="paper" data-filename="${name}">
                      <button type="button">x</button>
                      <img
                      src="${src}"
                      alt="paper img" />
                  </div>`;
      container.prepend(img);
      paperBTNEvent();
    }

    function paperBTNEvent() {
      $(".paper button").click(removePaper);
    }

    function removePaper() {
      paper = $(this).parent();
      filename = paper.data("filename");
      paper.remove();

      $.each(dtFile.files, function (idx, file) {
        if (file && filename === file.name) {
          dtFile.items.remove(idx);
        }
      });
      fileINP.prop("files", dtFile.files);
    }

    function addFilesOnLoad() {
      $.each(dtFile.files, function (idx, file) {
        makeFileURL(file);
      });
    }

    // First time Excuting
    addFilesOnLoad();
    paperBTNEvent();
  });
});
