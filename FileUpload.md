把附件上传部分的js抽取出来，整理成一个对象。以后统一调用，避免在每个页面都写大段js代码。具体使用如下：
```
<script type="text/javascript" language="javascript" src="${ctx}/scripts/fsmis/attachments.js"></script>
<script type="text/javascript">
  util = new fileUtil();
  //设置上传控件的样式，比如宽度
  util.style = "width:300px;";
  //设置删除图标
  util.deleteIcon = "${ctx}/images/exticons/cross.gif";
</script>
&nbsp;
<a href="#" onclick='util.add("fileUpload")'>增加附件</a>
<table>
  <tbody id="fileUpload"></tbody>
</table>
```