
/*后台返回的视频分页信息*/
var pageInfo;

/**
 *获取视频信息并展示
 */
function showVideo(uri,pageNum,pageSize) {
    var videoResult = '';
    var videoDiv = $(".videoDiv");
    var videos;

    $.get(uri +"/"+ pageNum +"/"+pageSize, function (data) {
        pageInfo = data;
        videos = data.list;

        if (videos.length == 0) {
            videoResult = "<div style='width:100%; height:500px;text-align: center; '><h1 style='color: #777777;line-height: 500px;'>抱歉，没有数据哦！</h1></div>";
            videoDiv.html(videoResult);
        }else{
            for (var i = 0; i < videos.length; i++) {
                var video = " <li>\n" +
                    " <a href='video/detail/"+videos[i].id+"' target='_blank'> <img src= \"" + videos[i].imgSrc + "\" title=\"" + videos[i].name + "\" alt=\"" + videos[i].name + "\"></a><br>\n" +
                    " <a href='video/detail/"+videos[i].id+"' class=\"video-name-text\" title='" + videos[i].name + "' target='_blank'><p class=\"video-name-text\">" + videos[i].name + "</p></a>\n" +
                    " <p class=\"video-description-text\">主演：" + videos[i].starring + "</p>\n" +
                    " </li>";
                //一个ui包含6个li
                if (i % 6 == 0) {
                    videoResult += "</ul>\n<ul class=\"videoList\">\n" + video;
                }else {
                    videoResult += video;
                }
            }
        }
        videoDiv.html(videoResult);
        /*layui分页按钮*/
        layui.use(['laypage'], function() {
            var layPage = layui.laypage;
            layPage.render({
                elem: 'pagebtn'
                , count: pageInfo.count
                , limit: pageInfo.pageSize
                , curr: pageInfo.pageNum
                , layout: ['count', 'prev', 'page', 'next', 'skip']
                , hash: 'skip'
                , jump: function (obj, first) {
                    if (!first) {
                        pageInfo.pageNum = obj.curr;
                        showVideo(uri,obj.curr,pageInfo.pageSize);
                        location.href = '#skip';
                    }
                }
            });
        });
    });
}
