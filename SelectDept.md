## 标签:

&lt;fs:selectDepts&gt;

目前提供两种样式,theme:{simple,select}. ##
## simple:复选框样式(缺省值),select:下拉选择框. ##

### 注: ###
> #### 需要说明的两个属性sendTypeId和defDeptIds都是默认选中部门的条件,但它俩不能同时使用. ####
  1. endTypeId：区县的派遣类别确定选中的部门.
  1. efDeptIds：默认选中的部门id字符串,每个部门id用','隔开.例如"id1,id2,id3".

### Eg: ###
```
    <fs:selectDepts name="leader" theme="select"/>
 
    <!-- 定义div用于显示选中的checkbox部门名称 -->
    <div id="showDiv" style="border-bottom: 1px dotted #97B7E7; padding: 2 7 2 7;"></div>
 
    <!-- 如果theme="simple" 可以省略此属性. onclick事件需要我们自己定义,可以借助现有的js类,具体用法参照下面的js代码-->
    <fs:selectDepts name="deptIds" onclick="show()" sendTypeId="${model.sendType.id}" itemClass="checkbox" theme="simple"/>
```

```
    <!-- 具体的js代码 -->
    <script type="text/javascript" src="${ctx}/scripts/fsmis/ShowDeptName.js"></script>
    <script type="text/javascript">
        function show(){
            deptOperator.showDeptName("deptIds", "showDiv");
        }
 
        deptOperator.init("deptIds", "showDiv");
 
        //可以用于验证select选中的部门在checkbox中有无重复,deptOperator.getRepetitiveLeader("leader", "deptIds");返回重复部门的名称,如果无重复部门则返回空字符串.
        function checkRepetitiveLeader (){
            var repetitiveLeader = deptOperator.getRepetitiveLeader("leader", "deptIds");
            if (repetitiveLeader.length > 1){
                alert(repetitiveLeader + "为牵头部门.");
            }
        }
    </script>
```