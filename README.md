# Test
깃허브 연동
# 게시물 작성
Controller 부분에서 목록 불러오는 부분은 데이터 베이스에서 GET 하여 가져왔지만 작성 부분에서는 POST 사용

먼저 게시물을 작성하여 가져오고
```java
// 게시물 작성
@RequestMapping(value = "/write", method = RequestMethod.GET)
public void getWirte() throws Exception {

}
```
작성한후에 연동되어 있는 데이터 베이스에 넣어주기위해 Mapper를 통해 쿼리문을 작성해 주는데
<!-- 게시물 작성 -->
<insert id="write" parameterType="com.board.domain.BoardVO">
 insert into
  tbl_board(title, content, writer)
   values(#{title}, #{content}, #{writer})
</insert>
실행할떄 no database select 오류가 뜨면 마지막 줄에
from database 적어줄것 !!
아니면 root-context 부분에 
<property name="url" value="jdbc:mariadb://127.0.0.1:3306/스키마이름" />
적을것


후에 게시물을 서버에 올림
```java
//@RequestMapping 은 주소에 있는 특정한 값을 가져옴
@RequestMapping(value = "/write", method = RequestMethod.POST)
Public String posttWirte(BoardVO vo) throws Exception {
  service.write(vo);
  
  return "redirect:/board/list";
}
```

