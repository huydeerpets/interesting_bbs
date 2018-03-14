<div class="row">
  <div class="col-md-9">
  <div class="alert alert-info">以下是：{{.PageTitle}}</div>
    <div class="panel panel-default">
    {{ if .IsLogin }}
      <div class="panel-body paginate-bot">
        <h3>{{.Tips}}</h3>
        {{range .Page.List}}
        <div class="media">
          <div class="media-left">
            <a href="/user/{{.User.Username}}"><img src="{{.User.Avatar}}" class="avatar" alt="{{.User.Username}}"></a>
          </div>
          <div class="media-body">
            <div class="title">
              <a href="/topic/{{.Id}}?flag=true" class="fragments">{{.Title}}</a>
            </div>
            <div class="fragments">
              {{.Content}}
            </div>
            <p class="gray">
              <span class="label label-primary fragments">{{.Section.Name}}</span>
              <span>•</span>
              <span><a href="/user/{{.User.Username}}" class="fragments">{{.User.Username}}</a></span>
              <span class="hidden-sm hidden-xs">•</span>
              <span class="hidden-sm hidden-xs">{{.ReplyCount}}个回复</span>
              <span class="hidden-sm hidden-xs">•</span>
              <span class="hidden-sm hidden-xs">{{.View}}次浏览</span>
              <span>•</span>
              <span class="hidden-sm hidden-xs">{{.CollectCount}}次收藏</span>
              <span>•</span>
              <span>{{.InTime | timeago}}</span>
              {{if .LastReplyUser}}
                <span>•</span>
                <span>最后回复来自 <a href="/user/{{.LastReplyUser.Username}}">{{.LastReplyUser.Username}}</a></span>
              {{end}}
            </p>
          </div>
        </div>
        <div class="divide mar-top-5"></div>
        {{end}}
        <ul id="page"></ul>
      </div>
      {{else}}
        <div class="panel-body paginate-bot">
            <p>登录后才能推荐给你喔</p>
        </div>
      {{end}}
    </div>
  </div>
  <div class="col-md-3 hidden-sm hidden-xs">
    {{if .IsLogin}}
      {{template "components/user_info.tpl" .}}
      {{template "components/topic_create.tpl" .}}
    {{else}}
      {{template "components/welcome.tpl" .}}
    {{end}}
    {{template "components/otherbbs.tpl" .}}
    {{template "components/bbs_announce.tpl" .}}
  </div>
</div>
<script type="text/javascript" src="/static/js/bootstrap-paginator.min.js"></script>
<script type="text/javascript">



  $(function () {
    $("#tab_{{.S}}").addClass("active");
    $(".fragments").each(function() {
        var $this = $(this);
        var fragment = $this.text();

        //console.log("1    --"+fragment.replace(/<mark/g, '<font color="red"').replace(/mark\>/g, 'font>'));

        $this.html(fragment.replace(/<mark/g, '<font color="red"').replace(/mark\>/g, 'font>'));
    });

    $("#page").bootstrapPaginator({
      currentPage: '{{.Page.PageNo}}',
      totalPages: '{{.Page.TotalPage}}',
      bootstrapMajorVersion: 3,
      size: "small",
      onPageClicked: function(e,originalEvent,type,page){
        var s = {{.S}};
        if (s > 0) {
          window.location.href = "/search?p=" + page + "&q={{.q}}"
        } else {
          window.location.href = "/search?p=" + page + "&q={{.q}}"
        }
      }
    });
  });
</script>