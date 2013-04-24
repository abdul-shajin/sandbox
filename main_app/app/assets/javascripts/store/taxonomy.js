$(document).ready(function() {
  //$('[id^=taxon_taxonomy_id]').change(function() {
  	$(document).on('change','[id^=taxon_taxonomy_id]', function() {
    //window.location = 'http://j:3000/t/' + $('#taxon_taxonomy_id').val();
    selected = $(this).find('option:selected').data('tid')   
    console.log(selected);
    //$('#taxonomy_filter').append("<%= escape_javascript(render 'shared/taxonomy_filter') %>")
    $.getJSON('/access_child_dropdown/'+selected,function(data){
      var s = $("<select id='taxon_taxonomy_id_"+selected+"' name=\"taxonomy_name\" style='width:200px;' />");
      $(data).each(function() {
        var option = $('<option />');
        option.attr('value', this.taxon.permalink).text(this.taxon.name).attr('data-tid',this.taxon.id);
        option.appendTo(s);
      });
      console.log(s)
      $("[data-hook='taxon_sidebar_navigation']").append($(s));
    });
  });
});