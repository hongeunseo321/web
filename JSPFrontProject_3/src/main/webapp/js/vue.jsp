<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
  width: 960px;
  margin: 0px auto;
}

p {
 overflow: hidden;
 white-space: nowrap;
 text-overflow: ellipsis;
}
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
  <div class="container">
   <%--
      pageContext.include() => 태그형으로 제작 
      => JSP안에 특정부분에 다른 JSP를 추가 
      => 데이터를 공유한다 
      => Spring에서도 사용 : 화면 분할 
    --%>
   <div style="height: 20px"></div>
   <div class="row">
        <div class="col-md-3" v-for="vo in find_list">
		    <div class="thumbnail">
		      <a href="#">
		        <img :src="vo.poster" style="width:230px;height: 150px">
		        <div class="caption">
		          <p>{{vo.name}}</p>
		        </div>
		      </a>
		    </div>
		  </div>
   </div>
   <div style="height:20px"></div>
   <div class="row text-center">
     <ul class="pagination">
     <li v-if="startPage>1"><a class="link" @click="prev()">&lt;</a></li>
	 <li v-for="i in range(startPage,endPage)" :class="i===curpage?'active':''"><a class="link" @click="pageChange(i)">{{i}}</a></li>
	 <li v-if="endPage<totalpage"><a class="link" @click="next()">&gt;</a></li>
     </ul>
   </div>
  </div>
     <script>
     let findApp=Vue.createApp({
    	 data(){
    		 return {
    			 find_list:[],
    			 curpage:1,
    			 totalpage:0,
    			 startPage:0,
    			 endPage:0
    		 }
    	 },
    	 mounted(){
    		 this.dataRecv()
    	 },
    	 methods:{
    		 range(start,end){
     			let arr=[]
     			let len=end-start
     			for(let i=0;i<=len;i++)
     			{
     			    arr[i]=start
     			    start++
     			}
     			return arr
     		},
    		 prev(){
    			 this.curpage=this.startPage-1
    			 this.dataRecv()
    		 },
    		 next(){
    			 this.curpage=this.endPage+1
    			 this.dataRecv()
    		 },
    		 pageChange(page){
    			this.curpage=page
    			this.dataRecv()
    		 },
    		 find(){
    			if(this.address==="")
    			{
    				alert("검색어 입력")
    				this.$refs.address.focus()
    				return
    			}
    			this.curpage=1
    			this.dataRecv()
    		 },
    		 dataRecv(){
    			 axios.get("../food/list.do",{
    				 params:{
    					 page:this.curpage
    				 }
    			 }).then(response=>{
    				 console.log(response.data)
    				 this.find_list=response.data
    				 this.curpage=response.data[0].curpage
    				 this.totalpage=response.data[0].totalpage
    				 this.startPage=response.data[0].startPage
    				 this.endPage=response.data[0].endPage
    				 
    			 })
    		 }
    	 }
     }).mount('.container')
    </script>
  
</body>
</html>